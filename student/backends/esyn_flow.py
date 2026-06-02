"""E-Syn expression-rewriting wrapper.

The staged E-Syn checkout optimizes Boolean expressions in its own S-expression
grammar.  It does not expose an AIG-in/AIG-out command.  This module therefore
supports the expression-level flow directly and makes the missing AIG conversion
contract explicit for candidate generation.
"""

from collections import OrderedDict
import argparse
import copy
import hashlib
import os
from pathlib import Path
import re
import shutil
import subprocess
import sys
import time

if __package__ in (None, ""):
    sys.path.insert(0, str(Path(__file__).resolve().parents[2]))

from student.backends.abc_flow import evaluate_aig
from student.common.abc import run_abc


class EsynError(RuntimeError):
    """Raised when an E-Syn tool invocation or setup check fails."""


class EsynContractError(EsynError):
    """Raised when the requested flow lacks a defined conversion contract."""


class EsynRunResult:
    def __init__(self, work_dir, input_sexpr, output_paths, stdout, stderr, runtime_sec):
        self.work_dir = Path(work_dir)
        self.input_sexpr = Path(input_sexpr)
        self.output_paths = [Path(path) for path in output_paths]
        self.stdout = stdout
        self.stderr = stderr
        self.runtime_sec = runtime_sec

    @property
    def first_output(self):
        if not self.output_paths:
            return None
        return self.output_paths[0]


_SAFE_ID_RE = re.compile(r"[^A-Za-z0-9_.-]+")


def _project_root():
    return Path(__file__).resolve().parents[2]


def _existing(path):
    if path.is_file() or path.is_dir():
        return path
    return None


def discover_paths(root=None):
    if root is None:
        root = _project_root()
    else:
        root = Path(root)

    esyn_root = root / "student" / "tools" / "esyn" / "src"
    conda_env = root / "student" / "tools" / "conda-env"
    return OrderedDict(
        [
            ("esyn_root", _existing(esyn_root)),
            ("e_rewriter", _existing(esyn_root / "e-rewriter" / "target" / "release" / "e-rewriter")),
            ("s_converter", _existing(esyn_root / "s-converter" / "target" / "release" / "s-converter")),
            ("graph_info_py", _existing(esyn_root / "graph_info.py")),
            ("conda_env_bin", _existing(conda_env / "bin")),
            ("conda_python", _existing(conda_env / "bin" / "python")),
            (
                "circuitparser",
                _existing(
                    esyn_root
                    / "alpha_utils"
                    / "circuitparser"
                    / "target"
                    / "release"
                    / "circuitparser"
                ),
            ),
            (
                "infix2lisp",
                _existing(
                    esyn_root
                    / "alpha_utils"
                    / "infix2lisp"
                    / "target"
                    / "release"
                    / "s-converter"
                ),
            ),
            (
                "lisp2infix",
                _existing(
                    esyn_root
                    / "alpha_utils"
                    / "lisp2infix"
                    / "target"
                    / "release"
                    / "s-converter"
                ),
            ),
        ]
    )


def _is_executable(path):
    return path is not None and path.is_file() and os.access(str(path), os.X_OK)


def tool_status(root=None):
    paths = discover_paths(root=root)
    status = OrderedDict()
    for name, path in paths.items():
        executable = name not in ("esyn_root", "graph_info_py", "conda_env_bin")
        status[name] = {
            "path": "" if path is None else str(path),
            "exists": path is not None,
            "executable": (not executable) or _is_executable(path),
        }
    return status


def _require_expression_tools(root=None):
    paths = discover_paths(root=root)
    required = ["esyn_root", "e_rewriter", "s_converter", "graph_info_py", "conda_env_bin", "conda_python"]
    missing = [name for name in required if paths.get(name) is None]
    not_executable = [
        name
        for name in ("e_rewriter", "s_converter", "conda_python")
        if paths.get(name) is not None and not _is_executable(paths[name])
    ]
    if missing or not_executable:
        details = []
        if missing:
            details.append("missing: {0}".format(", ".join(missing)))
        if not_executable:
            details.append("not executable: {0}".format(", ".join(not_executable)))
        raise EsynError("E-Syn expression tools are not ready ({0}).".format("; ".join(details)))
    return paths


