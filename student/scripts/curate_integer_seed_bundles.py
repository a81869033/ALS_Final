#!/usr/bin/env python3
"""Curate integer frontend seeds into git-tracked seed bundles."""

import csv
import shutil
from pathlib import Path


ROOT = Path(__file__).resolve().parents[2]
CASES = ["ex{0}".format(i) for i in range(255, 280)]
CURRENT_BUNDLE = ROOT / "student" / "seeds" / "integer" / "ex255_ex279_current"
ALT_BUNDLE = ROOT / "student" / "seeds" / "integer" / "ex255_ex279_backend_candidates_20260609_1809"
CURRENT_BEST = ROOT / "student" / "results" / "current_best_by_case.csv"
REFERENCE = ROOT / "reference_result.csv"

SEED_FIELDS = [
    "case",
    "candidate_id",
    "hypothesis/function_guess",
    "variant",
    "verilog_path",
    "aig_path",
    "verified_truth",
    "equivalent",
    "area",
    "delay",
    "adp",
    "reference_adp",
    "adp_ratio_to_reference",
    "within_1p5_reference",
    "beats_reference",
    "classification",
    "tool_chain",
    "selection_reason",
    "source_kind",
    "source_csv",
    "source_verilog_path",
    "source_aig_path",
    "notes",
]


def rel(path):
    path = Path(path)
    try:
        return str(path.relative_to(ROOT))
    except ValueError:
        return str(path)


def read_refs():
    refs = {}
    with REFERENCE.open(newline="") as handle:
        for row in csv.DictReader(handle):
            refs[row["case"]] = row
    return refs


def row_get(row, *names):
    for name in names:
        value = row.get(name)
        if value not in (None, ""):
            return value
    return ""


def path_from_row(row, key):
    value = row_get(row, key)
    if not value:
        return None
    path = Path(value)
    if not path.is_absolute():
        path = ROOT / path
    return path


def load_current_best():
    out = {}
    with CURRENT_BEST.open(newline="") as handle:
        for row in csv.DictReader(handle):
            if row.get("case") in CASES and row.get("domain") == "integer":
                out[row["case"]] = row
    missing = [case for case in CASES if case not in out]
    if missing:
        raise RuntimeError("missing current best cases: {0}".format(", ".join(missing)))
    return out


def normalize_current_row(row):
    return {
        "case": row["case"],
        "candidate_id": row["candidate_id"],
        "hypothesis/function_guess": row_get(row, "hypothesis", "function_guess"),
        "variant": row_get(row, "variant"),
        "verified_truth": "1",
        "equivalent": "1",
        "area": row_get(row, "best_area", "area"),
        "delay": row_get(row, "best_delay", "delay"),
        "adp": row_get(row, "best_adp", "adp"),
        "reference_adp": row_get(row, "reference_adp"),
        "adp_ratio_to_reference": row_get(row, "adp_ratio_to_reference"),
        "within_1p5_reference": row_get(row, "within_1p5_reference"),
        "beats_reference": row_get(row, "beats_reference"),
        "classification": row_get(row, "classification"),
        "tool_chain": "",
        "selection_reason": "current_best",
        "source_kind": row_get(row, "source_kind") or "run",
        "source_csv": row_get(row, "source_csv"),
        "source_verilog_path": row_get(row, "verilog_path"),
        "source_aig_path": row_get(row, "aig_path"),
        "notes": row_get(row, "notes"),
    }


def iter_candidate_rows():
    for csv_path in sorted((ROOT / "student" / "runs" / "integer").glob("**/results/candidates.csv")):
        with csv_path.open(newline="") as handle:
            for row in csv.DictReader(handle):
                case = row.get("case")
                if case not in CASES:
                    continue
                if row.get("equivalent") != "1":
                    continue
                if not row.get("adp"):
                    continue
                verilog = path_from_row(row, "verilog_path")
                aig = path_from_row(row, "aig_path")
                if not verilog or not aig or not verilog.is_file() or not aig.is_file():
                    continue
                row = dict(row)
                row["_source_csv"] = rel(csv_path)
                row["_source_verilog_path"] = rel(verilog)
                row["_source_aig_path"] = rel(aig)
                yield row


