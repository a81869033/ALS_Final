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


RUNNER_ENV = "MOCKTURTLE_AIG_RUNNER"
DEFAULT_FLOW = "resub_balance"
SUPPORTED_FLOWS = ("resub", "balance", "resub_balance", "balance_resub")


def _project_root():
    return Path(__file__).resolve().parents[2]


def default_abc():
    return _project_root() / "student" / "abc"


def default_baseline_dir():
    return _project_root() / "baselines" / "abc_st" / "aigs"


def discover_runner(root=None):
    if root is None:
        root = _project_root()
    else:
        root = Path(root)

    env_runner = os.environ.get(RUNNER_ENV)
    if env_runner:
        env_runner = Path(env_runner)
        if env_runner.is_file():
            return env_runner

    candidates = [
        root / "student" / "tools" / "mockturtle" / "bin" / "mockturtle_aig_runner",
        root / "student" / "tools" / "mockturtle" / "build" / "mockturtle_aig_runner",
        root / "student" / "tools" / "mockturtle" / "build" / "bin" / "mockturtle_aig_runner",
    ]
    for path in candidates:
        if path.is_file():
            return path
    return None


def build_runner(root=None, timeout=300):
    if root is None:
        root = _project_root()
    else:
        root = Path(root)

    script = root / "student" / "tools" / "mockturtle" / "build_mockturtle_runner.sh"
    if not script.is_file():
        raise RuntimeError("MockTurtle runner build helper not found: {0}".format(script))

    result = subprocess.run(
        [str(script)],
        stdout=subprocess.PIPE,
        stderr=subprocess.STDOUT,
        universal_newlines=True,
        timeout=timeout,
    )
    if result.returncode != 0:
        raise RuntimeError(result.stdout.strip())

    runner = discover_runner(root)
    if runner is None:
        raise RuntimeError("MockTurtle build completed but runner was not found:\n{0}".format(result.stdout))
    return runner


def run_mockturtle(input_aig, output_aig, runner=None, flow=DEFAULT_FLOW, timeout=120):
    if runner is None:
        runner = discover_runner()

    if runner is None:
        raise RuntimeError(
            "MockTurtle runner not found. Set {0} or run "
            "student/tools/mockturtle/build_mockturtle_runner.sh.".format(RUNNER_ENV)
        )
    if flow not in SUPPORTED_FLOWS:
        raise RuntimeError("Unknown MockTurtle flow: {0}".format(flow))

    output_aig = Path(output_aig)
    output_aig.parent.mkdir(parents=True, exist_ok=True)
    command = [
        str(runner),
        "--input",
        str(input_aig),
        "--output",
        str(output_aig),
        "--flow",
        flow,
    ]
    result = subprocess.run(
        command,
        stdout=subprocess.PIPE,
        stderr=subprocess.STDOUT,
        universal_newlines=True,
        timeout=timeout,
    )
    if result.returncode != 0:
        raise RuntimeError(result.stdout.strip())
    if not output_aig.is_file():
        raise RuntimeError("MockTurtle runner did not create expected output: {0}".format(output_aig))
    return result.stdout.strip()


def mockturtle_flow_candidate(case, flow_name, parent, truth, work_dir, abc, runner=None, timeout=120):
    if flow_name not in SUPPORTED_FLOWS:
        raise RuntimeError("Unknown MockTurtle flow: {0}".format(flow_name))

    tool_chain = "mockturtle_{0}".format(flow_name)
    flow_dir = Path(work_dir) / case / tool_chain
    output_aig = flow_dir / "{0}_{1}.aig".format(case, tool_chain)

    start = time.time()
    run_mockturtle(
        input_aig=parent.aig_path,
        output_aig=output_aig,
        runner=runner,
        flow=flow_name,
        timeout=timeout,
    )
    generation_sec = time.time() - start

    candidate = evaluate_aig(
        case=case,
        candidate_id="{0}_{1}".format(case, tool_chain),
        parent_id=parent.candidate_id,
        source="mockturtle",
        tool_chain=tool_chain,
        aig_path=output_aig,
        truth=truth,
        abc=abc,
        notes="MockTurtle {0} AIG flow".format(flow_name),
        timeout=timeout,
    )
    candidate.runtime_sec += generation_sec
    return candidate


def mockturtle_candidate(case, parent, truth, work_dir, abc, runner=None, timeout=120, flow=DEFAULT_FLOW):
    return mockturtle_flow_candidate(
        case=case,
        flow_name=flow,
        parent=parent,
        truth=truth,
        work_dir=work_dir,
        abc=abc,
        runner=runner,
        timeout=timeout,
    )


def smoke_ex200(work_dir="/tmp/mockturtle_smoke", runner=None, abc=None, baseline_dir=None, flow=DEFAULT_FLOW, timeout=120):
    root = _project_root()
    case = "ex200"
    truth = root / "benchmarks" / "{0}.truth".format(case)
    parent = baseline_candidate(
        case=case,
        truth=truth,
        baseline_dir=baseline_dir or default_baseline_dir(),
        abc=abc or default_abc(),
        timeout=timeout,
    )
    candidate = mockturtle_candidate(
        case=case,
        parent=parent,
        truth=truth,
        work_dir=work_dir,
        abc=abc or default_abc(),
        runner=runner,
        timeout=timeout,
        flow=flow,
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
    parser = argparse.ArgumentParser(description="MockTurtle AIG runner diagnostics and smoke tests.")
    parser.add_argument("--runner", default=None, help="Path to mockturtle_aig_runner; defaults to discovery.")
    parser.add_argument("--abc", default=str(default_abc()))
    parser.add_argument("--baseline-dir", default=str(default_baseline_dir()))
    parser.add_argument("--work-dir", default="/tmp/mockturtle_smoke")
    parser.add_argument("--flow", choices=SUPPORTED_FLOWS, default=DEFAULT_FLOW)
    parser.add_argument("--timeout", type=int, default=120)
    parser.add_argument("--build", action="store_true", help="Build the runner before running other actions.")
    parser.add_argument("--status", action="store_true", help="Print discovered runner path.")
    parser.add_argument("--smoke-ex200", action="store_true", help="Run MockTurtle on ex200 baseline and evaluate it.")
    args = parser.parse_args(argv)

    runner = Path(args.runner) if args.runner else None
    if args.build:
        runner = build_runner(timeout=args.timeout)
        print("built runner: {0}".format(runner))

    if args.status or (not args.smoke_ex200 and not args.build):
        found = runner or discover_runner()
        if found is None:
            print("MockTurtle runner: missing")
            return 1
        print("MockTurtle runner: {0}".format(found))

    if args.smoke_ex200:
        parent, candidate = smoke_ex200(
            work_dir=args.work_dir,
            runner=runner,
            abc=Path(args.abc),
            baseline_dir=Path(args.baseline_dir),
            flow=args.flow,
            timeout=args.timeout,
        )
        _print_candidate("baseline", parent)
        _print_candidate("mockturtle_{0}".format(args.flow), candidate)
        if not candidate.equivalent:
            print("MockTurtle smoke test failed: generated candidate is not equivalent.")
            return 3
        print("MockTurtle ex200 smoke test: OK")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
