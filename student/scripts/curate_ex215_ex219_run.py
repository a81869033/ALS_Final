#!/usr/bin/env python3
"""Curate active artifacts for the ex215-ex219 BF16 frontend run."""

import csv
import json
import shutil
from pathlib import Path


ROOT = Path(__file__).resolve().parents[2]
RUN_ID = "ex215_ex219_frontend_bf16_semantic_20260606_1447"
SMOKE_RUN_ID = "ex215_ex219_frontend_bf16_semantic_smoke_20260606_1447"
ARCHIVE = ROOT / "student" / "archive" / "cleanup_20260606" / (
    RUN_ID + "_low_value_intermediates"
)
RESULTS = ROOT / "student" / "runs" / "bf16" / RUN_ID / "results"
WORK = ROOT / "student" / "work" / RUN_ID


KEEP_VARIANTS = {
    "ex215": {
        "delta_pair_mode_hilo3_bits_9_bh1_fix2",
        "delta_pair_mode_hilo3",
        "aggr_semantic_exp_delta_fields",
        "legacy_sign_pair_case",
    },
    "ex216": {
        "aggr_semantic_positive_symmetry_fields",
        "arith_semantic_fields",
        "aggr_semantic_exp_delta_fields",
        "delta_pair_mode_hilo3",
    },
    "ex217": {
        "delta_pair_first_hilo3_bits_0_bh2_fix2",
        "delta_pair_first_hilo3",
        "legacy_positive_default_exp_mant_delta",
        "arith_semantic_fields",
    },
    "ex218": {
        "legacy_value_case_bits_4_bh1_fix3",
        "legacy_value_case",
        "delta_pair_first_hilo4",
        "aggr_semantic_positive_symmetry_fields",
    },
    "ex219": {
        "delta_pair_first_hilo3_bits_6_bh3_fix2",
        "delta_pair_first_hilo3",
        "legacy_exp_mant_delta_pair",
        "arith_semantic_fields",
    },
}


def move_if_exists(path):
    source = ROOT / path
    if not source.exists():
        return None
    destination = ARCHIVE / "work" / path
    destination.parent.mkdir(parents=True, exist_ok=True)
    if destination.exists():
        return destination
    shutil.move(str(source), str(destination))
    return destination


def move_log_siblings(row):
    verilog = Path(row["verilog_path"])
    stem = verilog.stem
    case = row["case"]
    log_dir = Path("student") / "work" / RUN_ID / case / "logs"
    for suffix in (".yosys.log", ".ys"):
        move_if_exists(log_dir / (stem + suffix))


def main():
    ARCHIVE.mkdir(parents=True, exist_ok=True)
    source_csv = RESULTS / "candidates.csv"
    rows = list(csv.DictReader(source_csv.open()))
    fields = rows[0].keys()
    shutil.copy2(source_csv, ARCHIVE / "candidates_full_precuration.csv")
    for name in ("best.csv", "summary.csv", "evaluate_check.csv"):
        path = RESULTS / name
        if path.exists():
            shutil.copy2(path, ARCHIVE / ("precuration_" + name))
    keep_rows = []
    archived_rows = []
    for row in rows:
        keep = (
            row.get("equivalent") == "1"
            and row.get("variant") in KEEP_VARIANTS.get(row.get("case"), set())
        )
        if keep:
            keep_rows.append(row)
            continue
        archived_rows.append(row)
        if row.get("verilog_path"):
            move_if_exists(Path(row["verilog_path"]))
        if row.get("aig_path"):
            move_if_exists(Path(row["aig_path"]))
        if row.get("verilog_path"):
            move_log_siblings(row)
    with source_csv.open("w", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=fields)
        writer.writeheader()
        writer.writerows(keep_rows)
    with (ARCHIVE / "archived_rows.csv").open("w", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=fields)
        writer.writeheader()
        writer.writerows(archived_rows)
    smoke_run = ROOT / "student" / "runs" / "bf16" / SMOKE_RUN_ID
    smoke_work = ROOT / "student" / "work" / SMOKE_RUN_ID
    if smoke_run.exists():
        shutil.move(str(smoke_run), str(ARCHIVE / "smoke_run_registry"))
    if smoke_work.exists():
        shutil.move(str(smoke_work), str(ARCHIVE / "smoke_run_work"))
    note = {
        "run_id": RUN_ID,
        "kept_rows": len(keep_rows),
        "archived_rows": len(archived_rows),
        "archive": str(ARCHIVE.relative_to(ROOT)),
        "policy": "Keep best plus a few semantically distinct verified seeds per case.",
        "keep_variants": {case: sorted(values) for case, values in KEEP_VARIANTS.items()},
    }
    (ARCHIVE / "CURATION.json").write_text(json.dumps(note, indent=2, sort_keys=True) + "\n")
    print(json.dumps(note, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