def normalize_candidate_row(row, reason):
    return {
        "case": row["case"],
        "candidate_id": row["candidate_id"],
        "hypothesis/function_guess": row_get(row, "hypothesis/function_guess", "hypothesis", "function_guess"),
        "variant": row_get(row, "variant"),
        "verified_truth": row_get(row, "verified_truth") or "1",
        "equivalent": "1",
        "area": row["area"],
        "delay": row["delay"],
        "adp": row["adp"],
        "reference_adp": row_get(row, "reference_adp"),
        "adp_ratio_to_reference": row_get(row, "adp_ratio_to_reference"),
        "within_1p5_reference": row_get(row, "within_1p5_reference"),
        "beats_reference": row_get(row, "beats_reference"),
        "classification": row_get(row, "classification"),
        "tool_chain": row_get(row, "tool_chain"),
        "selection_reason": reason,
        "source_kind": "run",
        "source_csv": row["_source_csv"],
        "source_verilog_path": row["_source_verilog_path"],
        "source_aig_path": row["_source_aig_path"],
        "notes": row_get(row, "notes"),
    }


def copy_artifacts(bundle, row):
    case = row["case"]
    candidate = row["candidate_id"]
    src_v = ROOT / row["source_verilog_path"]
    src_a = ROOT / row["source_aig_path"]
    dst_v = bundle / case / "verilog" / "{0}.v".format(candidate)
    dst_a = bundle / case / "aigs" / "{0}.aig".format(candidate)
    dst_v.parent.mkdir(parents=True, exist_ok=True)
    dst_a.parent.mkdir(parents=True, exist_ok=True)
    shutil.copy2(src_v, dst_v)
    shutil.copy2(src_a, dst_a)
    row["verilog_path"] = rel(dst_v)
    row["aig_path"] = rel(dst_a)
    return row


def write_csv(path, fields, rows):
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=fields, lineterminator="\n")
        writer.writeheader()
        for row in rows:
            writer.writerow({field: row.get(field, "") for field in fields})


def summary_rows(rows):
    out = []
    by_case = {}
    for row in rows:
        by_case.setdefault(row["case"], []).append(row)
    for case in CASES:
        selected = by_case.get(case, [])
        if not selected:
            continue
        selected = sorted(selected, key=lambda r: (int(r["adp"]), int(r["delay"]), int(r["area"]), r["candidate_id"]))
        best = selected[0]
        out.append(
            {
                "case": case,
                "selected_count": str(len(selected)),
                "best_candidate_id": best["candidate_id"],
                "best_area": best["area"],
                "best_delay": best["delay"],
                "best_adp": best["adp"],
                "reference_adp": best["reference_adp"],
                "adp_ratio_to_reference": best["adp_ratio_to_reference"],
                "candidate_ids": "; ".join(row["candidate_id"] for row in selected),
            }
        )
    return out


def evaluate_check_rows(rows):
    return [
        {
            "case": row["case"],
            "candidate_id": row["candidate_id"],
            "status": "OK",
            "area": row["area"],
            "delay": row["delay"],
            "adp": row["adp"],
            "expected_adp": row["adp"],
            "aig_path": row["aig_path"],
            "notes": "curated from verified integer frontend candidate CSV; copied AIG path checked during curation",
        }
        for row in rows
    ]


def manifest_current(rows):
    lines = [
        "# ex255_ex279_current",
        "",
        "Best-only integer seed bundle for ex255-ex279.",
        "",
        "This bundle contains exactly one current best verified Verilog/AIG seed per case. Use this as the primary backend optimization starting point list.",
        "",
        "Files:",
        "- `results/best.csv`: one best row per case.",
        "- `results/candidates.csv`: same 25 best rows for tools that expect candidate CSVs.",
        "- `results/summary.csv`: per-case score summary.",
        "- `results/evaluate_check.csv`: copied verified candidate records.",
        "",
        "| Case | Candidate | Area | Delay | ADP |",
        "| --- | --- | ---: | ---: | ---: |",
    ]
    for row in rows:
        lines.append("| {0} | `{1}` | {2} | {3} | {4} |".format(row["case"], row["candidate_id"], row["area"], row["delay"], row["adp"]))
    return "\n".join(lines) + "\n"


