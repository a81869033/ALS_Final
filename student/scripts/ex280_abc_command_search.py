#!/usr/bin/env python3
"""Aggressive ABC command search for ex280 backend optimization."""

import argparse
import csv
import hashlib
import shutil
import subprocess
import sys
import time
from collections import OrderedDict
from pathlib import Path


ROOT = Path(__file__).resolve().parents[2]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from student.backends.abc_flow import ABC_FLOW_COMMANDS, evaluate_aig
from student.common.abc import run_aig_flow
from student.common.candidate import Candidate, FIELDNAMES


CASE = "ex280"
DEFAULT_SEED_AIG = ROOT / "student" / "work" / "best" / "ex280_backend_best.aig"
DEFAULT_TRUTH = ROOT / "benchmarks" / "ex280.truth"
DEFAULT_RUN_ID = "ex280_backend_abc_command_{0}".format(time.strftime("%Y%m%d_%H%M"))


def command_portfolio():
    flows = OrderedDict()
    for name, commands in ABC_FLOW_COMMANDS.items():
        flows[name] = commands

    heavy_resub = (
        "balance; resub -K 6; rewrite; resub -K 6 -N 2; refactor; "
        "resub -K 8; balance; resub -K 8 -N 2; rewrite; "
        "resub -K 10; rewrite -z; resub -K 10 -N 2; "
        "resub -K 12; refactor -z; resub -K 12 -N 2; "
        "resub -K 14; rewrite -z; balance"
    )
    heavy_resub_l = heavy_resub.replace("balance", "balance -l").replace(
        "rewrite", "rewrite -l"
    ).replace("refactor", "refactor -l")
    resyn2 = ABC_FLOW_COMMANDS["abc_resyn2"]
    resyn2rs = ABC_FLOW_COMMANDS["abc_resyn2rs"]
    compress2rs = ABC_FLOW_COMMANDS["abc_compress2rs"]

    macros = OrderedDict(
        [
            ("resyn2rs", resyn2rs),
            ("resyn2rs_x2", resyn2rs + "; " + resyn2rs),
            ("heavy_resub", heavy_resub),
            ("compress2rs", compress2rs),
            ("heavy_resub_l", heavy_resub_l),
            ("rw_rf_loop", "balance; rewrite; refactor; rewrite -z; refactor -z; balance"),
            ("fraig_resub", "fraig; balance; " + heavy_resub),
            ("choice_resyn", "fraig; rewrite; refactor; balance; " + resyn2),
            ("if6_recover", "if -K 6; strash; balance; rewrite -z; balance; " + resyn2rs),
            ("if8_recover", "if -K 8; strash; balance; rewrite -z; balance; " + resyn2rs),
        ]
    )
    prefixes = OrderedDict(
        [
            ("plain", "strash"),
            ("dc2", "strash; dc2; balance"),
            ("dch", "strash; dch; balance"),
            ("dc2_dch", "strash; dc2; dch; balance"),
            ("dch_dc2", "strash; dch; dc2; balance"),
            ("fraig", "strash; fraig; balance"),
            ("src_l", "strash; balance -l; rewrite -l; rewrite -z -l; balance -l"),
        ]
    )
    suffixes = OrderedDict(
        [
            ("none", ""),
            ("dc2", "strash; dc2; balance"),
            ("dch", "strash; dch; balance"),
            ("rwz", "rewrite -z; balance"),
            ("rfz_rwz", "refactor -z; rewrite -z; balance"),
            ("fraig_dc2", "fraig; dc2; balance"),
        ]
    )

    for prefix_name, prefix in prefixes.items():
        for macro_name, macro in macros.items():
            for suffix_name, suffix in suffixes.items():
                name = "aggr_{0}_{1}_{2}".format(prefix_name, macro_name, suffix_name)
                commands = prefix + "; " + macro
                if suffix:
                    commands += "; " + suffix
                flows[name] = commands

    for k in range(3, 11):
        flows["delay_if{0}_strash".format(k)] = "if -K {0}; strash; balance".format(k)
        flows["delay_if{0}_resyn2".format(k)] = (
            "if -K {0}; strash; ".format(k) + resyn2
        )
        flows["delay_if{0}_resyn2rs".format(k)] = (
            "if -K {0}; strash; ".format(k) + resyn2rs
        )
        flows["delay_if{0}_compress2rs".format(k)] = (
            "if -K {0}; strash; ".format(k) + compress2rs
        )
        flows["delay_if{0}_area_resyn2rs".format(k)] = (
            "if -K {0} -a; strash; ".format(k) + resyn2rs
        )
        flows["delay_if{0}_area_compress2rs".format(k)] = (
            "if -K {0} -a; strash; ".format(k) + compress2rs
        )
        flows["delay_if{0}_dc2_recover".format(k)] = (
            "if -K {0}; strash; dc2; balance; ".format(k) + resyn2rs
        )
        flows["delay_if{0}_dch_recover".format(k)] = (
            "if -K {0}; strash; dch; balance; ".format(k) + resyn2rs
        )

    return flows


