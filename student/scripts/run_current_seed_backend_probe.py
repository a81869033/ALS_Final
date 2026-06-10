#!/usr/bin/env python3
"""Blind backend probe for the primary current seed bundles."""

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

from student.backends.abc9_flow import (  # noqa: E402
    ABC9_DEEPSYN_FLOW,
    ABC9_DEEPSYN_NODE_LIMIT,
    ABC9_DEEPSYN_TIMEOUT,
    ABC9_FLOW_COMMANDS,
)
from student.backends.abc_flow import ABC_ALL_FLOWS, ABC_FLOW_COMMANDS, evaluate_aig  # noqa: E402
from student.backends.culs_flow import CulsError, culs_resyn2_candidate, default_culs_bin  # noqa: E402
from student.backends.mockturtle_flow import (  # noqa: E402
    SUPPORTED_FLOWS,
    discover_runner,
    mockturtle_flow_candidate,
)
from student.common.abc import run_aig_flow  # noqa: E402
from student.common.candidate import Candidate  # noqa: E402


DEFAULT_RUN_ID = "ex200_ex299_backend_blind_current_{0}".format(time.strftime("%Y%m%d_%H%M"))

PRIMARY_BUNDLES = OrderedDict(
    [
        ("bf16", ROOT / "student" / "seeds" / "bf16" / "ex200_ex219_current" / "results" / "best.csv"),
        ("fp16", ROOT / "student" / "seeds" / "fp16" / "ex220_ex239_current" / "results" / "best.csv"),
        (
            "float_fp8",
            ROOT / "student" / "seeds" / "float_fp8" / "ex240_ex254_current" / "results" / "best.csv",
        ),
        ("integer", ROOT / "student" / "seeds" / "integer" / "ex255_ex279_current" / "results" / "best.csv"),
        ("unknown", ROOT / "student" / "seeds" / "unknown" / "ex280_ex299_current" / "results" / "best.csv"),
    ]
)

FIELDNAMES = [
    "case",
    "domain",
    "parent_candidate_id",
    "parent_area",
    "parent_delay",
    "parent_adp",
    "source_seed_csv",
    "parent_aig_path",
    "source",
    "tool_chain",
    "candidate_id",
    "equivalent",
    "area",
    "delay",
    "adp",
    "delta_adp",
    "pct_adp_change",
    "runtime_sec",
    "work_deleted",
    "notes",
]


class Seed:
    def __init__(self, domain, source_csv, row):
        self.domain = domain
        self.source_csv = Path(source_csv)
        self.case = row.get("case", "").strip()
        self.candidate_id = row.get("candidate_id", "").strip()
        self.aig_path = resolve_repo_path(row.get("aig_path", "").strip())
        self.row = row


def resolve_repo_path(value):
    path = Path(value)
    if path.is_absolute():
        return path
    return ROOT / path


def parse_case_set(values):
    selected = set()
    for value in values:
        for item in value.split(","):
            item = item.strip()
            if item:
                selected.add(item)
    return selected


def relative_or_absolute(path):
    path = Path(path)
    try:
        return str(path.relative_to(ROOT))
    except ValueError:
        return str(path)


def load_seeds(args):
    wanted_domains = parse_case_set(args.domains) or set(PRIMARY_BUNDLES.keys())
    unknown_domains = wanted_domains - set(PRIMARY_BUNDLES.keys())
    if unknown_domains:
        raise RuntimeError(
            "Unknown domain(s): {0}. Expected one of: {1}".format(
                ",".join(sorted(unknown_domains)),
                ",".join(PRIMARY_BUNDLES.keys()),
            )
        )
    wanted_cases = parse_case_set(args.cases)
    seeds = []
    for domain, csv_path in PRIMARY_BUNDLES.items():
        if domain not in wanted_domains:
            continue
        csv_text = str(csv_path)
        if "/legacy/" in csv_text or "backend_candidates" in csv_text:
            raise RuntimeError("Refusing non-primary seed bundle: {0}".format(csv_path))
        if not csv_path.is_file():
            raise RuntimeError("Primary seed CSV not found: {0}".format(csv_path))
        with csv_path.open(newline="") as handle:
            reader = csv.DictReader(handle)
            for row in reader:
                seed = Seed(domain, csv_path, row)
                if wanted_cases and seed.case not in wanted_cases:
                    continue
                if not seed.case:
                    raise RuntimeError("Seed row has no case in {0}".format(csv_path))
                if not seed.candidate_id:
                    raise RuntimeError("Seed row has no candidate_id for {0}".format(seed.case))
                if not seed.aig_path.is_file():
                    raise RuntimeError("Seed AIG not found for {0}: {1}".format(seed.case, seed.aig_path))
                seeds.append(seed)
                if args.max_cases and len(seeds) >= args.max_cases:
                    return seeds
    return seeds


