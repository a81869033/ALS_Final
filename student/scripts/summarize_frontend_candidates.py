#!/usr/bin/env python3
"""Normalize frontend candidate CSVs and add reference ADP comparisons."""

import argparse
import csv
from pathlib import Path


ROOT = Path(__file__).resolve().parents[2]

RESULT_FIELDNAMES = [
    "case",
    "candidate_id",
    "hypothesis/function_guess",
    "variant",
    "verilog_path",
    "aig_path",
    "verified_truth",
    "synthesized",
    "equivalent",
    "area",
    "delay",
    "adp",
    "reference_adp",
    "adp_ratio_to_reference",
    "within_1p5_reference",
    "beats_reference",
    "classification",
    "items",
    "runtime_sec",
    "notes",
]

BEST_FIELDNAMES = [
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
    "notes",
]

SUMMARY_FIELDNAMES = [
    "case",
    "hypothesis/function_guess",
    "candidate_count",
    "verified_truth_count",
    "synthesized_count",
    "equivalent_count",
    "semantic_exact_count",
    "semantic_hybrid_count",
    "structural_exact_count",
    "best_candidate_id",
    "best_variant",
    "best_classification",
    "best_area",
    "best_delay",
    "best_adp",
    "reference_adp",
    "adp_ratio_to_reference",
    "within_1p5_reference",
    "beats_reference",
    "top5",
    "notes",
]


def read_rows(path):
    with Path(path).open() as handle:
        return list(csv.DictReader(handle))


def write_csv(path, fieldnames, rows):
    path = Path(path)
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=fieldnames)
        writer.writeheader()
        writer.writerows(rows)


def load_reference(path):
    refs = {}
    with Path(path).open() as handle:
        for row in csv.DictReader(handle):
            if row.get("case") and row.get("adp"):
                refs[row["case"]] = int(row["adp"])
    return refs


def classify(row):
    current = row.get("classification", "")
    if current:
        return current
    variant = row.get("variant", "")
    if variant == "semantic_arith_fields":
        return "semantic_exact"
    if variant.startswith("semantic_") or "default_expr" in variant:
        return "semantic_hybrid"
    return "structural_exact"


def reference_columns(case, adp_text, refs):
    ref = refs.get(case)
    out = {
        "reference_adp": "" if ref is None else str(ref),
        "adp_ratio_to_reference": "",
        "within_1p5_reference": "",
        "beats_reference": "",
    }
    if ref is None or not adp_text:
        return out
    adp = int(adp_text)
    out["adp_ratio_to_reference"] = "{0:.6f}".format(float(adp) / float(ref))
    out["within_1p5_reference"] = "1" if adp <= int(ref * 1.5) else "0"
    out["beats_reference"] = "1" if adp < ref else "0"
    return out


def normalize(row, refs):
    case = row.get("case", "")
    adp = row.get("adp", "")
    out = {
        "case": case,
        "candidate_id": row.get("candidate_id", ""),
        "hypothesis/function_guess": row.get("hypothesis/function_guess", row.get("hypothesis", "")),
        "variant": row.get("variant", ""),
        "verilog_path": row.get("verilog_path", ""),
        "aig_path": row.get("aig_path", ""),
        "verified_truth": row.get("verified_truth", ""),
        "synthesized": row.get("synthesized", ""),
        "equivalent": row.get("equivalent", ""),
        "area": row.get("area", ""),
        "delay": row.get("delay", ""),
        "adp": adp,
        "classification": classify(row),
        "items": row.get("items", ""),
        "runtime_sec": row.get("runtime_sec", ""),
        "notes": row.get("notes", ""),
    }
    out.update(reference_columns(case, adp, refs))
    return out


def best_for_case(rows):
    valid = [row for row in rows if row.get("equivalent") == "1" and row.get("adp")]
    if not valid:
        return None
    return min(valid, key=lambda row: int(row["adp"]))


def row_rank(row):
    if row.get("equivalent") == "1" and row.get("adp"):
        return (0, int(row["adp"]))
    if row.get("verified_truth") == "1":
        return (1, 0)
    return (2, 0)


