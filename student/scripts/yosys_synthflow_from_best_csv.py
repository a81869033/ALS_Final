#!/usr/bin/env python3
"""Run limited Yosys synthflow variants for best Verilog rows in a CSV."""

import argparse
import csv
import json
import re
import subprocess
import sys
import time
from pathlib import Path


ROOT = Path(__file__).resolve().parents[2]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from student.backends.abc_flow import evaluate_aig
from student.frontends.yosys_synth import SynthError
from student.generators.fp16_semantic_search import (
    BEST_FIELDNAMES,
    RESULT_FIELDNAMES,
    add_reference_columns,
    load_reference,
    rel_path,
    write_csv,
    write_text,
)
from student.scripts.yosys_synthflow_variants import VARIANTS, synthesize_with_script


MODULE_RE = re.compile(r"\bmodule\s+([A-Za-z_][A-Za-z0-9_$]*)\b")


def verilog_module_name(path):
    text = path.read_text(errors="ignore")
    match = MODULE_RE.search(text)
    if not match:
        return None
    return match.group(1)


def load_seeds(path, cases, all_rows=False):
    wanted = set(cases)
    seeds = {}
    with Path(path).open(newline="") as handle:
        for row in csv.DictReader(handle):
            case = row.get("case", "")
            if case not in wanted:
                continue
            verilog = row.get("verilog_path", "")
            candidate_id = row.get("candidate_id", "")
            if not verilog or not candidate_id:
                continue
            verilog_path = ROOT / verilog
            seed = {
                "label": row.get("hypothesis/function_guess") or row.get("function_guess") or row.get("hypothesis") or case,
                "module": row.get("module") or verilog_module_name(verilog_path) or candidate_id,
                "variant": row.get("variant", "best"),
                "verilog": verilog_path,
            }
            if all_rows:
                seeds.setdefault(case, []).append(seed)
            else:
                seeds[case] = seed
    missing = sorted(wanted - set(seeds))
    if missing:
        raise RuntimeError("missing usable seeds for: {0}".format(",".join(missing)))
    if not all_rows:
        seeds = {case: [seed] for case, seed in seeds.items()}
    return seeds


def empty_row(case, candidate_id, seed, variant, verilog_path, aig_path):
    return {
        "case": case,
        "candidate_id": candidate_id,
        "hypothesis/function_guess": seed["label"],
        "variant": variant,
        "verilog_path": rel_path(verilog_path),
        "aig_path": rel_path(aig_path),
        "verified_truth": "1",
        "synthesized": "0",
        "equivalent": "0",
        "area": "",
        "delay": "",
        "adp": "",
        "reference_adp": "",
        "adp_ratio_to_reference": "",
        "within_1p5_reference": "",
        "beats_reference": "",
        "runtime_sec": "0.000",
        "items": "",
        "classification": "synthflow_exact",
        "notes": "",
    }


def run_case(args, refs, case, seed):
    rows = []
    truth_path = args.benchmarks / "{0}.truth".format(case)
    variants = VARIANTS
    if args.variant_names:
        variants = [item for item in variants if item[0] in args.variant_names]
    for variant, renderer, note in variants:
        candidate_id = "{0}_{1}_{2}".format(case, seed["variant"], variant)
        aig_path = args.work_dir / case / "aigs" / "{0}.aig".format(candidate_id)
        log_path = args.work_dir / case / "logs" / "{0}.yosys.log".format(candidate_id)
        row = empty_row(case, candidate_id, seed, variant, seed["verilog"], aig_path)
        row["items"] = note
        start = time.time()
        try:
            aig_path.parent.mkdir(parents=True, exist_ok=True)
            script = renderer(seed["verilog"], seed["module"], aig_path)
            synthesize_with_script(script, args.yosys, args.timeout, log_path)
            row["synthesized"] = "1"
            evaluated = evaluate_aig(
                case=case,
                candidate_id=candidate_id,
                parent_id=seed["variant"],
                source="yosys_synthflow",
                tool_chain="yosys_synthflow_{0}".format(variant),
                aig_path=aig_path,
                truth=truth_path,
                abc=args.abc,
                notes=note,
                timeout=args.timeout,
            )
            row["equivalent"] = "1" if evaluated.equivalent else "0"
            row["area"] = "" if evaluated.area is None else str(evaluated.area)
            row["delay"] = "" if evaluated.delay is None else str(evaluated.delay)
            row["adp"] = "" if evaluated.adp is None else str(evaluated.adp)
            row["notes"] = evaluated.notes
        except (RuntimeError, SynthError, OSError, subprocess.TimeoutExpired) as exc:
            row["notes"] = "{0}: {1}".format(type(exc).__name__, exc)[:1000]
        row["runtime_sec"] = "{0:.3f}".format(time.time() - start)
        add_reference_columns(row, refs)
        rows.append(row)
        print("{0} {1} eq={2} area={3} delay={4} adp={5}".format(case, variant, row["equivalent"], row["area"], row["delay"], row["adp"]))
        sys.stdout.flush()
    return rows


def best_rows(rows):
    best = []
    for case in sorted(set(row["case"] for row in rows)):
        valid = [row for row in rows if row["case"] == case and row["equivalent"] == "1" and row["adp"]]
        if valid:
            item = min(valid, key=lambda row: int(row["adp"]))
            best.append({name: item.get(name, "") for name in BEST_FIELDNAMES})
    return best


def parse_cases(text):
    return [item.strip() for item in text.split(",") if item.strip()]


def parse_args():
    parser = argparse.ArgumentParser(description="Try Yosys synthflow variants for best CSV seeds.")
    parser.add_argument("--seed-csv", type=Path, required=True)
    parser.add_argument("--cases", required=True)
    parser.add_argument("--work-dir", type=Path, required=True)
    parser.add_argument("--results", type=Path, required=True)
    parser.add_argument("--best-results", type=Path, required=True)
    parser.add_argument("--variants", default="")
    parser.add_argument("--all-rows", action="store_true", help="Run every matching row instead of one seed per case.")
    parser.add_argument("--benchmarks", type=Path, default=ROOT / "benchmarks")
    parser.add_argument("--reference", type=Path, default=ROOT / "reference_result.csv")
    parser.add_argument("--yosys", type=Path, default=ROOT / "student" / "tools" / "conda-env" / "bin" / "yosys")
    parser.add_argument("--abc", type=Path, default=ROOT / "student" / "abc")
    parser.add_argument("--timeout", type=int, default=900)
    return parser.parse_args()


def main():
    args = parse_args()
    cases = parse_cases(args.cases)
    args.variant_names = {item.strip() for item in args.variants.split(",") if item.strip()}
    refs = load_reference(args.reference)
    seeds = load_seeds(args.seed_csv, cases, all_rows=args.all_rows)
    rows = []
    for case in cases:
        for seed in seeds[case]:
            rows.extend(run_case(args, refs, case, seed))
    write_csv(args.results, RESULT_FIELDNAMES, rows)
    write_csv(args.best_results, BEST_FIELDNAMES, best_rows(rows))
    write_text(args.work_dir / "manifest.json", json.dumps(rows, indent=2) + "\n")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
