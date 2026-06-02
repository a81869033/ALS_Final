#!/usr/bin/env python3
"""Run candidate-generation pipelines for ALS benchmark cases."""

import argparse
import csv
import re
import shutil
import subprocess
import sys
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from student.backends.abc9_flow import abc9_candidate
from student.backends.abc_flow import ABC_ALL_FLOWS, ABC_FLOW_COMMANDS, abc_flow_candidate, baseline_candidate
from student.backends.culs_flow import (
    CulsRuntimeUnavailableError,
    CulsUnavailableError,
    culs_resyn2_candidate,
    default_culs_bin,
)
from student.backends.esyn_flow import esyn_seed_candidates_from_eqn, write_aig_to_eqn
from student.backends.mockturtle_flow import mockturtle_candidate
from student.common.candidate import FIELDNAMES as CANDIDATE_FIELDNAMES
from student.common.candidate import Candidate, append_candidates


BACKEND_FLOWS = ["abc9", "mockturtle", "culs", "esyn_from_aig"]
CASE_RE = re.compile(r"^ex([0-9]{3})$")
SUMMARY_FIELDNAMES = [
    "case",
    "baseline_area",
    "baseline_delay",
    "baseline_adp",
    "best_candidate_id",
    "best_flow",
    "best_area",
    "best_delay",
    "best_adp",
    "improvement_percent",
    "num_candidates",
    "num_equivalent",
    "best_aig_path",
]


def parse_case_name(value):
    value = value.strip()
    match = CASE_RE.match(value)
    if not match:
        raise argparse.ArgumentTypeError("Invalid case name: {0}".format(value))
    return value


def parse_cases(value):
    cases = []
    seen = set()
    for item in value.split(","):
        item = item.strip()
        if not item:
            continue

        if "-" in item:
            parts = item.split("-")
            if len(parts) != 2:
                raise argparse.ArgumentTypeError("Invalid case range: {0}".format(item))
            start = parse_case_name(parts[0])
            end = parse_case_name(parts[1])
            start_num = int(CASE_RE.match(start).group(1))
            end_num = int(CASE_RE.match(end).group(1))
            if start_num > end_num:
                raise argparse.ArgumentTypeError("Invalid descending case range: {0}".format(item))
            expanded = ["ex{0:03d}".format(number) for number in range(start_num, end_num + 1)]
        else:
            expanded = [parse_case_name(item)]

        for case in expanded:
            if case not in seen:
                cases.append(case)
                seen.add(case)

    if not cases:
        raise argparse.ArgumentTypeError("At least one case is required.")
    return cases


def parse_flows(value):
    requested = [item.strip() for item in value.split(",") if item.strip()]
    if not requested:
        raise argparse.ArgumentTypeError("At least one flow is required.")
    allowed = set(["baseline", "abc_all"])
    allowed.update(ABC_FLOW_COMMANDS.keys())
    allowed.update(BACKEND_FLOWS)
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

    if "baseline" not in flows and any(flow != "baseline" for flow in flows):
        flows.insert(0, "baseline")
    return flows


def infer_experiment(flow_spec, flows):
    requested = [item.strip() for item in flow_spec.split(",") if item.strip()]
    non_baseline = [flow for flow in requested if flow != "baseline"]
    if non_baseline == ["abc_all"]:
        return "abc_all"
    if flows == ["baseline"] + ABC_ALL_FLOWS:
        return "abc_all"
    if len(non_baseline) == 1:
        return non_baseline[0]
    return "custom"


def best_candidate(candidates):
    valid = [candidate for candidate in candidates if candidate.equivalent and candidate.adp is not None]
    if not valid:
        return None
    return min(valid, key=lambda candidate: candidate.adp)


def parent_candidate(candidates, baseline):
    current_best = best_candidate(candidates)
    if current_best is not None:
        return current_best
    if baseline is not None:
        return baseline
    raise RuntimeError("No parent candidate is available. Include baseline before generated flows.")


def failed_candidate(case, candidate_id, parent_id, source, tool_chain, aig_path, exc):
    message = "{0}: {1}".format(type(exc).__name__, exc)
    if isinstance(exc, subprocess.TimeoutExpired):
        message = "timeout after {0}s: {1}".format(exc.timeout, " ".join(exc.cmd))
    return Candidate(
        case=case,
        candidate_id=candidate_id,
        parent_id=parent_id,
        source=source,
        tool_chain=tool_chain,
        aig_path=aig_path,
        equivalent=False,
        notes=message[:1000],
    )


def format_optional(value):
    return "" if value is None else str(value)


def improvement_percent(baseline, best):
    if baseline is None or best is None:
        return ""
    if baseline.adp is None or best.adp is None or baseline.adp == 0:
        return ""
    return "{0:.2f}".format(100.0 * (baseline.adp - best.adp) / baseline.adp)