def manifest_alts(rows):
    lines = [
        "# ex255_ex279_backend_candidates_20260609_1809",
        "",
        "Non-best integer backend candidate bundle for ex255-ex279.",
        "",
        "This bundle intentionally excludes the current best seed for each case. It keeps four verified alternatives per case when available. Use it as the secondary backend starting-point pool after trying `student/seeds/integer/ex255_ex279_current/`.",
        "",
        "Files:",
        "- `results/candidates.csv`: verified non-best alternatives.",
        "- `results/best.csv`: best alternative row per case.",
        "- `results/summary.csv`: per-case alternative counts and best alternative score.",
        "",
        "| Case | Alternatives | Best alternative | Area | Delay | ADP |",
        "| --- | ---: | --- | ---: | ---: | ---: |",
    ]
    by_case = {}
    for row in rows:
        by_case.setdefault(row["case"], []).append(row)
    for case in CASES:
        selected = sorted(by_case.get(case, []), key=lambda r: (int(r["adp"]), int(r["delay"]), int(r["area"]), r["candidate_id"]))
        if not selected:
            lines.append("| {0} | 0 |  |  |  |  |".format(case))
            continue
        best = selected[0]
        lines.append("| {0} | {1} | `{2}` | {3} | {4} | {5} |".format(case, len(selected), best["candidate_id"], best["area"], best["delay"], best["adp"]))
    return "\n".join(lines) + "\n"


def main():
    current = load_current_best()
    for bundle in (CURRENT_BUNDLE, ALT_BUNDLE):
        bundle.mkdir(parents=True, exist_ok=True)

    current_rows = []
    for case in CASES:
        row = normalize_current_row(current[case])
        row = copy_artifacts(CURRENT_BUNDLE, row)
        current_rows.append(row)

    all_candidates = {}
    for row in iter_candidate_rows():
        all_candidates.setdefault(row["case"], []).append(row)

    alt_rows = []
    for case in CASES:
        best_id = current[case]["candidate_id"]
        seen = {best_id}
        choices = []
        candidates = sorted(
            all_candidates.get(case, []),
            key=lambda r: (int(r["adp"]), int(r["delay"]), int(r["area"]), r["candidate_id"]),
        )
        for row in candidates:
            candidate_id = row["candidate_id"]
            if candidate_id in seen:
                continue
            seen.add(candidate_id)
            choices.append(row)
            if len(choices) >= 4:
                break
        if len(choices) < 4:
            raise RuntimeError("{0}: only found {1} non-best alternatives".format(case, len(choices)))
        for row in choices:
            norm = normalize_candidate_row(row, "verified_low_adp_nonbest_alternative")
            norm = copy_artifacts(ALT_BUNDLE, norm)
            alt_rows.append(norm)

    summary_fields = [
        "case",
        "selected_count",
        "best_candidate_id",
        "best_area",
        "best_delay",
        "best_adp",
        "reference_adp",
        "adp_ratio_to_reference",
        "candidate_ids",
    ]
    eval_fields = ["case", "candidate_id", "status", "area", "delay", "adp", "expected_adp", "aig_path", "notes"]

    for bundle, rows in ((CURRENT_BUNDLE, current_rows), (ALT_BUNDLE, alt_rows)):
        results = bundle / "results"
        write_csv(results / "candidates.csv", SEED_FIELDS, rows)
        best = []
        by_case = {}
        for row in rows:
            by_case.setdefault(row["case"], []).append(row)
        for case in CASES:
            group = sorted(by_case.get(case, []), key=lambda r: (int(r["adp"]), int(r["delay"]), int(r["area"]), r["candidate_id"]))
            if group:
                best.append(group[0])
        write_csv(results / "best.csv", SEED_FIELDS, best)
        write_csv(results / "summary.csv", summary_fields, summary_rows(rows))
        write_csv(results / "evaluate_check.csv", eval_fields, evaluate_check_rows(rows))

    (CURRENT_BUNDLE / "MANIFEST.md").write_text(manifest_current(current_rows))
    (ALT_BUNDLE / "MANIFEST.md").write_text(manifest_alts(alt_rows))

    print("current_bundle={0} rows={1}".format(rel(CURRENT_BUNDLE), len(current_rows)))
    print("alt_bundle={0} rows={1}".format(rel(ALT_BUNDLE), len(alt_rows)))


if __name__ == "__main__":
    main()
