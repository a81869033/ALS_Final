#!/usr/bin/env python3
"""Generate initial reverse-engineering frontend candidates."""

import argparse
import importlib
import inspect
import json
import sys
import time
from pathlib import Path


ROOT = Path(__file__).resolve().parents[2]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from student.frontends import verilog_templates


TRUTH_MODULE_NAMES = [
    "student.frontends.truth",
    "student.truth",
    "truth",
]

TRUTH_WIDTH_FUNCTIONS = [
    "input_output_widths",
    "infer_widths",
    "infer_case_widths",
    "case_widths",
    "get_case_widths",
    "truth_widths",
]

YOSYS_MODULE_NAMES = [
    "student.frontends.yosys_synth",
    "student.yosys_synth",
    "yosys_synth",
]

YOSYS_FUNCTIONS = [
    "synthesize_verilog",
    "synthesize_verilog_file",
    "synthesize_candidate",
    "run_yosys_synth",
    "synthesize",
]


def _import_first(module_names):
    for module_name in module_names:
        try:
            return importlib.import_module(module_name), module_name
        except ImportError as exc:
            if exc.name != module_name:
                raise
    return None, None


def _normalise_width_result(result):
    if result is None:
        return None
    if isinstance(result, dict):
        input_width = result.get("input_width")
        output_width = result.get("output_width")
    else:
        input_width = getattr(result, "input_width", None)
        output_width = getattr(result, "output_width", None)
        if input_width is None and output_width is None:
            try:
                input_width, output_width = result[0], result[1]
            except (TypeError, IndexError):
                input_width, output_width = None, None
    if not isinstance(input_width, int) or not isinstance(output_width, int):
        raise RuntimeError("truth.py width result must provide integer input_width and output_width")
    if input_width <= 0 or output_width <= 0:
        raise RuntimeError("truth.py returned non-positive widths")
    return input_width, output_width


def _call_with_supported_args(func, case, truth_path, benchmarks_dir):
    signature = inspect.signature(func)
    params = signature.parameters
    kwargs = {}

    if any(param.kind == inspect.Parameter.VAR_KEYWORD for param in params.values()):
        kwargs["case"] = case
        kwargs["truth_path"] = truth_path
        kwargs["benchmarks_dir"] = benchmarks_dir
        return func(**kwargs)

    for name in params:
        if name in ("case", "case_name"):
            kwargs[name] = case
        elif name in ("truth", "truth_path", "path"):
            kwargs[name] = truth_path
        elif name in ("benchmarks", "benchmarks_dir"):
            kwargs[name] = benchmarks_dir

    required = [
        name
        for name, param in params.items()
        if param.default == inspect.Parameter.empty
        and param.kind in (inspect.Parameter.POSITIONAL_OR_KEYWORD, inspect.Parameter.KEYWORD_ONLY)
    ]
    missing = [name for name in required if name not in kwargs]
    if missing:
        return None
    return func(**kwargs)


def infer_widths_from_truth_module(case, truth_path, benchmarks_dir):
    module, module_name = _import_first(TRUTH_MODULE_NAMES)
    if module is None:
        return None, "truth_module_absent"

    for func_name in TRUTH_WIDTH_FUNCTIONS:
        func = getattr(module, func_name, None)
        if func is None:
            continue
        result = _call_with_supported_args(func, case, truth_path, benchmarks_dir)
        widths = _normalise_width_result(result)
        if widths is not None:
            return widths, "{0}.{1}".format(module_name, func_name)

    truth_table = getattr(module, "TruthTable", None)
    if truth_table is not None:
        table = truth_table(truth_path)
        widths = _normalise_width_result(table)
        if widths is not None:
            return widths, "{0}.TruthTable".format(module_name)

    raise RuntimeError(
        "truth.py was found as {0}, but no supported width API was found. "
        "Expected TruthTable or one of: {1}".format(module_name, ", ".join(TRUTH_WIDTH_FUNCTIONS))
    )


def _log2_power_of_two(value):
    if value <= 0 or (value & (value - 1)) != 0:
        raise RuntimeError("truth table row count must be a power of two, got {0}".format(value))
    return value.bit_length() - 1


def infer_widths_from_truth_file(truth_path):
    if not truth_path.is_file():
        raise RuntimeError("truth.py is unavailable and truth table was not found: {0}".format(truth_path))

    output_width = 0
    table_rows = None
    with truth_path.open("r") as handle:
        for raw_line in handle:
            line = raw_line.strip()
            if not line:
                continue
            if any(char not in "01" for char in line):
                raise RuntimeError("truth table contains non-binary data: {0}".format(truth_path))
            if table_rows is None:
                table_rows = len(line)
            elif len(line) != table_rows:
                raise RuntimeError("truth table rows have inconsistent lengths: {0}".format(truth_path))
            output_width += 1

    if table_rows is None or output_width == 0:
        raise RuntimeError("truth table is empty: {0}".format(truth_path))
    input_width = _log2_power_of_two(table_rows)
    return (input_width, output_width), str(truth_path)