def _esyn_env(root=None):
    paths = _require_expression_tools(root=root)
    env = os.environ.copy()
    env["PATH"] = "{0}:{1}".format(paths["conda_env_bin"], env.get("PATH", ""))
    env["PYTHONNOUSERSITE"] = "1"
    return env


def _run_command(command, cwd=None, env=None, timeout=None):
    command = [str(part) for part in command]
    try:
        return subprocess.run(
            command,
            cwd=None if cwd is None else str(cwd),
            env=env,
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            universal_newlines=True,
            timeout=timeout,
        )
    except subprocess.TimeoutExpired as exc:
        raise EsynError("Command timed out after {0}s: {1}".format(timeout, " ".join(command))) from exc


def _failure_message(command, result):
    chunks = [
        "Command failed with return code {0}: {1}".format(result.returncode, " ".join(str(x) for x in command))
    ]
    if result.stdout:
        chunks.append("stdout:\n{0}".format(result.stdout[-4000:]))
    if result.stderr:
        chunks.append("stderr:\n{0}".format(result.stderr[-4000:]))
    return "\n".join(chunks)


def prepare_esyn_work_dir(work_dir, root=None):
    paths = _require_expression_tools(root=root)
    work_dir = Path(work_dir)
    for child in ("out_dot", "graph_info", "test_data_beta_runner"):
        (work_dir / child).mkdir(parents=True, exist_ok=True)
    shutil.copyfile(str(paths["graph_info_py"]), str(work_dir / "graph_info.py"))
    return work_dir


def run_s_converter(input_path, output_path, mode=None, root=None, timeout=30):
    paths = _require_expression_tools(root=root)
    input_path = Path(input_path)
    output_path = Path(output_path)
    output_path.parent.mkdir(parents=True, exist_ok=True)
    command = [paths["s_converter"], input_path, output_path]
    if mode:
        command.append(mode)
    result = _run_command(command, env=_esyn_env(root=root), timeout=timeout)
    if result.returncode != 0:
        raise EsynError(_failure_message(command, result))
    if not output_path.is_file() or output_path.stat().st_size == 0:
        raise EsynError("s-converter completed but did not create a non-empty output: {0}".format(output_path))
    return output_path


def _egg_index(path):
    stem = Path(path).stem
    prefix = "output_from_egg"
    if stem.startswith(prefix):
        try:
            return int(stem[len(prefix) :])
        except ValueError:
            return 10**9
    return 10**9


def run_e_rewriter(input_sexpr, work_dir, root=None, timeout=360):
    paths = _require_expression_tools(root=root)
    work_dir = prepare_esyn_work_dir(work_dir, root=root)
    input_sexpr = Path(input_sexpr)
    if not input_sexpr.is_file():
        raise EsynError("E-Syn input S-expression file not found: {0}".format(input_sexpr))

    unused_output = work_dir / "unused_e_rewriter_output.txt"
    command = [paths["e_rewriter"], input_sexpr, unused_output]
    start = time.time()
    result = _run_command(command, cwd=work_dir, env=_esyn_env(root=root), timeout=timeout)
    runtime_sec = time.time() - start
    if result.returncode != 0:
        raise EsynError(_failure_message(command, result))

    output_dir = work_dir / "test_data_beta_runner"
    output_paths = sorted(output_dir.glob("output_from_egg*.txt"), key=_egg_index)
    output_paths = [
        path
        for path in output_paths
        if path.is_file() and path.stat().st_size > 0 and path.stat().st_mtime >= start - 1.0
    ]
    if not output_paths:
        raise EsynError("e-rewriter completed but produced no non-empty output_from_egg*.txt files in {0}".format(output_dir))
    return EsynRunResult(
        work_dir=work_dir,
        input_sexpr=input_sexpr,
        output_paths=output_paths,
        stdout=result.stdout,
        stderr=result.stderr,
        runtime_sec=runtime_sec,
    )