def dedupe_rows(rows):
    best = {}
    order = []
    for row in rows:
        key = row.get("candidate_id") or "{0}:{1}:{2}".format(
            row.get("case", ""),
            row.get("variant", ""),
            row.get("verilog_path", ""),
        )
        if key not in best:
            best[key] = row
            order.append(key)
            continue
        if row_rank(row) < row_rank(best[key]):
            best[key] = row
    return [best[key] for key in order]


def summarize(rows, refs):
    grouped = {}
    for row in rows:
        grouped.setdefault(row["case"], []).append(row)

    best_rows = []
    summary_rows = []
    for case in sorted(grouped):
        case_rows = grouped[case]
        best = best_for_case(case_rows)
        if best is not None:
            best_rows.append({name: best.get(name, "") for name in BEST_FIELDNAMES})
        equiv = [row for row in case_rows if row.get("equivalent") == "1" and row.get("adp")]
        top = sorted(equiv, key=lambda row: int(row["adp"]))[:5]
        top5 = "; ".join("{0}:{1}".format(row.get("variant", ""), row.get("adp", "")) for row in top)
        classes = {"semantic_exact": 0, "semantic_hybrid": 0, "structural_exact": 0}
        for row in case_rows:
            classes[row.get("classification", "structural_exact")] = classes.get(row.get("classification", "structural_exact"), 0) + 1
        ref_cols = reference_columns(case, "" if best is None else best.get("adp", ""), refs)
        summary_rows.append(
            {
                "case": case,
                "hypothesis/function_guess": case_rows[0].get("hypothesis/function_guess", ""),
                "candidate_count": str(len(case_rows)),
                "verified_truth_count": str(sum(row.get("verified_truth") == "1" for row in case_rows)),
                "synthesized_count": str(sum(row.get("synthesized") == "1" for row in case_rows)),
                "equivalent_count": str(sum(row.get("equivalent") == "1" for row in case_rows)),
                "semantic_exact_count": str(classes.get("semantic_exact", 0)),
                "semantic_hybrid_count": str(classes.get("semantic_hybrid", 0)),
                "structural_exact_count": str(classes.get("structural_exact", 0)),
                "best_candidate_id": "" if best is None else best.get("candidate_id", ""),
                "best_variant": "" if best is None else best.get("variant", ""),
                "best_classification": "" if best is None else best.get("classification", ""),
                "best_area": "" if best is None else best.get("area", ""),
                "best_delay": "" if best is None else best.get("delay", ""),
                "best_adp": "" if best is None else best.get("adp", ""),
                "reference_adp": ref_cols["reference_adp"],
                "adp_ratio_to_reference": ref_cols["adp_ratio_to_reference"],
                "within_1p5_reference": ref_cols["within_1p5_reference"],
                "beats_reference": ref_cols["beats_reference"],
                "top5": top5,
                "notes": "no equivalent frontend candidate" if best is None else "",
            }
        )
    return best_rows, summary_rows


def parse_args(argv=None):
    parser = argparse.ArgumentParser(description="Summarize frontend candidate results.")
    parser.add_argument("--input", type=Path, action="append", required=True)
    parser.add_argument("--results", type=Path, required=True)
    parser.add_argument("--best-results", type=Path, required=True)
    parser.add_argument("--summary", type=Path, required=True)
    parser.add_argument("--reference", type=Path, default=ROOT / "reference_result.csv")
    return parser.parse_args(argv)


def main(argv=None):
    args = parse_args(argv)
    refs = load_reference(args.reference)
    rows = []
    for input_path in args.input:
        rows.extend(normalize(row, refs) for row in read_rows(input_path))
    rows = dedupe_rows(rows)
    rows.sort(key=lambda row: (row["case"], row["candidate_id"], row["variant"]))
    best_rows, summary_rows = summarize(rows, refs)
    write_csv(args.results, RESULT_FIELDNAMES, rows)
    write_csv(args.best_results, BEST_FIELDNAMES, best_rows)
    write_csv(args.summary, SUMMARY_FIELDNAMES, summary_rows)
    print("rows={0}".format(len(rows)))
    print("best_cases={0}/{1}".format(len(best_rows), len(summary_rows)))
    print("results={0}".format(args.results))
    print("best={0}".format(args.best_results))
    print("summary={0}".format(args.summary))
    return 0 if len(best_rows) == len(summary_rows) else 1


if __name__ == "__main__":
    raise SystemExit(main())
