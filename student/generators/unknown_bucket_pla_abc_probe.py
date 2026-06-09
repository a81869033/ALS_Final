#!/usr/bin/env python3
"""ABC PLA probe for exact bucket-key decompositions with invalid-key DCs."""

import argparse
import csv
import subprocess
import sys
from pathlib import Path


ROOT = Path(__file__).resolve().parents[2]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from student.frontends.truth import TruthTable
from student.generators.unknown_bucket_count_classifier import (
    bucket_counts,
    bucket_info,
    build_mapping,
    encode_key,
    feature_candidates,
    feature_name,
    feature_value,
    greedy_selectors,
    onehot_slots,
)


FIELDS = [
    "case",
    "variant",
    "key_width",
    "valid_keys",
    "total_keys",
    "abc_status",
    "area",
    "delay",
    "adp",
    "pla_path",
    "aig_path",
    "log_path",
    "notes",
]


def parse_cases(text):
    return [item.strip() for item in text.split(",") if item.strip()]


def parse_ps(output):
    for line in output.splitlines():
        if "and =" in line and "lev =" in line:
            parts = line.replace("=", " = ").split()
            area = None
            delay = None
            for index, item in enumerate(parts):
                if item == "and" and index + 2 < len(parts):
                    area = int(parts[index + 2])
                if item == "lev" and index + 2 < len(parts):
                    delay = int(parts[index + 2])
            if area is not None and delay is not None:
                return area, delay
    return None, None


def exact_bucket_mapping(case, benchmarks, max_selectors):
    table = TruthTable(benchmarks / "{0}.truth".format(case))
    outputs = list(table.iter_outputs())
    width = table.input_width
    buckets = bucket_info(onehot_slots(outputs, width))
    features = feature_candidates(case, width)
    rows = []
    for value, output in enumerate(outputs):
        rows.append(
            (
                bucket_counts(value, buckets),
                tuple(feature_value(feature, value) for feature in features),
                output,
            )
        )
    selected, trace = greedy_selectors(rows, features, len(outputs), max_selectors)
    if trace[-1][2] != len(outputs):
        raise RuntimeError("{0} bucket key is not exact with {1} selectors".format(case, max_selectors))
    mapping = build_mapping(outputs, buckets, features, selected)
    key_width = sum(bucket[2] for bucket in buckets) + len(selected)
    selector_names = [feature_name(features[index]) for index in selected]
    return table, buckets, selector_names, mapping, key_width


def write_pla(path, output_width, key_width, mapping, include_invalid_dc):
    total = 1 << key_width
    with path.open("w") as handle:
        handle.write(".i {0}\n".format(key_width))
        handle.write(".o {0}\n".format(output_width))
        handle.write(".type fd\n")
        for key in range(total):
            if key in mapping:
                bits = "".join(
                    "1" if (mapping[key] >> bit) & 1 else "0"
                    for bit in reversed(range(output_width))
                )
            elif include_invalid_dc:
                bits = "-" * output_width
            else:
                bits = "0" * output_width
            handle.write("{0:0{1}b} {2}\n".format(key, key_width, bits))
        handle.write(".e\n")


def run_abc(abc, pla, aig, log, flow, timeout):
    if flow == "espresso_strash_dc2":
        commands = "read_pla {pla}; espresso; strash; dc2; write_aiger {aig}; ps".format(
            pla=pla, aig=aig
        )
    elif flow == "espresso_collapse_fx_dc2":
        commands = "read_pla {pla}; espresso; collapse; fx; strash; dc2; write_aiger {aig}; ps".format(
            pla=pla, aig=aig
        )
    elif flow == "collapse_fx_dc2":
        commands = "read_pla {pla}; collapse; fx; strash; dc2; write_aiger {aig}; ps".format(
            pla=pla, aig=aig
        )
    elif flow == "espresso_bdd_sop_fx_dc2":
        commands = "read_pla {pla}; espresso; bdd; sop; fx; strash; dc2; write_aiger {aig}; ps".format(
            pla=pla, aig=aig
        )
    else:
        raise RuntimeError("unknown flow {0}".format(flow))
    result = subprocess.run(
        [str(abc), "-c", commands],
        stdout=subprocess.PIPE,
        stderr=subprocess.STDOUT,
        universal_newlines=True,
        timeout=timeout,
    )
    log.write_text(result.stdout)
    area, delay = parse_ps(result.stdout)
    return result.returncode, area, delay


