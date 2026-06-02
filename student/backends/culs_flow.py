"""CULS-backed candidate flows and diagnostics."""

import argparse
import os
import subprocess
import sys
import time
from pathlib import Path

if __package__ in (None, ""):
    sys.path.insert(0, str(Path(__file__).resolve().parents[2]))

from student.backends.abc_flow import evaluate_aig
from student.backends.abc_flow import baseline_candidate


class CulsError(RuntimeError):
    """Base error for CULS wrapper failures."""


class CulsUnavailableError(CulsError):
    """Raised when the gpuls binary/build cannot be used at all."""


class CulsRuntimeUnavailableError(CulsError):
    """Raised when gpuls starts but CUDA/GPU runtime execution is unavailable."""


def repo_root():
    return Path(__file__).resolve().parents[2]


def default_culs_bin():
    return repo_root() / "student" / "tools" / "culs" / "build" / "gpuls"


def default_abc():
    return repo_root() / "student" / "abc"


def default_baseline_dir():
    return repo_root() / "baselines" / "abc_st" / "aigs"


def _format_failure_output(output):
    if not output:
        return ""
    return "\n{0}".format(output.strip())


def _run_gpuls_script(culs_bin, script, timeout=120):
    try:
        return subprocess.run(
            [str(culs_bin), "-c", script],
            stdout=subprocess.PIPE,
            stderr=subprocess.STDOUT,
            universal_newlines=True,
            timeout=timeout,
        )
    except OSError as exc:
        raise CulsUnavailableError(
            "CULS gpuls could not be executed: {0}: {1}".format(culs_bin, exc)
        )
    except subprocess.TimeoutExpired as exc:
        raise CulsRuntimeUnavailableError(
            "CULS gpuls timed out after {0}s. CUDA/GPU runtime may be unavailable "
            "or the optimization hung.{1}".format(timeout, _format_failure_output(exc.output))
        )


def check_culs_binary(culs_bin):
    culs_bin = Path(culs_bin)
    if not culs_bin.is_file():
        raise CulsUnavailableError("CULS gpuls executable not found: {0}".format(culs_bin))
    if not os.access(str(culs_bin), os.X_OK):
        raise CulsUnavailableError("CULS gpuls is not executable: {0}".format(culs_bin))
    return culs_bin


def probe_culs(culs_bin=None, timeout=10):
    """Check that the gpuls binary exists and can start without GPU work."""

    culs_bin = check_culs_binary(culs_bin or default_culs_bin())
    result = _run_gpuls_script(culs_bin, "time", timeout=timeout)
    if result.returncode != 0:
        raise CulsUnavailableError(
            "CULS gpuls exists but failed a startup probe with return code {0}.{1}".format(
                result.returncode,
                _format_failure_output(result.stdout),
            )
        )
    return result.stdout


def _raise_gpuls_failure(result):
    hint = ""
    error_cls = CulsError
    if result.returncode < 0:
        signal_number = -result.returncode
        if signal_number == 11:
            error_cls = CulsRuntimeUnavailableError
        hint = (
            " gpuls terminated by signal {0}; binary startup may work, but CUDA/GPU "
            "runtime execution is unavailable in this environment or gpuls crashed "
            "during optimization.".format(signal_number)
        )
    elif result.returncode == 139:
        error_cls = CulsRuntimeUnavailableError
        hint = (
            " gpuls segfaulted; binary startup may work, but CUDA/GPU runtime "
            "execution is unavailable in this environment or gpuls crashed during "
            "optimization."
        )
    raise error_cls(
        "CULS gpuls failed with return code {0}.{1}{2}".format(
            result.returncode,
            hint,
            _format_failure_output(result.stdout),
        )
    )


def run_culs_resyn2(culs_bin, input_aig, output_aig, timeout=120):
    culs_bin = check_culs_binary(culs_bin)
    input_aig = Path(input_aig)
    output_aig = Path(output_aig)

    if not input_aig.is_file():
        raise CulsError("Input AIG not found: {0}".format(input_aig))

    output_aig.parent.mkdir(parents=True, exist_ok=True)
    if output_aig.exists():
        output_aig.unlink()
    script = "read {0}; resyn2; write {1}".format(input_aig, output_aig)
    result = _run_gpuls_script(culs_bin, script, timeout=timeout)

    if result.returncode != 0:
        _raise_gpuls_failure(result)

    if not output_aig.is_file():
        raise CulsError(
            "CULS gpuls did not create expected output: {0}{1}".format(
                output_aig,
                _format_failure_output(result.stdout),
            )
        )
    if output_aig.stat().st_size == 0:
        raise CulsError("CULS gpuls created an empty output AIG: {0}".format(output_aig))
    return result.stdout