def write_csv(csv_path, fieldnames, rows):
    csv_path = Path(csv_path)
    csv_path.parent.mkdir(parents=True, exist_ok=True)
    with csv_path.open("w", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=fieldnames)
        writer.writeheader()
        for row in rows:
            writer.writerow(row)


def candidate_best_row(candidate, best_aig_path):
    row = candidate.to_row()
    row["aig_path"] = str(best_aig_path)
    return row


def summary_row(case, baseline, best, candidates, best_aig_path):
    return {
        "case": case,
        "baseline_area": "" if baseline is None else format_optional(baseline.area),
        "baseline_delay": "" if baseline is None else format_optional(baseline.delay),
        "baseline_adp": "" if baseline is None else format_optional(baseline.adp),
        "best_candidate_id": "" if best is None else best.candidate_id,
        "best_flow": "" if best is None else best.tool_chain,
        "best_area": "" if best is None else format_optional(best.area),
        "best_delay": "" if best is None else format_optional(best.delay),
        "best_adp": "" if best is None else format_optional(best.adp),
        "improvement_percent": improvement_percent(baseline, best),
        "num_candidates": str(len(candidates)),
        "num_equivalent": str(len([candidate for candidate in candidates if candidate.equivalent])),
        "best_aig_path": "" if best_aig_path is None else str(best_aig_path),
    }


def run_case(args, case):
    truth = args.benchmarks / "{0}.truth".format(case)
    if not truth.is_file():
        raise RuntimeError("Benchmark truth table not found: {0}".format(truth))

    candidates = []
    baseline = None

    if "baseline" in args.flows:
        baseline = baseline_candidate(
            case=case,
            truth=truth,
            baseline_dir=args.baseline_dir,
            abc=args.abc,
            timeout=args.timeout,
        )
        candidates.append(baseline)

    for flow in args.flows:
        if flow == "baseline":
            continue

        if flow in ABC_FLOW_COMMANDS:
            try:
                candidates.append(
                    abc_flow_candidate(
                        case=case,
                        flow_name=flow,
                        parent=baseline,
                        truth=truth,
                        work_dir=args.work_dir,
                        abc=args.abc,
                        timeout=args.timeout,
                    )
                )
            except (RuntimeError, subprocess.TimeoutExpired) as exc:
                print("{0} {1}: failed: {2}".format(case, flow, exc), file=sys.stderr)
                output_aig = args.work_dir / case / flow / "{0}_{1}.aig".format(case, flow)
                candidates.append(
                    failed_candidate(
                        case=case,
                        candidate_id="{0}_{1}".format(case, flow),
                        parent_id=baseline.candidate_id,
                        source="abc",
                        tool_chain=flow,
                        aig_path=output_aig,
                        exc=exc,
                    )
                )
            continue

        parent = parent_candidate(candidates, baseline)
        if flow == "abc9":
            candidates.append(
                abc9_candidate(
                    case=case,
                    parent=parent,
                    truth=truth,
                    work_dir=args.work_dir,
                    abc=args.abc,
                    timeout=args.timeout,
                )
            )
        elif flow == "mockturtle":
            candidates.append(
                mockturtle_candidate(
                    case=case,
                    parent=parent,
                    truth=truth,
                    work_dir=args.work_dir,
                    abc=args.abc,
                    runner=args.mockturtle_runner,
                    timeout=args.timeout,
                )
            )
        elif flow == "culs":
            try:
                candidates.append(
                    culs_resyn2_candidate(
                        case=case,
                        parent=parent,
                        truth=truth,
                        work_dir=args.work_dir,
                        culs_bin=args.culs_bin,
                        abc=args.abc,
                        timeout=args.timeout,
                    )
                )
            except (CulsRuntimeUnavailableError, CulsUnavailableError) as exc:
                print("{0} culs: skipped: {1}".format(case, exc), file=sys.stderr)
        elif flow == "esyn_from_aig":
            eqn_dir = args.work_dir / case / "esyn_from_aig"
            eqn_path = eqn_dir / "{0}_{1}.eqn".format(case, parent.candidate_id)
            write_aig_to_eqn(parent.aig_path, eqn_path, abc=args.abc, timeout=args.timeout)
            candidates.extend(
                esyn_seed_candidates_from_eqn(
                    eqn_path=eqn_path,
                    truth=truth,
                    abc=args.abc,
                    work_dir=args.work_dir,
                    case=case,
                    parent_id=parent.candidate_id,
                    top_n=args.esyn_top_n,
                    timeout=args.timeout,
                    synth_timeout=args.timeout,
                    eval_timeout=args.timeout,
                    candidate_prefix="{0}_esyn_from_aig".format(case),
                    max_outputs=args.esyn_max_outputs,
                )
            )
        else:
            raise RuntimeError("Unknown flow: {0}".format(flow))

    append_candidates(args.results, candidates)
    best = best_candidate(candidates)
    best_aig_path = None
    if best is not None:
        args.best_dir.mkdir(parents=True, exist_ok=True)
        best_aig_path = args.best_dir / "{0}.aig".format(case)
        shutil.copyfile(str(best.aig_path), str(best_aig_path))

    return baseline, best, candidates, best_aig_path


