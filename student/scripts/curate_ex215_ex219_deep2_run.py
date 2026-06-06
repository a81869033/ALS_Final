#!/usr/bin/env python3
"""Curate active artifacts for the ex215-ex219 BF16 deep2 frontend run."""

import csv
import json
import shutil
from pathlib import Path


ROOT = Path(__file__).resolve().parents[2]
RUN_ID = "ex215_ex219_frontend_bf16_deep2_20260606_1726"
ARCHIVE = ROOT / "student" / "archive" / "cleanup_20260606" / (RUN_ID + "_low_value_intermediates")
RESULTS = ROOT / "student" / "runs" / "bf16" / RUN_ID / "results"


KEEP_VARIANTS = {
    "ex215": {
        "delta_pair_mode_hilo3_bits_9_bh1_fix2_caseattrs_fix12",
        "delta_pair_mode_hilo3_bits_9_cmp_fix12",
    },
    "ex216": {
        "aggr_semantic_positive_symmetry_fields_cube_bit14_boundary_caseattrs_fix13",
        "aggr_semantic_positive_symmetry_fields_cube_bit14_boundary_fix12",
        "aggr_semantic_positive_symmetry_fields_bits_14_cmp_fix5_manual_sign_non_nan_fix10_caseattrs_fix12",
    },
    "ex217": {
        "delta_pair_first_hilo3_bits_0_bh3_fix2_manual_sign_non_nan_caseattrs_fix15",
        "delta_pair_first_hilo3_bits_0_bh2_fix2_manual_sign_non_nan_fix12",
        "delta_pair_first_hilo3_mod3_bit0_fix12",
    },
    "ex218": {
        "legacy_value_case_bits_15_cmp_caseattrs_fix9",
        "legacy_value_case_manual_sign_casez_fix13",
        "legacy_value_case_bits_15_cmp_caseattrs_fix9_bits_13_bh1_fix15",
    },
    "ex219": {
        "delta_pair_first_hilo3_bits_6_cmp_caseattrs_fix9",
        "delta_pair_first_hilo3_mod3_bit6_fix12",
        "delta_pair_first_hilo3_bits_6_cmp_caseattrs_fix9_manual_sign_casez_fix13",
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
    for name in ("best.csv", "summary.csv", "evaluate_check.csv", "evaluate_official_best.csv"):
        path = RESULTS / name
        if path.exists():
            shutil.copy2(path, ARCHIVE / ("precuration_" + name))
    keep_rows = []
    archived_rows = []
    for row in rows:
        keep = row.get("equivalent") == "1" and row.get("variant") in KEEP_VARIANTS.get(row.get("case"), set())
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
    note = {
        "run_id": RUN_ID,
        "kept_rows": len(keep_rows),
        "archived_rows": len(archived_rows),
        "archive": str(ARCHIVE.relative_to(ROOT)),
        "policy": "Keep best plus one or two diagnostic verified seeds per case.",
        "keep_variants": {case: sorted(values) for case, values in KEEP_VARIANTS.items()},
    }
    (ARCHIVE / "CURATION.json").write_text(json.dumps(note, indent=2, sort_keys=True) + "\n")
    print(json.dumps(note, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