def culs_resyn2_candidate(case, parent, truth, work_dir, culs_bin, abc, timeout=120):
    flow_name = "culs_resyn2"
    flow_dir = Path(work_dir) / case / flow_name
    output_aig = flow_dir / "{0}_{1}.aig".format(case, flow_name)

    start = time.time()
    run_culs_resyn2(
        culs_bin=culs_bin,
        input_aig=parent.aig_path,
        output_aig=output_aig,
        timeout=timeout,
    )
    generation_sec = time.time() - start

    candidate = evaluate_aig(
        case=case,
        candidate_id="{0}_{1}".format(case, flow_name),
        parent_id=parent.candidate_id,
        source="culs",
        tool_chain=flow_name,
        aig_path=output_aig,
        truth=truth,
        abc=abc,
        notes='CULS gpuls: read input; resyn2; write output',
        timeout=timeout,
    )
    candidate.runtime_sec += generation_sec
    return candidate


def smoke_ex200(culs_bin=None, abc=None, baseline_dir=None, work_dir="/tmp/culs_smoke", timeout=120):
    root = repo_root()
    case = "ex200"
    truth = root / "benchmarks" / "{0}.truth".format(case)
    parent = baseline_candidate(
        case=case,
        truth=truth,
        baseline_dir=baseline_dir or default_baseline_dir(),
        abc=abc or default_abc(),
        timeout=timeout,
    )
    candidate = culs_resyn2_candidate(
        case=case,
        parent=parent,
        truth=truth,
        work_dir=work_dir,
        culs_bin=culs_bin or default_culs_bin(),
        abc=abc or default_abc(),
        timeout=timeout,
    )
    return parent, candidate


def _print_candidate(label, candidate):
    print(
        "{0}: equivalent={1} area={2} delay={3} adp={4} aig={5}".format(
            label,
            int(bool(candidate.equivalent)),
            candidate.area,
            candidate.delay,
            candidate.adp,
            candidate.aig_path,
        )
    )


def main(argv=None):
    parser = argparse.ArgumentParser(description="CULS gpuls diagnostics and smoke tests.")
    parser.add_argument("--culs-bin", default=str(default_culs_bin()))
    parser.add_argument("--abc", default=str(default_abc()))
    parser.add_argument("--baseline-dir", default=str(default_baseline_dir()))
    parser.add_argument("--work-dir", default="/tmp/culs_smoke")
    parser.add_argument("--timeout", type=int, default=120)
    parser.add_argument(
        "--probe",
        action="store_true",
        help="Check that gpuls exists and starts without running GPU optimization.",
    )
    parser.add_argument(
        "--smoke-ex200",
        action="store_true",
        help="Run CULS resyn2 on baselines/abc_st/aigs/ex200.aig and evaluate it.",
    )
    args = parser.parse_args(argv)

    if not args.probe and not args.smoke_ex200:
        args.probe = True

    try:
        if args.probe:
            stdout = probe_culs(args.culs_bin, timeout=min(args.timeout, 30))
            print("CULS startup probe: OK")
            print("gpuls: {0}".format(args.culs_bin))
            if stdout.strip():
                print(stdout.strip())
        if args.smoke_ex200:
            parent, candidate = smoke_ex200(
                culs_bin=args.culs_bin,
                abc=args.abc,
                baseline_dir=args.baseline_dir,
                work_dir=args.work_dir,
                timeout=args.timeout,
            )
            _print_candidate("baseline", parent)
            _print_candidate("culs_resyn2", candidate)
            if not candidate.equivalent:
                print("CULS smoke test failed: generated candidate is not equivalent.")
                return 3
            print("CULS ex200 smoke test: OK")
    except CulsRuntimeUnavailableError as exc:
        print("CULS runtime unavailable: {0}".format(exc))
        return 2
    except CulsError as exc:
        print("CULS unavailable or failed: {0}".format(exc))
        return 1
    return 0


if __name__ == "__main__":
    sys.exit(main())