def parse_args():
    parser = argparse.ArgumentParser(description="Run candidate flows for ALS benchmark cases.")
    case_group = parser.add_mutually_exclusive_group(required=True)
    case_group.add_argument("--case", type=parse_case_name, help="Benchmark case name, for example ex200.")
    case_group.add_argument(
        "--cases",
        type=parse_cases,
        help="Comma-separated cases or ranges, for example ex200-ex209 or ex200,ex201.",
    )
    case_group.add_argument("--all", action="store_true", help="Run ex200 through ex299.")
    parser.add_argument(
        "--flows",
        default="baseline,abc_resyn2",
        help="Comma-separated flows. Available: baseline,abc_all,{0},{1}.".format(
            ",".join(ABC_FLOW_COMMANDS.keys()),
            ",".join(BACKEND_FLOWS),
        ),
    )
    parser.add_argument("--experiment", default=None, help="Experiment name used for default summary and best paths.")
    parser.add_argument("--abc", type=Path, default=ROOT / "student" / "abc")
    parser.add_argument("--benchmarks", type=Path, default=ROOT / "benchmarks")
    parser.add_argument("--baseline-dir", type=Path, default=ROOT / "baselines" / "abc_st" / "aigs")
    parser.add_argument("--work-dir", type=Path, default=ROOT / "student" / "work" / "pipeline")
    parser.add_argument("--results", type=Path, default=ROOT / "student" / "results" / "candidate_history.csv")
    parser.add_argument("--best-dir", type=Path, default=None)
    parser.add_argument("--summary", type=Path, default=None)
    parser.add_argument("--best-results", type=Path, default=ROOT / "student" / "results" / "best_candidates.csv")
    parser.add_argument("--timeout", type=int, default=60)
    parser.add_argument("--mockturtle-runner", type=Path, default=None)
    parser.add_argument("--culs-bin", type=Path, default=default_culs_bin())
    parser.add_argument("--esyn-top-n", type=int, default=3)
    parser.add_argument("--esyn-max-outputs", type=int, default=None)
    args = parser.parse_args()

    flow_spec = args.flows
    try:
        args.flows = parse_flows(flow_spec)
    except argparse.ArgumentTypeError as exc:
        parser.error(str(exc))

    if args.case is not None:
        args.cases = [args.case]
    elif args.all:
        args.cases = ["ex{0:03d}".format(number) for number in range(200, 300)]

    if args.experiment is None:
        args.experiment = infer_experiment(flow_spec, args.flows)
    if args.best_dir is None:
        args.best_dir = ROOT / "student" / "work" / "best" / args.experiment
    if args.summary is None:
        args.summary = ROOT / "student" / "results" / "{0}_summary.csv".format(args.experiment)

    return args


def main():
    args = parse_args()
    if not args.abc.is_file():
        print("ABC executable not found: {0}".format(args.abc), file=sys.stderr)
        return 2

    summary_rows = []
    best_rows = []
    exit_code = 0

    for case in args.cases:
        try:
            baseline, best, candidates, best_aig_path = run_case(args, case)
        except RuntimeError as exc:
            print("{0}: {1}".format(case, exc), file=sys.stderr)
            return 2

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

        summary_rows.append(summary_row(case, baseline, best, candidates, best_aig_path))
        if best is None:
            print("{0}: no equivalent candidate generated.".format(case), file=sys.stderr)
            exit_code = 1
            continue

        best_rows.append(candidate_best_row(best, best_aig_path))
        print(
            "{case} Best: {cid} area={area} delay={delay} adp={adp} best_path={path}".format(
                case=case,
                cid=best.candidate_id,
                area=best.area,
                delay=best.delay,
                adp=best.adp,
                path=best_aig_path,
            )
        )

    write_csv(args.summary, SUMMARY_FIELDNAMES, summary_rows)
    write_csv(args.best_results, CANDIDATE_FIELDNAMES, best_rows)
    print("Summary: {0}".format(args.summary))
    print("Best candidates: {0}".format(args.best_results))
    print("Best AIG directory: {0}".format(args.best_dir))
    return exit_code


if __name__ == "__main__":
    raise SystemExit(main())