def infer_case_widths(case, benchmarks_dir):
    truth_path = Path(benchmarks_dir) / "{0}.truth".format(case)
    module_result, module_source = infer_widths_from_truth_module(case, truth_path, benchmarks_dir)
    if module_result is not None:
        return module_result[0], module_result[1], module_source
    file_result, file_source = infer_widths_from_truth_file(truth_path)
    return file_result[0], file_result[1], file_source


def candidate_specs(case, input_width, output_width):
    specs = [
        {
            "candidate_id": "{0}_identity".format(case),
            "module": "{0}_identity".format(case),
            "template": "identity",
            "params": {},
        }
    ]
    for op in ["add", "xor", "and", "or", "mul"]:
        specs.append(
            {
                "candidate_id": "{0}_{1}".format(case, op),
                "module": "{0}_{1}".format(case, op),
                "template": "byte_binary_op",
                "params": {"op": op},
            }
        )
    if input_width >= 2:
        low_width = input_width // 2
        high_width = input_width - low_width
        order_specs = [
            ("low{0}_high{1}".format(low_width, high_width), "low_high"),
            ("high{0}_low{1}".format(high_width, low_width), "high_low"),
        ]
        for label, order in order_specs:
            for op in ["add", "sub", "xor", "and", "or", "mul"]:
                for invert_a, invert_b, prefix in [
                    (False, False, ""),
                    (True, True, "inv_"),
                ]:
                    specs.append(
                        {
                            "candidate_id": "{0}_{1}_{2}{3}".format(case, label, prefix, op),
                            "module": "{0}_{1}_{2}{3}".format(case, label, prefix, op),
                            "template": "split_binary_op",
                            "params": {
                                "op": op,
                                "order": order,
                                "invert_a": invert_a,
                                "invert_b": invert_b,
                            },
                        }
                    )
    specs.append(
        {
            "candidate_id": "{0}_split_lut_skeleton".format(case),
            "module": "{0}_split_lut_skeleton".format(case),
            "template": "split_case_lut",
            "params": {
                "class_bits": min(4, input_width),
                "entries": [],
            },
        }
    )
    return specs


def render_candidate(spec, input_width, output_width):
    template = spec["template"]
    module = spec["module"]
    if template == "identity":
        return verilog_templates.identity_template(
            module,
            input_width=input_width,
            output_width=output_width,
        )
    if template == "byte_binary_op":
        return verilog_templates.byte_binary_op_template(
            module,
            spec["params"]["op"],
            input_width=input_width,
            output_width=output_width,
        )
    if template == "split_binary_op":
        return verilog_templates.split_binary_op_template(
            module,
            spec["params"]["op"],
            input_width=input_width,
            output_width=output_width,
            order=spec["params"]["order"],
            invert_a=spec["params"]["invert_a"],
            invert_b=spec["params"]["invert_b"],
        )
    if template == "split_case_lut":
        return verilog_templates.split_case_lut_template(
            module,
            spec["params"]["class_bits"],
            spec["params"]["entries"],
            input_width=input_width,
            output_width=output_width,
        )
    raise RuntimeError("unknown template: {0}".format(template))


def write_text(path, text):
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w") as handle:
        handle.write(text)


def write_manifest_json(path, manifest):
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w") as handle:
        json.dump(manifest, handle, indent=2, sort_keys=True)
        handle.write("\n")


def write_manifest_text(path, manifest):
    lines = [
        "case: {0}".format(manifest["case"]),
        "strategy: {0}".format(manifest["strategy"]),
        "input_width: {0}".format(manifest["input_width"]),
        "output_width: {0}".format(manifest["output_width"]),
        "width_source: {0}".format(manifest["width_source"]),
        "dry_run: {0}".format("yes" if manifest["dry_run"] else "no"),
        "attempt_dir: {0}".format(manifest["attempt_dir"]),
        "candidates:",
    ]
    for candidate in manifest["candidates"]:
        lines.append(
            "  - {0}: {1} ({2})".format(
                candidate["candidate_id"],
                candidate["verilog_path"],
                candidate["template"],
            )
        )
    lines.append("")
    write_text(path, "\n".join(lines))


def generate_templates(case, attempt_dir, input_width, output_width):
    candidates_dir = attempt_dir / "candidates"
    specs = candidate_specs(case, input_width, output_width)
    generated = []
    for spec in specs:
        verilog = render_candidate(spec, input_width, output_width)
        verilog_path = candidates_dir / "{0}.v".format(spec["candidate_id"])
        write_text(verilog_path, verilog)
        item = dict(spec)
        item["input_width"] = input_width
        item["output_width"] = output_width
        item["verilog_path"] = str(verilog_path)
        generated.append(item)
    return generated