def write_csv(path, rows):
    path = Path(path)
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=FIELDNAMES)
        writer.writeheader()
        for row in rows:
            writer.writerow(row.to_row())


def aig_hash(path):
    digest = hashlib.sha256()
    with Path(path).open("rb") as handle:
        for chunk in iter(lambda: handle.read(1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest()


def valid_candidates(candidates):
    return [item for item in candidates if item.equivalent and item.adp is not None]


def best_candidate(candidates):
    valid = valid_candidates(candidates)
    if not valid:
        return None
    return min(valid, key=lambda item: (item.adp, item.area, item.delay, item.candidate_id))


def top_candidates(candidates, top_k):
    valid = valid_candidates(candidates)
    valid.sort(key=lambda item: (item.adp, item.area, item.delay, item.candidate_id))
    return valid[:top_k]


def failed_candidate(candidate_id, parent, flow_name, output_aig, exc, runtime_sec):
    message = "{0}: {1}".format(type(exc).__name__, exc)
    if isinstance(exc, subprocess.TimeoutExpired):
        message = "timeout after {0}s: {1}".format(exc.timeout, " ".join(exc.cmd))
    return Candidate(
        case=CASE,
        candidate_id=candidate_id,
        parent_id=parent.candidate_id,
        source="abc",
        tool_chain=flow_name,
        aig_path=Path(output_aig),
        equivalent=False,
        runtime_sec=runtime_sec,
        notes=message[:1000],
    )


def run_flow(args, parent, flow_name, commands, round_index):
    flow_dir = args.work_dir / CASE / "round_{0}".format(round_index) / parent.candidate_id / flow_name
    output_aig = flow_dir / "{0}_{1}_{2}.aig".format(CASE, parent.candidate_id, flow_name)
    candidate_id = "{0}_{1}_{2}".format(parent.candidate_id, flow_name, round_index)
    start = time.time()
    try:
        run_aig_flow(
            abc=args.abc,
            input_aig=parent.aig_path,
            output_aig=output_aig,
            commands=commands,
            timeout=args.timeout,
        )
        generation_sec = time.time() - start
        candidate = evaluate_aig(
            case=CASE,
            candidate_id=candidate_id,
            parent_id=parent.candidate_id,
            source="abc",
            tool_chain=flow_name,
            aig_path=output_aig,
            truth=args.truth,
            abc=args.abc,
            notes="aggressive ABC command search",
            timeout=args.timeout,
        )
        candidate.runtime_sec += generation_sec
        return candidate
    except (RuntimeError, subprocess.TimeoutExpired) as exc:
        return failed_candidate(candidate_id, parent, flow_name, output_aig, exc, time.time() - start)


def parse_args(argv=None):
    parser = argparse.ArgumentParser(description="Run aggressive ABC command search for ex280.")
    parser.add_argument("--seed-aig", type=Path, default=DEFAULT_SEED_AIG)
    parser.add_argument("--truth", type=Path, default=DEFAULT_TRUTH)
    parser.add_argument("--abc", type=Path, default=ROOT / "student" / "abc")
    parser.add_argument("--work-dir", type=Path, default=ROOT / "student" / "work" / DEFAULT_RUN_ID)
    parser.add_argument("--results", type=Path, default=ROOT / "student" / "results" / "{0}.csv".format(DEFAULT_RUN_ID))
    parser.add_argument("--best-results", type=Path, default=ROOT / "student" / "results" / "{0}_best.csv".format(DEFAULT_RUN_ID))
    parser.add_argument("--best-aig", type=Path, default=ROOT / "student" / "work" / "best" / "{0}.aig".format(DEFAULT_RUN_ID))
    parser.add_argument("--rounds", type=int, default=2)
    parser.add_argument("--top-k", type=int, default=6)
    parser.add_argument("--timeout", type=int, default=180)
    parser.add_argument("--max-flows", type=int, default=0, help="Run only the first N flows after generation; 0 means all.")
    return parser.parse_args(argv)


def main(argv=None):
    args = parse_args(argv)
    if not args.seed_aig.is_file():
        raise RuntimeError("seed AIG not found: {0}".format(args.seed_aig))

    flows = command_portfolio()
    if args.max_flows:
        flows = OrderedDict(list(flows.items())[: args.max_flows])

    args.work_dir.mkdir(parents=True, exist_ok=True)
    candidates = []
    seen_hashes = set()

    seed = evaluate_aig(
        case=CASE,
        candidate_id="ex280_seed_backend_best",
        parent_id="",
        source="seed",
        tool_chain="seed",
        aig_path=args.seed_aig,
        truth=args.truth,
        abc=args.abc,
        notes="current backend best ex280 seed AIG",
        timeout=args.timeout,
    )
    candidates.append(seed)
    seen_hashes.add(aig_hash(seed.aig_path))
    print(
        "seed: area={0} delay={1} adp={2} flows={3}".format(
            seed.area,
            seed.delay,
            seed.adp,
            len(flows),
        ),
        flush=True,
    )

    for round_index in range(1, args.rounds + 1):
        parents = top_candidates(candidates, args.top_k)
        print(
            "round {0}: parents={1} best_adp={2}".format(
                round_index,
                len(parents),
                best_candidate(candidates).adp,
            ),
            flush=True,
        )
        for parent in parents:
            for flow_name, commands in flows.items():
                candidate = run_flow(args, parent, flow_name, commands, round_index)
                if candidate.equivalent and candidate.aig_path.is_file():
                    digest = aig_hash(candidate.aig_path)
                    if digest in seen_hashes:
                        continue
                    seen_hashes.add(digest)
                candidates.append(candidate)
                current_best = best_candidate(candidates)
                print(
                    "{0} {1} parent={2} area={3} delay={4} adp={5} best={6}".format(
                        "ok" if candidate.equivalent else "fail",
                        flow_name,
                        parent.candidate_id,
                        candidate.area,
                        candidate.delay,
                        candidate.adp,
                        None if current_best is None else current_best.adp,
                    ),
                    flush=True,
                )
        write_csv(args.results, candidates)

    best = best_candidate(candidates)
    write_csv(args.results, candidates)
    write_csv(args.best_results, [] if best is None else [best])
    if best is not None:
        args.best_aig.parent.mkdir(parents=True, exist_ok=True)
        shutil.copyfile(str(best.aig_path), str(args.best_aig))
        print(
            "BEST area={0} delay={1} adp={2} id={3} aig={4}".format(
                best.area,
                best.delay,
                best.adp,
                best.candidate_id,
                args.best_aig,
            )
        )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
