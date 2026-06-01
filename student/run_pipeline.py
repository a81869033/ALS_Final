#!/usr/bin/env python3
"""Run a small candidate-generation pipeline for one benchmark case."""

import argparse
import sys
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from student.backends.abc_flow import ABC_ALL_FLOWS, ABC_FLOW_COMMANDS, abc_flow_candidate, baseline_candidate
from student.common.candidate import append_candidates


def parse_flows(value):
    requested = [item.strip() for item in value.split(",") if item.strip()]
    if not requested:
        raise argparse.ArgumentTypeError("At least one flow is required.")
    allowed = set(["baseline", "abc_all"])
    allowed.update(ABC_FLOW_COMMANDS.keys())
    unknown = [flow for flow in requested if flow not in allowed]
    if unknown:
        raise argparse.ArgumentTypeError("Unknown flow(s): {0}".format(", ".join(unknown)))

    flows = []
    for flow in requested:
        if flow == "abc_all":
            flows.extend(ABC_ALL_FLOWS)
        else:
            flows.append(flow)

    deduped = []
    seen = set()
    for flow in flows:
        if flow not in seen:
            deduped.append(flow)
            seen.add(flow)
    flows = deduped

    if "baseline" not in flows and any(flow in ABC_FLOW_COMMANDS for flow in flows):
        flows.insert(0, "baseline")
    return flows


def best_candidate(candidates):
    valid = [candidate for candidate in candidates if candidate.equivalent and candidate.adp is not None]
    if not valid:
        return None
    return min(valid, key=lambda candidate: candidate.adp)


def parse_args():
    parser = argparse.ArgumentParser(description="Run candidate flows for one ALS benchmark case.")
    parser.add_argument("--case", required=True, help="Benchmark case name, for example ex200.")
    parser.add_argument(
        "--flows",
        type=parse_flows,
        default=parse_flows("baseline,abc_resyn2"),
        help="Comma-separated flows. Supported: baseline,abc_all,{0}.".format(
            ",".join(ABC_FLOW_COMMANDS.keys())
        ),
    )
    parser.add_argument("--abc", type=Path, default=ROOT / "student" / "abc")
    parser.add_argument("--benchmarks", type=Path, default=ROOT / "benchmarks")
    parser.add_argument("--baseline-dir", type=Path, default=ROOT / "baselines" / "abc_st" / "aigs")
    parser.add_argument("--work-dir", type=Path, default=ROOT / "student" / "work" / "pipeline")
    parser.add_argument("--results", type=Path, default=ROOT / "student" / "results" / "candidate_history.csv")
    parser.add_argument("--timeout", type=int, default=60)
    return parser.parse_args()


def main():
    args = parse_args()
    if not args.abc.is_file():
        print("ABC executable not found: {0}".format(args.abc), file=sys.stderr)
        return 2
    truth = args.benchmarks / "{0}.truth".format(args.case)
    if not truth.is_file():
        print("Benchmark truth table not found: {0}".format(truth), file=sys.stderr)
        return 2

    candidates = []
    baseline = None

    if "baseline" in args.flows:
        baseline = baseline_candidate(
            case=args.case,
            truth=truth,
            baseline_dir=args.baseline_dir,
            abc=args.abc,
            timeout=args.timeout,
        )
        candidates.append(baseline)

    for flow in args.flows:
        if flow == "baseline":
            continue
        candidates.append(
            abc_flow_candidate(
                case=args.case,
                flow_name=flow,
                parent=baseline,
                truth=truth,
                work_dir=args.work_dir,
                abc=args.abc,
                timeout=args.timeout,
            )
        )

    append_candidates(args.results, candidates)

    for candidate in candidates:
        print(
            "{case} {cid}: equiv={equiv} area={area} delay={delay} adp={adp} path={path}".format(
                case=candidate.case,
                cid=candidate.candidate_id,
                equiv="yes" if candidate.equivalent else "no",
                area="-" if candidate.area is None else candidate.area,
                delay="-" if candidate.delay is None else candidate.delay,
                adp="-" if candidate.adp is None else candidate.adp,
                path=candidate.aig_path,
            )
        )

    best = best_candidate(candidates)
    if best is None:
        print("No equivalent candidate generated.", file=sys.stderr)
        return 1
    print(
        "Best: {cid} area={area} delay={delay} adp={adp} path={path}".format(
            cid=best.candidate_id,
            area=best.area,
            delay=best.delay,
            adp=best.adp,
            path=best.aig_path,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