def _find_synthesis_function(module):
    for func_name in YOSYS_FUNCTIONS:
        func = getattr(module, func_name, None)
        if callable(func):
            return func_name, func
    return None, None


def _call_synthesis_function(func, candidate, synth_dir):
    signature = inspect.signature(func)
    params = signature.parameters
    output_aig = synth_dir / "{0}.aig".format(candidate["candidate_id"])
    kwargs = {}

    if any(param.kind == inspect.Parameter.VAR_KEYWORD for param in params.values()):
        return func(
            verilog_path=Path(candidate["verilog_path"]),
            output_dir=synth_dir,
            output_aig=output_aig,
            top_module=candidate["module"],
        )

    for name in params:
        if name in ("verilog_path", "verilog", "input_verilog", "src"):
            kwargs[name] = Path(candidate["verilog_path"])
        elif name in ("output_dir", "out_dir", "synth_dir"):
            kwargs[name] = synth_dir
        elif name in ("output", "output_aig", "aig_path", "out_aig"):
            kwargs[name] = output_aig
        elif name in ("top", "top_module", "module"):
            kwargs[name] = candidate["module"]
        elif name in ("abc_names", "use_abc_names"):
            kwargs[name] = True
        elif name == "input_width":
            kwargs[name] = candidate.get("input_width")
        elif name == "output_width":
            kwargs[name] = candidate.get("output_width")

    required = [
        name
        for name, param in params.items()
        if param.default == inspect.Parameter.empty
        and param.kind in (inspect.Parameter.POSITIONAL_OR_KEYWORD, inspect.Parameter.KEYWORD_ONLY)
    ]
    missing = [name for name in required if name not in kwargs]
    if missing:
        raise RuntimeError(
            "yosys_synth function has unsupported required args: {0}".format(", ".join(missing))
        )
    result = func(**kwargs)
    if result is None:
        return output_aig
    return result


def synthesize_candidates(candidates, synth_dir):
    module, module_name = _import_first(YOSYS_MODULE_NAMES)
    if module is None:
        raise RuntimeError(
            "--synthesize requested, but yosys_synth.py is unavailable. "
            "Expected one of: {0}".format(", ".join(YOSYS_MODULE_NAMES))
        )
    func_name, func = _find_synthesis_function(module)
    if func is None:
        raise RuntimeError(
            "--synthesize requested, but {0} has no supported synthesis function. "
            "Expected one of: {1}".format(module_name, ", ".join(YOSYS_FUNCTIONS))
        )

    synth_dir.mkdir(parents=True, exist_ok=True)
    results = []
    for candidate in candidates:
        result = _call_synthesis_function(func, candidate, synth_dir)
        results.append(
            {
                "candidate_id": candidate["candidate_id"],
                "synthesis_module": module_name,
                "synthesis_function": func_name,
                "result": str(result),
            }
        )
    return results


def parse_args():
    parser = argparse.ArgumentParser(description="Generate reverse-engineering frontend candidates.")
    parser.add_argument("--case", required=True, help="Benchmark case name, for example ex255.")
    parser.add_argument("--strategy", choices=["templates"], default="templates")
    parser.add_argument("--dry-run", action="store_true", help="Generate frontend files only.")
    parser.add_argument("--synthesize", action="store_true", help="Synthesize generated Verilog via yosys_synth.py.")
    parser.add_argument("--benchmarks", type=Path, default=ROOT / "benchmarks")
    parser.add_argument("--work-dir", type=Path, default=ROOT / "student" / "work" / "reverse")
    return parser.parse_args()


def main():
    args = parse_args()
    attempt_dir = Path(args.work_dir) / args.case
    try:
        input_width, output_width, width_source = infer_case_widths(args.case, args.benchmarks)

        candidates = generate_templates(args.case, attempt_dir, input_width, output_width)
        manifest = {
            "case": args.case,
            "strategy": args.strategy,
            "dry_run": bool(args.dry_run),
            "attempt_dir": str(attempt_dir),
            "input_width": input_width,
            "output_width": output_width,
            "width_source": width_source,
            "generated_at_unix": int(time.time()),
            "candidates": candidates,
            "synthesis": [],
        }

        if args.synthesize:
            manifest["synthesis"] = synthesize_candidates(
                candidates,
                attempt_dir / "synthesized_aigs",
            )

        write_manifest_json(attempt_dir / "manifest.json", manifest)
        write_manifest_text(attempt_dir / "manifest.txt", manifest)
    except (IOError, OSError, RuntimeError, ValueError) as error:
        print("reverse_engineer.py: {0}".format(error), file=sys.stderr)
        return 2

    print("case: {0}".format(args.case))
    print("strategy: {0}".format(args.strategy))
    print("widths: input={0} output={1} source={2}".format(input_width, output_width, width_source))
    print("attempt_dir: {0}".format(attempt_dir))
    print("candidates: {0}".format(len(candidates)))
    if args.synthesize:
        print("synthesized: {0}".format(len(manifest["synthesis"])))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