def run_case(case, args):
    table, _buckets, selector_names, mapping, key_width = exact_bucket_mapping(
        case, args.benchmarks, args.max_selectors
    )
    case_dir = args.work_dir / case
    pla_dir = case_dir / "pla"
    aig_dir = case_dir / "aigs"
    log_dir = case_dir / "logs"
    pla_dir.mkdir(parents=True, exist_ok=True)
    aig_dir.mkdir(parents=True, exist_ok=True)
    log_dir.mkdir(parents=True, exist_ok=True)
    rows = []
    for dc_mode in ("invalid_dc", "invalid_zero"):
        include_invalid_dc = dc_mode == "invalid_dc"
        pla = pla_dir / "{0}_bucket_key_{1}.pla".format(case, dc_mode)
        write_pla(pla, table.output_width, key_width, mapping, include_invalid_dc)
        for flow in args.flows:
            variant = "{0}_{1}".format(dc_mode, flow)
            aig = aig_dir / "{0}_bucket_key_{1}.aig".format(case, variant)
            log = log_dir / "{0}_bucket_key_{1}.log".format(case, variant)
            try:
                code, area, delay = run_abc(args.abc, pla, aig, log, flow, args.timeout)
                status = "OK" if code == 0 and area is not None else "ABC_ERROR"
            except subprocess.TimeoutExpired:
                area = None
                delay = None
                status = "TIMEOUT"
                log.write_text("timeout\n")
            rows.append(
                {
                    "case": case,
                    "variant": variant,
                    "key_width": key_width,
                    "valid_keys": len(mapping),
                    "total_keys": 1 << key_width,
                    "abc_status": status,
                    "area": "" if area is None else area,
                    "delay": "" if delay is None else delay,
                    "adp": "" if area is None or delay is None else area * delay,
                    "pla_path": str(pla),
                    "aig_path": str(aig) if aig.exists() else "",
                    "log_path": str(log),
                    "notes": "key-to-output PLA only; selectors={0}".format(":".join(selector_names)),
                }
            )
            print(
                "{0} {1} status={2} area={3} delay={4}".format(
                    case, variant, status, area, delay
                ),
                flush=True,
            )
    return rows


def write_csv(path, rows):
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=FIELDS)
        writer.writeheader()
        writer.writerows(rows)


def write_empty_frontend_csvs(results_dir):
    fields = [
        "case",
        "candidate_id",
        "hypothesis",
        "variant",
        "verilog_path",
        "aig_path",
        "verified_truth",
        "equivalent",
        "area",
        "delay",
        "adp",
        "notes",
    ]
    for name in ("candidates.csv", "best.csv", "evaluate_check.csv"):
        with (results_dir / name).open("w", newline="") as handle:
            writer = csv.DictWriter(handle, fieldnames=fields)
            writer.writeheader()


def parse_args(argv=None):
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--cases", type=parse_cases, required=True)
    parser.add_argument("--benchmarks", type=Path, default=ROOT / "benchmarks")
    parser.add_argument("--abc", type=Path, default=ROOT / "student" / "abc")
    parser.add_argument("--work-dir", type=Path, required=True)
    parser.add_argument("--results-dir", type=Path, required=True)
    parser.add_argument("--max-selectors", type=int, default=8)
    parser.add_argument(
        "--flows",
        type=parse_cases,
        default=parse_cases("espresso_strash_dc2,espresso_bdd_sop_fx_dc2,espresso_collapse_fx_dc2,collapse_fx_dc2"),
    )
    parser.add_argument("--timeout", type=int, default=120)
    return parser.parse_args(argv)


def main(argv=None):
    args = parse_args(argv)
    rows = []
    for case in args.cases:
        rows.extend(run_case(case, args))
        write_csv(args.results_dir / "bucket_pla_abc_probe.csv", rows)
    write_csv(args.results_dir / "summary.csv", rows)
    write_empty_frontend_csvs(args.results_dir)
    print("rows={0} results={1}".format(len(rows), args.results_dir))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