def esyn_expression_candidates(input_expr, work_dir, input_format="sexpr", root=None, timeout=360):
    work_dir = prepare_esyn_work_dir(work_dir, root=root)
    input_format = input_format.lower()
    if input_format not in ("sexpr", "infix"):
        raise EsynError("input_format must be 'sexpr' or 'infix', got: {0}".format(input_format))

    if input_format == "sexpr":
        input_sexpr = work_dir / "input.sexpr"
        input_sexpr.write_text(input_expr)
    else:
        input_infix = work_dir / "input.infix"
        input_infix.write_text(input_expr)
        input_sexpr = work_dir / "input.sexpr"
        run_s_converter(input_infix, input_sexpr, mode="lisp", root=root, timeout=30)

    return run_e_rewriter(input_sexpr, work_dir, root=root, timeout=timeout)


def run_expression_smoke(work_dir, root=None, timeout=60):
    return esyn_expression_candidates(
        input_expr="(a * b)",
        work_dir=work_dir,
        input_format="infix",
        root=root,
        timeout=timeout,
    )


_ADAPTER_MISS = object()


def _safe_id_part(value):
    value = _SAFE_ID_RE.sub("_", str(value)).strip("_")
    if not value:
        return "out"
    return value[:64]


def _case_from_eqn_path(eqn_path):
    return Path(eqn_path).stem


def _normalize_expr_text(expr):
    return " ".join(str(expr).split())