def aig_hash(path):
    digest = hashlib.sha256()
    with Path(path).open("rb") as handle:
        for chunk in iter(lambda: handle.read(1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest()


def format_number(value):
    return "" if value is None else str(value)


def format_pct(delta, parent_adp):
    if delta is None or parent_adp in (None, 0):
        return ""
    return "{0:.6f}".format((float(delta) / float(parent_adp)) * 100.0)


def row_from_candidate(seed, parent, candidate, work_deleted):
    delta = None
    if candidate.adp is not None and parent.adp is not None:
        delta = candidate.adp - parent.adp
    return {
        "case": seed.case,
        "domain": seed.domain,
        "parent_candidate_id": parent.candidate_id,
        "parent_area": format_number(parent.area),
        "parent_delay": format_number(parent.delay),
        "parent_adp": format_number(parent.adp),
        "source_seed_csv": str(seed.source_csv.relative_to(ROOT)),
        "parent_aig_path": relative_or_absolute(parent.aig_path),
        "source": candidate.source,
        "tool_chain": candidate.tool_chain,
        "candidate_id": candidate.candidate_id,
        "equivalent": "1" if candidate.equivalent else "0",
        "area": format_number(candidate.area),
        "delay": format_number(candidate.delay),
        "adp": format_number(candidate.adp),
        "delta_adp": format_number(delta),
        "pct_adp_change": format_pct(delta, parent.adp),
        "runtime_sec": "{0:.3f}".format(candidate.runtime_sec),
        "work_deleted": "1" if work_deleted else "0",
        "notes": candidate.notes,
    }


def write_rows(path, rows, work_deleted):
    path = Path(path)
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=FIELDNAMES)
        writer.writeheader()
        for row in rows:
            row = dict(row)
            row["work_deleted"] = "1" if work_deleted else "0"
            writer.writerow(row)


def failed_candidate(seed, parent, source, tool_chain, aig_path, exc, runtime_sec):
    message = "{0}: {1}".format(type(exc).__name__, exc)
    if isinstance(exc, subprocess.TimeoutExpired):
        message = "timeout after {0}s: {1}".format(exc.timeout, " ".join(exc.cmd))
    return Candidate(
        case=seed.case,
        candidate_id="{0}_{1}".format(parent.candidate_id, tool_chain),
        parent_id=parent.candidate_id,
        source=source,
        tool_chain=tool_chain,
        aig_path=Path(aig_path),
        equivalent=False,
        runtime_sec=runtime_sec,
        notes=message[:1000],
    )


def abc_candidate(args, seed, parent, flow_name):
    output_aig = args.work_dir / seed.case / "abc" / flow_name / "{0}_{1}.aig".format(seed.case, flow_name)
    start = time.time()
    run_aig_flow(
        abc=args.abc,
        input_aig=parent.aig_path,
        output_aig=output_aig,
        commands=ABC_FLOW_COMMANDS[flow_name],
        timeout=args.timeout,
    )
    generation_sec = time.time() - start
    candidate = evaluate_aig(
        case=seed.case,
        candidate_id="{0}_{1}".format(parent.candidate_id, flow_name),
        parent_id=parent.candidate_id,
        source="abc",
        tool_chain=flow_name,
        aig_path=output_aig,
        truth=ROOT / "benchmarks" / "{0}.truth".format(seed.case),
        abc=args.abc,
        notes="blind current-seed ABC probe",
        timeout=args.timeout,
    )
    candidate.runtime_sec += generation_sec
    return candidate


def abc9_candidate(args, seed, parent, flow_name):
    output_aig = args.work_dir / seed.case / "abc9" / flow_name / "{0}_{1}.aig".format(seed.case, flow_name)
    timeout = args.deepsyn_timeout if flow_name == ABC9_DEEPSYN_FLOW else args.timeout
    if flow_name == ABC9_DEEPSYN_FLOW:
        if parent.area is None or parent.area >= args.deepsyn_node_limit:
            raise RuntimeError(
                "deepsyn skipped: parent nodes {0} is not less than {1}".format(
                    "unknown" if parent.area is None else parent.area,
                    args.deepsyn_node_limit,
                )
            )
    start = time.time()
    run_aig_flow(
        abc=args.abc,
        input_aig=parent.aig_path,
        output_aig=output_aig,
        commands=ABC9_FLOW_COMMANDS[flow_name],
        timeout=timeout,
    )
    generation_sec = time.time() - start
    candidate = evaluate_aig(
        case=seed.case,
        candidate_id="{0}_{1}".format(parent.candidate_id, flow_name),
        parent_id=parent.candidate_id,
        source="abc9",
        tool_chain=flow_name,
        aig_path=output_aig,
        truth=ROOT / "benchmarks" / "{0}.truth".format(seed.case),
        abc=args.abc,
        notes="blind current-seed ABC9 probe",
        timeout=args.timeout,
    )
    candidate.runtime_sec += generation_sec
    return candidate


def run_tool(args, seed, parent, source, flow_name):
    start = time.time()
    try:
        if source == "abc":
            return abc_candidate(args, seed, parent, flow_name)
        if source == "abc9":
            return abc9_candidate(args, seed, parent, flow_name)
        if source == "mockturtle":
            candidate = mockturtle_flow_candidate(
                case=seed.case,
                flow_name=flow_name,
                parent=parent,
                truth=ROOT / "benchmarks" / "{0}.truth".format(seed.case),
                work_dir=args.work_dir / seed.case / "mockturtle",
                abc=args.abc,
                runner=args.mockturtle_runner,
                timeout=args.timeout,
            )
            candidate.candidate_id = "{0}_mockturtle_{1}".format(parent.candidate_id, flow_name)
            return candidate
        if source == "culs":
            candidate = culs_resyn2_candidate(
                case=seed.case,
                parent=parent,
                truth=ROOT / "benchmarks" / "{0}.truth".format(seed.case),
                work_dir=args.work_dir / seed.case / "culs",
                culs_bin=args.culs_bin,
                abc=args.abc,
                timeout=args.timeout,
            )
            candidate.candidate_id = "{0}_culs_resyn2".format(parent.candidate_id)
            return candidate
        raise RuntimeError("unknown backend source: {0}".format(source))
    except (RuntimeError, subprocess.TimeoutExpired, CulsError) as exc:
        output_aig = args.work_dir / seed.case / source / flow_name / "{0}_{1}.aig".format(seed.case, flow_name)
        return failed_candidate(seed, parent, source, flow_name, output_aig, exc, time.time() - start)


def tool_specs(args):
    specs = []
    for flow_name in ABC_ALL_FLOWS:
        specs.append(("abc", flow_name))
    specs.append(("abc9", "abc9_syn2_dc2"))
    if args.enable_deepsyn:
        specs.append(("abc9", ABC9_DEEPSYN_FLOW))

    runner = args.mockturtle_runner or discover_runner(ROOT)
    if runner is not None:
        args.mockturtle_runner = runner
        for flow_name in SUPPORTED_FLOWS:
            specs.append(("mockturtle", flow_name))
    elif args.enable_mockturtle:
        specs.append(("mockturtle", "mockturtle_missing"))

    if args.enable_culs:
        specs.append(("culs", "culs_resyn2"))
    if args.max_flows:
        specs = specs[: args.max_flows]
    return specs


def evaluate_seed(args, seed):
    return evaluate_aig(
        case=seed.case,
        candidate_id=seed.candidate_id,
        parent_id="",
        source="seed",
        tool_chain="seed",
        aig_path=seed.aig_path,
        truth=ROOT / "benchmarks" / "{0}.truth".format(seed.case),
        abc=args.abc,
        notes="primary current seed baseline",
        timeout=args.timeout,
    )


def parse_args(argv=None):
    parser = argparse.ArgumentParser(description="Run blind backend probes on primary current seed bundles.")
    parser.add_argument("--run-id", default=DEFAULT_RUN_ID)
    parser.add_argument("--abc", type=Path, default=ROOT / "student" / "abc")
    parser.add_argument("--work-dir", type=Path, default=None)
    parser.add_argument("--results", type=Path, default=None)
    parser.add_argument("--timeout", type=int, default=300)
    parser.add_argument("--cases", action="append", default=[], help="Comma-separated case list, e.g. ex200,ex255.")
    parser.add_argument(
        "--domains",
        action="append",
        default=[],
        help="Comma-separated domain list from: {0}.".format(",".join(PRIMARY_BUNDLES.keys())),
    )
    parser.add_argument("--max-cases", type=int, default=0)
    parser.add_argument("--max-flows", type=int, default=0)
    parser.add_argument("--enable-deepsyn", action="store_true")
    parser.add_argument("--deepsyn-timeout", type=int, default=ABC9_DEEPSYN_TIMEOUT)
    parser.add_argument("--deepsyn-node-limit", type=int, default=ABC9_DEEPSYN_NODE_LIMIT)
    parser.add_argument("--enable-mockturtle", action="store_true", help="Require a MockTurtle attempt even if discovery fails.")
    parser.add_argument("--mockturtle-runner", type=Path, default=None)
    parser.add_argument("--enable-culs", action="store_true")
    parser.add_argument("--culs-bin", type=Path, default=default_culs_bin())
    parser.add_argument(
        "--cleanup-work",
        dest="cleanup_work",
        action="store_true",
        default=True,
        help="Delete the generated student/work/<run_id> tree after writing the final CSV. This is the default.",
    )
    parser.add_argument(
        "--keep-work",
        dest="cleanup_work",
        action="store_false",
        help="Keep generated AIG/log artifacts under student/work for debugging.",
    )
    args = parser.parse_args(argv)
    if args.work_dir is None:
        args.work_dir = ROOT / "student" / "work" / args.run_id
    if args.results is None:
        args.results = ROOT / "student" / "results" / "{0}.csv".format(args.run_id)
    return args


def main(argv=None):
    args = parse_args(argv)
    seeds = load_seeds(args)
    specs = tool_specs(args)
    if not seeds:
        raise RuntimeError("No primary current seeds matched the requested filters.")
    if not specs:
        raise RuntimeError("No backend flows selected.")

    args.work_dir.mkdir(parents=True, exist_ok=True)
    rows = []
    work_deleted = False

    print("run_id={0} seeds={1} flows={2}".format(args.run_id, len(seeds), len(specs)), flush=True)
    for seed in seeds:
        parent = evaluate_seed(args, seed)
        rows.append(row_from_candidate(seed, parent, parent, work_deleted=False))
        seen_hashes = set()
        if parent.equivalent and parent.aig_path.is_file():
            seen_hashes.add(aig_hash(parent.aig_path))
        print(
            "{0}: seed area={1} delay={2} adp={3}".format(seed.case, parent.area, parent.delay, parent.adp),
            flush=True,
        )
        for source, flow_name in specs:
            candidate = run_tool(args, seed, parent, source, flow_name)
            if candidate.equivalent and candidate.aig_path.is_file():
                digest = aig_hash(candidate.aig_path)
                if digest in seen_hashes:
                    print("{0}: duplicate {1}/{2}".format(seed.case, source, flow_name), flush=True)
                    continue
                seen_hashes.add(digest)
            rows.append(row_from_candidate(seed, parent, candidate, work_deleted=False))
            status = "ok" if candidate.equivalent else "fail"
            print(
                "{0}: {1} {2}/{3} adp={4}".format(seed.case, status, source, flow_name, candidate.adp),
                flush=True,
            )
        write_rows(args.results, rows, work_deleted=False)

    if args.cleanup_work and args.work_dir.is_dir():
        shutil.rmtree(str(args.work_dir))
        work_deleted = True
    write_rows(args.results, rows, work_deleted=work_deleted)
    print("results={0}".format(args.results), flush=True)
    print("work_deleted={0}".format(int(work_deleted)), flush=True)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
