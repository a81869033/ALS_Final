#!/usr/bin/env python3
"""Backend optimization search for the current best ex280 Verilog seed."""

import argparse
import csv
import hashlib
import shutil
import subprocess
import sys
import time
from pathlib import Path


ROOT = Path(__file__).resolve().parents[2]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from student.backends.abc9_flow import (
    ABC9_DEEPSYN_FLOW,
    ABC9_DEEPSYN_NODE_LIMIT,
    ABC9_DEEPSYN_TIMEOUT,
    ABC9_FLOW_COMMANDS,
)
from student.backends.abc_flow import ABC_FLOW_COMMANDS, evaluate_aig
from student.backends.culs_flow import (
    CulsError,
    culs_resyn2_candidate,
    default_culs_bin,
)
from student.backends.mockturtle_flow import SUPPORTED_FLOWS, mockturtle_flow_candidate
from student.common.abc import run_aig_flow
from student.common.candidate import Candidate, FIELDNAMES


CASE = "ex280"
DEFAULT_RUN_ID = "ex280_backend_search_{0}".format(time.strftime("%Y%m%d_%H%M"))
DEFAULT_SEED_AIG = (
    ROOT
    / "student"
    / "work"
    / "target_ex280_bdd_eval"
    / "ex280"
    / "aigs"
    / "ex280_unknown_shared_bdd_12x12_ex280_sift_449.aig"
)
DEFAULT_TRUTH = ROOT / "benchmarks" / "ex280.truth"


EXTRA_ABC_COMMANDS = {
    "abc_resyn2_x2": ABC_FLOW_COMMANDS["abc_resyn2"] + "; " + ABC_FLOW_COMMANDS["abc_resyn2"],
    "abc_resyn2rs_x2": ABC_FLOW_COMMANDS["abc_resyn2rs"] + "; " + ABC_FLOW_COMMANDS["abc_resyn2rs"],
    "abc_dc2_dch_resyn2": "strash; dc2; dch; balance; " + ABC_FLOW_COMMANDS["abc_resyn2"],
    "abc_dch_dc2_resyn2rs": "strash; dch; dc2; balance; " + ABC_FLOW_COMMANDS["abc_resyn2rs"],
    "abc_compress2rs_dc2": ABC_FLOW_COMMANDS["abc_compress2rs"] + "; strash; dc2; balance",
    "abc_fraig_dc2": "strash; balance; rewrite; rewrite -z; fraig; dc2; balance",
    "abc_choice_rw": "strash; balance; rewrite; refactor; rewrite -z; balance; fraig; rewrite; balance",
}


ALL_ABC_COMMANDS = {}
ALL_ABC_COMMANDS.update(ABC_FLOW_COMMANDS)
ALL_ABC_COMMANDS.update(EXTRA_ABC_COMMANDS)


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


def failed_candidate(case, candidate_id, parent, source, tool_chain, aig_path, exc, runtime_sec):
    message = "{0}: {1}".format(type(exc).__name__, exc)
    if isinstance(exc, subprocess.TimeoutExpired):
        message = "timeout after {0}s: {1}".format(exc.timeout, " ".join(exc.cmd))
    return Candidate(
        case=case,
        candidate_id=candidate_id,
        parent_id=parent.candidate_id,
        source=source,
        tool_chain=tool_chain,
        aig_path=Path(aig_path),
        equivalent=False,
        runtime_sec=runtime_sec,
        notes=message[:1000],
    )


def run_abc_candidate(args, parent, flow_name, commands, round_index):
    flow_dir = args.work_dir / CASE / "round_{0}".format(round_index) / flow_name
    output_aig = flow_dir / "{0}_{1}_{2}.aig".format(CASE, parent.candidate_id, flow_name)
    start = time.time()
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
        candidate_id="{0}_{1}_{2}".format(parent.candidate_id, flow_name, round_index),
        parent_id=parent.candidate_id,
        source="abc",
        tool_chain=flow_name,
        aig_path=output_aig,
        truth=args.truth,
        abc=args.abc,
        notes="ex280 backend ABC search",
        timeout=args.timeout,
    )
    candidate.runtime_sec += generation_sec
    return candidate