def _file_sha256(path):
    digest = hashlib.sha256()
    with Path(path).open("rb") as handle:
        for chunk in iter(lambda: handle.read(1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest()


def _load_esyn_eqn():
    try:
        from student.backends import esyn_eqn
    except ImportError as exc:
        raise EsynContractError(
            "student.backends.esyn_eqn is not available. "
            "Seed generation needs an EQN adapter that can read/write EQN and convert outputs to/from E-Syn S-expressions. "
            "Original import error: {0}".format(exc)
        )
    return esyn_eqn


def _call_optional(func, *args):
    try:
        return func(*args)
    except TypeError:
        return _ADAPTER_MISS


def _call_first(module, names, arg_sets):
    last_error = None
    for name in names:
        func = getattr(module, name, None)
        if not callable(func):
            continue
        for args in arg_sets:
            try:
                result = func(*args)
            except TypeError as exc:
                last_error = exc
                continue
            return result
    if last_error is not None:
        return _ADAPTER_MISS
    return _ADAPTER_MISS


def _eqn_read(module, eqn_path):
    result = _call_first(
        module,
        ("read_eqn", "read_eqn_file", "load_eqn", "parse_eqn"),
        [((Path(eqn_path),)), ((str(eqn_path),))],
    )
    if result is _ADAPTER_MISS:
        raise EsynContractError("student.backends.esyn_eqn needs read_eqn_file(path) or equivalent.")
    return result


def _output_name(value, fallback):
    for attr in ("name", "output", "id"):
        if hasattr(value, attr):
            attr_value = getattr(value, attr)
            if attr_value is not None:
                return str(attr_value)
    if isinstance(value, str):
        return value
    return "po{0}".format(fallback)


def _normalize_outputs(value):
    outputs = []
    if value is None:
        return outputs
    if callable(value):
        value = value()
    if isinstance(value, str):
        return [(value, value)]
    if isinstance(value, dict):
        for index, item in enumerate(value.items()):
            name, ref = item
            outputs.append((str(name), ref))
        return outputs
    try:
        items = list(value)
    except TypeError:
        return [(_output_name(value, 0), value)]
    for index, item in enumerate(items):
        outputs.append((_output_name(item, index), item))
    return outputs


def _eqn_outputs(module, circuit):
    for name in ("output_names", "outputs", "get_outputs", "iter_outputs"):
        func = getattr(module, name, None)
        if callable(func):
            outputs = _normalize_outputs(func(circuit))
            if outputs:
                return outputs
    for attr in ("output_names", "outputs", "outorder", "po_names", "pos"):
        if hasattr(circuit, attr):
            outputs = _normalize_outputs(getattr(circuit, attr))
            if outputs:
                return outputs
    if isinstance(circuit, dict):
        for key in ("output_names", "outputs", "outorder", "po_names", "pos", "expressions"):
            outputs = _normalize_outputs(circuit.get(key))
            if outputs:
                return outputs
    raise EsynContractError("student.backends.esyn_eqn needs circuit.outorder, output_names(circuit), or equivalent.")


def _eqn_get_output_expr(module, circuit, output_name, output_ref):
    for name in ("get_output_expr", "output_expr", "get_expression"):
        func = getattr(module, name, None)
        if callable(func):
            for key in (output_name, output_ref):
                result = _call_optional(func, circuit, key)
                if result is not _ADAPTER_MISS:
                    return result
    containers = []
    for attr in ("assignments_by_name", "expressions", "output_exprs", "outputs"):
        if hasattr(circuit, attr):
            containers.append(getattr(circuit, attr))
    if isinstance(circuit, dict):
        for key in ("assignments_by_name", "expressions", "output_exprs", "outputs"):
            containers.append(circuit.get(key))
    for container in containers:
        if isinstance(container, dict) and output_name in container:
            return container[output_name]
    return _ADAPTER_MISS


def _eqn_output_to_sexpr(module, circuit, output_name, output_ref):
    result = _call_first(
        module,
        ("output_to_sexpr", "output_sexpr", "to_output_sexpr", "eqn_output_to_sexpr"),
        [
            (circuit, output_name),
            (circuit, output_ref),
            (output_ref,),
        ],
    )
    if result is not _ADAPTER_MISS:
        return str(result)

    expr = _eqn_get_output_expr(module, circuit, output_name, output_ref)
    if expr is not _ADAPTER_MISS:
        result = _call_first(
            module,
            ("eqn_expr_to_sexpr", "expr_to_sexpr", "expression_to_sexpr", "to_sexpr"),
            [
                (expr,),
                (circuit, output_name),
                (circuit, output_ref),
            ],
        )
        if result is not _ADAPTER_MISS:
            return str(result)

    raise EsynContractError(
        "student.backends.esyn_eqn needs output_to_sexpr(circuit, output_name) "
        "or expr_to_sexpr(get_output_expr(...))."
    )


def _eqn_clone(module, circuit):
    for name in ("clone", "clone_circuit", "copy_circuit"):
        func = getattr(module, name, None)
        if callable(func):
            result = _call_optional(func, circuit)
            if result is not _ADAPTER_MISS:
                return result
    try:
        return copy.deepcopy(circuit)
    except Exception as exc:
        raise EsynContractError(
            "student.backends.esyn_eqn needs clone(circuit) or deepcopy-compatible circuit objects: {0}".format(exc)
        )


def _sexpr_to_expr(module, sexpr):
    result = _call_first(module, ("sexpr_to_eqn_expr", "sexpr_to_expr", "parse_sexpr", "from_sexpr"), [((sexpr,))])
    return result


def _eqn_replace_output_from_sexpr(module, circuit, output_name, output_ref, replacement_sexpr):
    target = _eqn_clone(module, circuit)
    for name in (
        "replace_output_from_sexpr",
        "with_output_replaced_from_sexpr",
        "replace_output_sexpr",
        "with_output_sexpr",
    ):
        func = getattr(module, name, None)
        if not callable(func):
            continue
        for key in (output_name, output_ref):
            result = _call_optional(func, target, key, replacement_sexpr)
            if result is not _ADAPTER_MISS:
                return target if result is None else result

    replacement_expr = _sexpr_to_expr(module, replacement_sexpr)
    if replacement_expr is not _ADAPTER_MISS:
        for name in ("replace_output", "with_output_replaced", "set_output_expr"):
            func = getattr(module, name, None)
            if not callable(func):
                continue
            for key in (output_name, output_ref):
                result = _call_optional(func, target, key, replacement_expr)
                if result is not _ADAPTER_MISS:
                    return target if result is None else result

        eqn_circuit = getattr(module, "EqnCircuit", None)
        eqn_assignment = getattr(module, "EqnAssignment", None)
        if eqn_circuit is not None and eqn_assignment is not None and hasattr(target, "assignments"):
            assignments = []
            replaced = False
            for assignment in target.assignments:
                if getattr(assignment, "target", None) == output_name:
                    assignments.append(eqn_assignment(output_name, replacement_expr))
                    replaced = True
                else:
                    assignments.append(assignment)
            if replaced:
                return eqn_circuit(
                    getattr(target, "inorder", []),
                    getattr(target, "outorder", []),
                    assignments,
                )

    raise EsynContractError(
        "student.backends.esyn_eqn needs replace_output_from_sexpr(circuit, output_name, sexpr) "
        "or sexpr_to_expr() plus replace_output()."
    )


def _eqn_write(module, circuit, eqn_path):
    eqn_path = Path(eqn_path)
    eqn_path.parent.mkdir(parents=True, exist_ok=True)
    for name in ("write_eqn", "write_eqn_file", "save_eqn", "dump_eqn"):
        func = getattr(module, name, None)
        if not callable(func):
            continue
        for args in ((circuit, eqn_path), (circuit, str(eqn_path)), (eqn_path, circuit), (str(eqn_path), circuit)):
            result = _call_optional(func, *args)
            if result is not _ADAPTER_MISS:
                if not eqn_path.is_file() or eqn_path.stat().st_size == 0:
                    raise EsynError("EQN writer completed but did not create a non-empty file: {0}".format(eqn_path))
                return eqn_path
    raise EsynContractError("student.backends.esyn_eqn needs write_eqn_file(circuit, path) or equivalent.")


def synthesize_eqn_to_aig(eqn_path, aig_path, abc, timeout=60):
    eqn_path = Path(eqn_path)
    aig_path = Path(aig_path)
    if not eqn_path.is_file():
        raise EsynError("EQN input not found for ABC synthesis: {0}".format(eqn_path))
    aig_path.parent.mkdir(parents=True, exist_ok=True)
    command = "read_eqn {eqn}; strash; write_aiger -s {aig}".format(eqn=eqn_path, aig=aig_path)
    try:
        run_abc(abc, command, timeout=timeout)
    except subprocess.TimeoutExpired as exc:
        raise EsynError("ABC EQN synthesis timed out after {0}s for {1}".format(timeout, eqn_path)) from exc
    except RuntimeError as exc:
        raise EsynError("ABC EQN synthesis failed for {0}: {1}".format(eqn_path, exc)) from exc
    if not aig_path.is_file() or aig_path.stat().st_size == 0:
        raise EsynError("ABC EQN synthesis did not create a non-empty AIG: {0}".format(aig_path))
    return aig_path


def write_aig_to_eqn(aig_path, eqn_path, abc, timeout=60):
    aig_path = Path(aig_path)
    eqn_path = Path(eqn_path)
    if not aig_path.is_file():
        raise EsynError("AIG input not found for ABC write_eqn: {0}".format(aig_path))
    eqn_path.parent.mkdir(parents=True, exist_ok=True)
    command = "read {aig}; write_eqn {eqn}".format(aig=aig_path, eqn=eqn_path)
    try:
        run_abc(abc, command, timeout=timeout)
    except subprocess.TimeoutExpired as exc:
        raise EsynError("ABC write_eqn timed out after {0}s for {1}".format(timeout, aig_path)) from exc
    except RuntimeError as exc:
        raise EsynError("ABC write_eqn failed for {0}: {1}".format(aig_path, exc)) from exc
    if not eqn_path.is_file() or eqn_path.stat().st_size == 0:
        raise EsynError("ABC write_eqn did not create a non-empty EQN: {0}".format(eqn_path))
    return eqn_path


def _summarize_failures(failures, limit=5):
    if not failures:
        return ""
    shown = failures[:limit]
    suffix = "" if len(failures) <= limit else " (+{0} more)".format(len(failures) - limit)
    return "; ".join(shown) + suffix


def esyn_seed_candidates_from_eqn(
    eqn_path,
    truth,
    abc,
    work_dir,
    case=None,
    parent_id=None,
    top_n=3,
    root=None,
    timeout=300,
    synth_timeout=60,
    eval_timeout=60,
    mode="per-output",
    candidate_prefix=None,
    max_outputs=None,
):
    """Generate evaluated E-Syn seed candidates from an EQN file.

    The first implementation is deliberately conservative: in ``per-output``
    mode each candidate starts from the original EQN and replaces exactly one
    output with one rewritten E-Syn expression.  No cross-output combinations
    are formed.
    """

    mode = mode.replace("_", "-").lower()
    if mode not in ("per-output", "whole-vector"):
        raise EsynError("Unknown E-Syn seed mode: {0}".format(mode))
    if mode == "whole-vector":
        raise EsynContractError("E-Syn whole-vector replacement is not enabled yet; use mode='per-output'.")
    if top_n is None or top_n < 1:
        raise EsynError("top_n must be >= 1")
    if max_outputs is not None and max_outputs < 1:
        raise EsynError("max_outputs must be >= 1 when provided")

    eqn_module = _load_esyn_eqn()
    eqn_path = Path(eqn_path)
    if not eqn_path.is_file():
        raise EsynError("Input EQN file not found: {0}".format(eqn_path))

    case = case or _case_from_eqn_path(eqn_path)
    parent_id = "{0}_eqn".format(eqn_path.stem) if parent_id is None else str(parent_id)
    tool_chain = "esyn_per_output_single"
    candidate_prefix = candidate_prefix or "{0}_{1}".format(case, tool_chain)
    flow_dir = Path(work_dir) / case / tool_chain
    flow_dir.mkdir(parents=True, exist_ok=True)

    circuit = _eqn_read(eqn_module, eqn_path)
    outputs = _eqn_outputs(eqn_module, circuit)
    if max_outputs is not None:
        outputs = outputs[:max_outputs]
    candidates = []
    failures = []
    seen_rewrites = set()
    seen_aigs = set()

    for output_index, output in enumerate(outputs):
        output_name, output_ref = output
        safe_output = _safe_id_part(output_name)
        output_dir = flow_dir / "po{0}_{1}".format(output_index, safe_output)

        try:
            input_sexpr = _eqn_output_to_sexpr(eqn_module, circuit, output_name, output_ref)
            rewrite_result = esyn_expression_candidates(
                input_expr=input_sexpr,
                work_dir=output_dir / "rewrite",
                input_format="sexpr",
                root=root,
                timeout=timeout,
            )
        except EsynContractError:
            raise
        except EsynError as exc:
            failures.append("output {0}: {1}".format(output_name, exc))
            continue

        selected_for_output = 0
        for rewrite_path in rewrite_result.output_paths:
            rewritten_sexpr = rewrite_path.read_text().strip()
            normalized = _normalize_expr_text(rewritten_sexpr)
            if not normalized:
                continue
            rewrite_key = (str(output_name), normalized)
            if rewrite_key in seen_rewrites:
                continue
            if selected_for_output >= top_n:
                break
            seen_rewrites.add(rewrite_key)
            selected_for_output += 1

            candidate_id = "{0}_po{1}_{2}_r{3:02d}".format(
                candidate_prefix,
                output_index,
                safe_output,
                selected_for_output,
            )
            candidate_dir = output_dir / "candidate_{0:02d}".format(selected_for_output)
            candidate_eqn = candidate_dir / "{0}.eqn".format(candidate_id)
            candidate_aig = candidate_dir / "{0}.aig".format(candidate_id)

            generation_start = time.time()
            try:
                rewritten_circuit = _eqn_replace_output_from_sexpr(
                    eqn_module,
                    circuit,
                    output_name,
                    output_ref,
                    rewritten_sexpr,
                )
                _eqn_write(eqn_module, rewritten_circuit, candidate_eqn)
                synthesize_eqn_to_aig(candidate_eqn, candidate_aig, abc=abc, timeout=synth_timeout)
                aig_hash = _file_sha256(candidate_aig)
                if aig_hash in seen_aigs:
                    continue
                seen_aigs.add(aig_hash)
            except EsynContractError:
                raise
            except (EsynError, OSError) as exc:
                failures.append("{0}: {1}".format(candidate_id, exc))
                continue

            generation_sec = time.time() - generation_start + rewrite_result.runtime_sec
            try:
                candidate = evaluate_aig(
                    case=case,
                    candidate_id=candidate_id,
                    parent_id=parent_id,
                    source="esyn",
                    tool_chain=tool_chain,
                    aig_path=candidate_aig,
                    truth=truth,
                    abc=abc,
                    notes="E-Syn per-output replacement output={0} source={1}".format(output_name, rewrite_path),
                    timeout=eval_timeout,
                )
            except subprocess.TimeoutExpired as exc:
                failures.append("{0}: ABC evaluation timed out after {1}s".format(candidate_id, eval_timeout))
                continue
            except RuntimeError as exc:
                failures.append("{0}: ABC evaluation failed: {1}".format(candidate_id, exc))
                continue
            candidate.runtime_sec += generation_sec
            candidates.append(candidate)

    if not candidates:
        summary = _summarize_failures(failures)
        if summary:
            raise EsynError("E-Syn seed generation produced no candidates. Failures: {0}".format(summary))
        raise EsynError("E-Syn seed generation produced no unique candidates.")
    return candidates


def esyn_seed_candidate(
    case,
    parent,
    truth,
    work_dir,
    abc,
    timeout=300,
    root=None,
    input_expr=None,
    input_format="sexpr",
    eqn_path=None,
    top_n=3,
    max_outputs=None,
):
    if eqn_path is not None:
        return esyn_seed_candidates_from_eqn(
            eqn_path=eqn_path,
            truth=truth,
            abc=abc,
            work_dir=work_dir,
            case=case,
            parent_id=getattr(parent, "candidate_id", parent),
            top_n=top_n,
            root=root,
            timeout=timeout,
            max_outputs=max_outputs,
        )

    _require_expression_tools(root=root)
    if input_expr is not None:
        result = esyn_expression_candidates(
            input_expr=input_expr,
            work_dir=Path(work_dir) / case / "esyn_expr",
            input_format=input_format,
            root=root,
            timeout=timeout,
        )
        raise EsynContractError(
            "E-Syn produced {0} expression candidates for case {1}, but no AIG was generated. "
            "Missing conversion contract: rewritten E-Syn S-expression -> per-output Verilog/EQN "
            "with a stable PI/PO order -> Yosys/ABC AIG synthesis -> evaluate.py CEC. "
            "First expression candidate: {2}".format(len(result.output_paths), case, result.first_output)
        )

    raise EsynContractError(
        "E-Syn AIG candidate generation is not defined for case {0} from parent {1}. "
        "The available E-Syn binary is expression-in/expression-out only. Required contract: "
        "AIG or Verilog -> ABC EQN/Boolean expression with stable PI/PO mapping; encode multi-output "
        "circuits for E-Syn; decode rewritten output_from_egg*.txt back to per-output Verilog/EQN; "
        "synthesize to AIG; verify with evaluate.py. Use esyn_expression_candidates() for the "
        "currently verified expression-level flow.".format(case, getattr(parent, "candidate_id", parent))
    )


def _print_status(root):
    for name, info in tool_status(root=root).items():
        state = "ok" if info["exists"] and info["executable"] else "missing"
        print("{0}: {1} {2}".format(name, state, info["path"]))


def _print_candidate(label, candidate):
    print(
        "{0}: equivalent={1} area={2} delay={3} adp={4} id={5} parent={6} aig={7}".format(
            label,
            int(bool(candidate.equivalent)),
            candidate.area,
            candidate.delay,
            candidate.adp,
            candidate.candidate_id,
            candidate.parent_id,
            candidate.aig_path,
        )
    )


def main(argv=None):
    parser = argparse.ArgumentParser(description="E-Syn expression and EQN seed wrapper")
    parser.add_argument("--root", default=None, help="project root, default: auto-detect")
    parser.add_argument("--work-dir", default="/tmp/esyn_wrapper_smoke", help="scratch directory")
    parser.add_argument("--timeout", type=int, default=60)
    parser.add_argument("--status", action="store_true", help="print discovered tool paths")
    parser.add_argument("--smoke", action="store_true", help="run minimal expression smoke")
    parser.add_argument("--rewrite", default=None, help="rewrite an expression string")
    parser.add_argument("--format", choices=("sexpr", "infix"), default="sexpr")
    parser.add_argument("--seed-smoke", action="store_true", help="run EQN -> E-Syn -> AIG candidate smoke")
    parser.add_argument("--eqn", default=None, help="input EQN path for --seed-smoke")
    parser.add_argument("--aig", default=None, help="input AIG path for --seed-smoke; converted to EQN first")
    parser.add_argument("--truth", default=None, help="truth file for --seed-smoke evaluation")
    parser.add_argument("--abc", default=None, help="ABC binary for --seed-smoke synthesis/evaluation")
    parser.add_argument("--case", default=None, help="case name for --seed-smoke; defaults to EQN stem")
    parser.add_argument("--parent-id", default=None, help="parent candidate id for --seed-smoke")
    parser.add_argument("--top-n", type=int, default=3, help="unique E-Syn rewrites per output")
    parser.add_argument("--max-outputs", type=int, default=None, help="limit outputs processed by --seed-smoke")
    parser.add_argument("--mode", choices=("per-output", "whole-vector"), default="per-output")
    parser.add_argument("--synth-timeout", type=int, default=60)
    parser.add_argument("--eval-timeout", type=int, default=60)
    args = parser.parse_args(argv)

    root = None if args.root is None else Path(args.root)
    if args.status:
        _print_status(root)

    if args.seed_smoke:
        missing = [name for name in ("truth", "abc") if getattr(args, name) is None]
        if missing:
            print("--seed-smoke requires: {0}".format(", ".join("--{0}".format(name) for name in missing)))
            return 2
        if args.eqn is None and args.aig is None:
            print("--seed-smoke requires one of: --eqn or --aig")
            return 2
        if args.eqn is not None and args.aig is not None:
            print("--seed-smoke accepts only one of: --eqn or --aig")
            return 2
        try:
            eqn_path = args.eqn
            if eqn_path is None:
                case_name = args.case or _case_from_eqn_path(args.aig)
                eqn_path = Path(args.work_dir) / case_name / "input_from_aig.eqn"
                write_aig_to_eqn(args.aig, eqn_path, abc=args.abc, timeout=args.synth_timeout)
            candidates = esyn_seed_candidates_from_eqn(
                eqn_path=eqn_path,
                truth=args.truth,
                abc=args.abc,
                work_dir=args.work_dir,
                case=args.case,
                parent_id=args.parent_id,
                top_n=args.top_n,
                root=root,
                timeout=args.timeout,
                synth_timeout=args.synth_timeout,
                eval_timeout=args.eval_timeout,
                mode=args.mode,
                max_outputs=args.max_outputs,
            )
        except EsynContractError as exc:
            print("seed_smoke: unavailable: {0}".format(exc))
            return 0
        except Exception as exc:
            print("seed_smoke: failed: {0}".format(exc))
            return 1
        print("seed_smoke: candidates={0}".format(len(candidates)))
        for index, candidate in enumerate(candidates, 1):
            _print_candidate("candidate_{0}".format(index), candidate)
        return 0

    if args.smoke:
        result = run_expression_smoke(args.work_dir, root=root, timeout=args.timeout)
    elif args.rewrite is not None:
        result = esyn_expression_candidates(
            input_expr=args.rewrite,
            work_dir=args.work_dir,
            input_format=args.format,
            root=root,
            timeout=args.timeout,
        )
    else:
        return 0

    print("work_dir: {0}".format(result.work_dir))
    print("input_sexpr: {0}".format(result.input_sexpr))
    print("outputs: {0}".format(len(result.output_paths)))
    print("runtime_sec: {0:.3f}".format(result.runtime_sec))
    if result.first_output is not None:
        print("first_output: {0}".format(result.first_output))
        print("first_expr: {0}".format(result.first_output.read_text().strip()))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
