#!/usr/bin/env python3
"""Curate active artifacts for the ex216/ex218/ex219 BF16 deep frontend run."""

import csv
import json
import shutil
from pathlib import Path


ROOT = Path(__file__).resolve().parents[2]
RUN_ID = "ex216_ex218_ex219_frontend_bf16_deep_20260606_1600"
ARCHIVE = ROOT / "student" / "archive" / "cleanup_20260606" / (RUN_ID + "_low_value_intermediates")
RESULTS = ROOT / "student" / "runs" / "bf16" / RUN_ID / "results"


KEEP_VARIANTS = {
    "ex216": {
        "aggr_semantic_positive_symmetry_fields_bits_14_cmp_fix5_manual_sign_non_nan_fix10",
        "aggr_semantic_positive_symmetry_fields_manual_sign_non_nan_fix7",
        "aggr_semantic_positive_symmetry_fields",
        "hand_cube_guard_lut",
    },
    "ex218": {
        "legacy_value_case_bits_15_cmp_caseattrs_fix9",
        "legacy_value_case_bits_15_cmp_fix5",
        "legacy_value_case_manual_sign_non_nan_fix7",
        "hand_recip_cube_guard_lut",
    },
    "ex219": {
        "delta_pair_first_hilo3_bits_6_cmp_caseattrs_fix9",
        "delta_pair_first_hilo3_bits_6_cmp_fix5",
        "delta_pair_first_hilo3_caseattrs_fix9",
        "hand_recip_cbrt_guard_lut_expcase",
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
        "policy": "Keep best plus a few semantically distinct verified seeds per case.",
        "keep_variants": {case: sorted(values) for case, values in KEEP_VARIANTS.items()},
    }
    (ARCHIVE / "CURATION.json").write_text(json.dumps(note, indent=2, sort_keys=True) + "\n")
    print(json.dumps(note, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