def run_abc9_candidate(args, parent, flow_name, commands, round_index):
    flow_timeout = args.deepsyn_timeout if flow_name == ABC9_DEEPSYN_FLOW else args.timeout
    flow_dir = args.work_dir / CASE / "round_{0}".format(round_index) / flow_name
    output_aig = flow_dir / "{0}_{1}_{2}.aig".format(CASE, parent.candidate_id, flow_name)
    start = time.time()
    run_aig_flow(
        abc=args.abc,
        input_aig=parent.aig_path,
        output_aig=output_aig,
        commands=commands,
        timeout=flow_timeout,
    )
    generation_sec = time.time() - start
    candidate = evaluate_aig(
        case=CASE,
        candidate_id="{0}_{1}_{2}".format(parent.candidate_id, flow_name, round_index),
        parent_id=parent.candidate_id,
        source="abc9",
        tool_chain=flow_name,
        aig_path=output_aig,
        truth=args.truth,
        abc=args.abc,
        notes="ex280 backend ABC9 search",
        timeout=args.timeout,
    )
    candidate.runtime_sec += generation_sec
    return candidate


def run_one_tool(args, parent, source, flow_name, round_index):
    start = time.time()
    try:
        if source == "abc":
            return run_abc_candidate(args, parent, flow_name, ALL_ABC_COMMANDS[flow_name], round_index)
        if source == "abc9":
            if flow_name == ABC9_DEEPSYN_FLOW:
                if not args.enable_deepsyn:
                    raise RuntimeError("deepsyn disabled for this run")
                if parent.area is None or parent.area >= args.deepsyn_node_limit:
                    raise RuntimeError(
                        "deepsyn skipped: parent nodes {0} is not less than {1}".format(
                            "unknown" if parent.area is None else parent.area,
                            args.deepsyn_node_limit,
                        )
                    )
            return run_abc9_candidate(args, parent, flow_name, ABC9_FLOW_COMMANDS[flow_name], round_index)
        if source == "mockturtle":
            candidate = mockturtle_flow_candidate(
                case=CASE,
                flow_name=flow_name,
                parent=parent,
                truth=args.truth,
                work_dir=args.work_dir / CASE / "round_{0}".format(round_index) / parent.candidate_id / "mockturtle",
                abc=args.abc,
                runner=args.mockturtle_runner,
                timeout=args.timeout,
            )
            candidate.candidate_id = "{0}_mockturtle_{1}_{2}".format(parent.candidate_id, flow_name, round_index)
            return candidate
        if source == "culs":
            if not args.enable_culs:
                raise RuntimeError("CULS disabled for this run")
            candidate = culs_resyn2_candidate(
                case=CASE,
                parent=parent,
                truth=args.truth,
                work_dir=args.work_dir / CASE / "round_{0}".format(round_index) / parent.candidate_id / "culs",
                culs_bin=args.culs_bin,
                abc=args.abc,
                timeout=args.timeout,
            )
            candidate.candidate_id = "{0}_culs_resyn2_{1}".format(parent.candidate_id, round_index)
            return candidate
        raise RuntimeError("unknown source: {0}".format(source))
    except (RuntimeError, subprocess.TimeoutExpired, CulsError) as exc:
        output_aig = args.work_dir / CASE / "round_{0}".format(round_index) / source / "{0}_{1}.aig".format(
            parent.candidate_id,
            flow_name,
        )
        return failed_candidate(
            case=CASE,
            candidate_id="{0}_{1}_{2}".format(parent.candidate_id, flow_name, round_index),
            parent=parent,
            source=source,
            tool_chain=flow_name,
            aig_path=output_aig,
            exc=exc,
            runtime_sec=time.time() - start,
        )


def parse_args(argv=None):
    parser = argparse.ArgumentParser(description="Search backend optimizations for ex280.")
    parser.add_argument("--seed-aig", type=Path, default=DEFAULT_SEED_AIG)
    parser.add_argument("--truth", type=Path, default=DEFAULT_TRUTH)
    parser.add_argument("--abc", type=Path, default=ROOT / "student" / "abc")
    parser.add_argument("--work-dir", type=Path, default=ROOT / "student" / "work" / DEFAULT_RUN_ID)
    parser.add_argument("--results", type=Path, default=ROOT / "student" / "results" / "{0}.csv".format(DEFAULT_RUN_ID))
    parser.add_argument("--best-results", type=Path, default=ROOT / "student" / "results" / "{0}_best.csv".format(DEFAULT_RUN_ID))
    parser.add_argument("--best-aig", type=Path, default=ROOT / "student" / "work" / "best" / "{0}.aig".format(DEFAULT_RUN_ID))
    parser.add_argument("--timeout", type=int, default=300)
    parser.add_argument("--rounds", type=int, default=3)
    parser.add_argument("--top-k", type=int, default=5)
    parser.add_argument("--enable-deepsyn", action="store_true")
    parser.add_argument("--deepsyn-timeout", type=int, default=ABC9_DEEPSYN_TIMEOUT)
    parser.add_argument("--deepsyn-node-limit", type=int, default=ABC9_DEEPSYN_NODE_LIMIT)
    parser.add_argument("--enable-mockturtle", action="store_true")
    parser.add_argument("--mockturtle-runner", type=Path, default=None)
    parser.add_argument("--enable-culs", action="store_true")
    parser.add_argument("--culs-bin", type=Path, default=default_culs_bin())
    return parser.parse_args(argv)


def main(argv=None):
    args = parse_args(argv)
    if not args.seed_aig.is_file():
        raise RuntimeError("seed AIG not found: {0}".format(args.seed_aig))

    args.work_dir.mkdir(parents=True, exist_ok=True)
    candidates = []
    seen_hashes = set()

    seed = evaluate_aig(
        case=CASE,
        candidate_id="ex280_seed_best_verilog",
        parent_id="",
        source="seed",
        tool_chain="seed",
        aig_path=args.seed_aig,
        truth=args.truth,
        abc=args.abc,
        notes="current best ex280 Verilog seed AIG",
        timeout=args.timeout,
    )
    candidates.append(seed)
    seen_hashes.add(aig_hash(seed.aig_path))
    print(
        "seed: area={0} delay={1} adp={2} aig={3}".format(
            seed.area,
            seed.delay,
            seed.adp,
            seed.aig_path,
        ),
        flush=True,
    )

    tool_specs = []
    for flow_name in ALL_ABC_COMMANDS:
        tool_specs.append(("abc", flow_name))
    for flow_name in ABC9_FLOW_COMMANDS:
        if flow_name != ABC9_DEEPSYN_FLOW or args.enable_deepsyn:
            tool_specs.append(("abc9", flow_name))
    if args.enable_mockturtle:
        for flow_name in SUPPORTED_FLOWS:
            tool_specs.append(("mockturtle", flow_name))
    if args.enable_culs:
        tool_specs.append(("culs", "culs_resyn2"))

    for round_index in range(1, args.rounds + 1):
        parents = top_candidates(candidates, args.top_k)
        if not parents:
            break
        print(
            "round {0}: parents={1} best_adp={2}".format(
                round_index,
                len(parents),
                best_candidate(candidates).adp,
            ),
            flush=True,
        )
        for parent in parents:
            for source, flow_name in tool_specs:
                candidate = run_one_tool(args, parent, source, flow_name, round_index)
                if candidate.equivalent and candidate.aig_path.is_file():
                    digest = aig_hash(candidate.aig_path)
                    if digest in seen_hashes:
                        continue
                    seen_hashes.add(digest)
                candidates.append(candidate)
                current_best = best_candidate(candidates)
                status = "ok" if candidate.equivalent else "fail"
                print(
                    "{0} {1} parent={2} {3} area={4} delay={5} adp={6} best={7}".format(
                        status,
                        flow_name,
                        parent.candidate_id,
                        candidate.candidate_id,
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
