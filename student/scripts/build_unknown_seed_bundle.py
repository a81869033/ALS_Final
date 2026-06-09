#!/usr/bin/env python3
"""Build curated seed bundles for ex280-ex299 unknown cases."""

import argparse
import csv
import os
import shutil
from collections import defaultdict
from pathlib import Path


CASES = [f"ex{i}" for i in range(280, 300)]
RESULT_FIELDS = [
    "case",
    "candidate_id",
    "hypothesis",
    "function_guess",
    "variant",
    "classification",
    "area",
    "delay",
    "adp",
    "reference_adp",
    "adp_ratio_to_reference",
    "within_1p5_reference",
    "beats_reference",
    "verilog_path",
    "aig_path",
    "source_csv",
    "notes",
]
SUMMARY_FIELDS = [
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


def truthy(value):
    if value is None:
        return False
    return value.strip().lower() in {"1", "true", "yes", "ok"}


def text(row, *keys):
    for key in keys:
        value = row.get(key, "")
        if value != "":
            return value
    return ""


def int_text(value):
    return int(float(value)) if value else 0


def float_text(value):
    return float(value) if value else 0.0


def resolve_path(repo, value):
    path = Path(value)
    if not path.is_absolute():
        path = repo / path
    return path


def normalize_row(repo, row, source_csv):
    case = row.get("case", "")
    if case not in CASES:
        return None

    verilog_path = text(row, "verilog_path")
    aig_path = text(row, "aig_path")
    if not verilog_path or not aig_path:
        return None
    if not resolve_path(repo, verilog_path).is_file() or not resolve_path(repo, aig_path).is_file():
        return None

    verified = truthy(row.get("verified_truth")) or row.get("verified_truth", "") == ""
    equivalent = truthy(row.get("equivalent")) or row.get("equivalent", "") == ""
    synthesized = truthy(row.get("synthesized")) or row.get("synthesized", "") == ""
    if not (verified and equivalent and synthesized):
        return None

    area = text(row, "area", "best_area")
    delay = text(row, "delay", "best_delay")
    adp = text(row, "adp", "best_adp")
    if not (area and delay and adp):
        return None

    return {
        "case": case,
        "candidate_id": text(row, "candidate_id"),
        "hypothesis": text(row, "hypothesis", "hypothesis/function_guess"),
        "function_guess": text(row, "function_guess", "hypothesis/function_guess"),
        "variant": text(row, "variant"),
        "classification": text(row, "classification"),
        "area": str(int_text(area)),
        "delay": str(int_text(delay)),
        "adp": str(int_text(adp)),
        "reference_adp": text(row, "reference_adp"),
        "adp_ratio_to_reference": text(row, "adp_ratio_to_reference"),
        "within_1p5_reference": text(row, "within_1p5_reference"),
        "beats_reference": text(row, "beats_reference"),
        "verilog_path": verilog_path,
        "aig_path": aig_path,
        "source_csv": str(source_csv.relative_to(repo)),
        "notes": text(row, "notes"),
    }


def read_rows(repo, csv_path):
    if not csv_path.is_file():
        return []
    rows = []
    with csv_path.open(newline="") as handle:
        for row in csv.DictReader(handle):
            norm = normalize_row(repo, row, csv_path)
            if norm is not None:
                rows.append(norm)
    return rows


def write_csv(path, rows):
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=RESULT_FIELDS)
        writer.writeheader()
        for row in rows:
            writer.writerow({field: row.get(field, "") for field in RESULT_FIELDS})


def write_summary_csv(path, by_case):
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=SUMMARY_FIELDS)
        writer.writeheader()
        for case in CASES:
            rows = sorted(by_case[case], key=row_key)
            best = rows[0]
            writer.writerow(
                {
                    "case": case,
                    "selected_count": len(rows),
                    "best_candidate_id": best["candidate_id"],
                    "best_area": best["area"],
                    "best_delay": best["delay"],
                    "best_adp": best["adp"],
                    "reference_adp": best.get("reference_adp", ""),
                    "adp_ratio_to_reference": best.get("adp_ratio_to_reference", ""),
                    "candidate_ids": "; ".join(row["candidate_id"] for row in rows),
                }
            )


def copy_seed_files(repo, bundle, rows):
    for row in rows:
        case_dir = bundle / row["case"]
        verilog_dir = case_dir / "verilog"
        aig_dir = case_dir / "aigs"
        verilog_dir.mkdir(parents=True, exist_ok=True)
        aig_dir.mkdir(parents=True, exist_ok=True)

        src_v = resolve_path(repo, row["verilog_path"])
        src_aig = resolve_path(repo, row["aig_path"])
        dst_v = verilog_dir / src_v.name
        dst_aig = aig_dir / src_aig.name
        shutil.copy2(src_v, dst_v)
        shutil.copy2(src_aig, dst_aig)
        row["verilog_path"] = str(dst_v.relative_to(repo))
        row["aig_path"] = str(dst_aig.relative_to(repo))


def row_key(row):
    return (
        int_text(row["adp"]),
        int_text(row["area"]),
        int_text(row["delay"]),
        row["candidate_id"],
    )


def strip_flow_suffix(stem):
    suffixes = [
        "_abc_g_aig",
        "_synth_preset",
        "_abc_fast",
        "_abc_d",
        "_synth_noabc",
        "_aigmap",
    ]
    out = stem
    changed = True
    while changed:
        changed = False
        for suffix in suffixes:
            idx = out.find(suffix)
            if idx > 0:
                out = out[:idx]
                changed = True
        if out.endswith("_d18") or out.endswith("_d19") or out.endswith("_d20") or out.endswith("_d21"):
            out = out[:-4]
            changed = True
    return out


def structure_signature(row):
    source_stem = Path(row["verilog_path"]).stem
    return (
        row.get("hypothesis", ""),
        row.get("function_guess", ""),
        strip_flow_suffix(source_stem),
    )


def family_signature(row):
    return (
        row.get("hypothesis", "") or row.get("function_guess", "") or strip_flow_suffix(Path(row["verilog_path"]).stem),
        row.get("classification", ""),
    )


def select_diverse_alternatives(case_rows, best, count=4):
    """Pick low-ADP alternatives while avoiding duplicate source structures."""
    sorted_rows = [
        row
        for row in sorted(case_rows, key=row_key)
        if Path(row["verilog_path"]).as_posix() != Path(best["verilog_path"]).as_posix()
        and Path(row["verilog_path"]).name != Path(best["verilog_path"]).name
    ]
    selected = []
    used_sources = {Path(best["verilog_path"]).as_posix()}
    used_source_names = {Path(best["verilog_path"]).name}
    used_structures = {structure_signature(best)}
    used_families = {family_signature(best)}

    if sorted_rows:
        first = sorted_rows[0]
        selected.append(first)
        used_sources.add(Path(first["verilog_path"]).as_posix())
        used_source_names.add(Path(first["verilog_path"]).name)
        used_structures.add(structure_signature(first))
        used_families.add(family_signature(first))

    for row in sorted_rows:
        if row in selected:
            continue
        source = Path(row["verilog_path"]).as_posix()
        source_name = Path(row["verilog_path"]).name
        signature = structure_signature(row)
        family = family_signature(row)
        if source in used_sources or source_name in used_source_names or signature in used_structures or family in used_families:
            continue
        selected.append(row)
        used_sources.add(source)
        used_source_names.add(source_name)
        used_structures.add(signature)
        used_families.add(family)
        if len(selected) == count:
            return selected

    for row in sorted_rows:
        if row in selected:
            continue
        source = Path(row["verilog_path"]).as_posix()
        source_name = Path(row["verilog_path"]).name
        if source in used_sources or source_name in used_source_names:
            continue
        selected.append(row)
        used_sources.add(source)
        used_source_names.add(source_name)
        if len(selected) == count:
            return selected

    for row in sorted_rows:
        if row in selected:
            continue
        selected.append(row)
        if len(selected) == count:
            return selected

    return selected


def unique_rows(rows):
    seen = set()
    out = []
    for row in rows:
        key = (row["case"], row["candidate_id"], row["verilog_path"])
        if key in seen:
            continue
        seen.add(key)
        out.append(row)
    return out


def render_manifest(title, description, rows, candidate_mode):
    lines = [
        f"# {title}",
        "",
        description,
        "",
        "Files:",
        "- `results/candidates.csv`: curated verified seed rows.",
        "- `results/best.csv`: best row per case inside this bundle.",
        "- `results/summary.csv`: per-case counts and best score.",
        "- `results/evaluate_check.csv`: copied verified seed records.",
        "",
    ]
    if candidate_mode:
        lines.extend(
            [
                "| Case | Alternatives | Best alternative | Area | Delay | ADP |",
                "| --- | ---: | --- | ---: | ---: | ---: |",
            ]
        )
        by_case = defaultdict(list)
        for row in rows:
            by_case[row["case"]].append(row)
        for case in CASES:
            case_rows = sorted(by_case[case], key=row_key)
            best = case_rows[0]
            lines.append(
                f"| {case} | {len(case_rows)} | `{best['candidate_id']}` | "
                f"{best['area']} | {best['delay']} | {best['adp']} |"
            )
    else:
        lines.extend(
            [
                "| Case | Candidate | Area | Delay | ADP |",
                "| --- | --- | ---: | ---: | ---: |",
            ]
        )
        for row in sorted(rows, key=lambda item: item["case"]):
            lines.append(
                f"| {row['case']} | `{row['candidate_id']}` | "
                f"{row['area']} | {row['delay']} | {row['adp']} |"
            )
    lines.append("")
    return "\n".join(lines)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--repo", default=".")
    parser.add_argument("--run-id", required=True)
    args = parser.parse_args()

    repo = Path(args.repo).resolve()
    seeds_root = repo / "student" / "seeds" / "unknown"
    current_bundle = seeds_root / "ex280_ex299_current"
    candidates_bundle = seeds_root / f"ex280_ex299_backend_candidates_{args.run_id}"

    current_best_rows = read_rows(repo, repo / "student" / "results" / "current_best_by_case.csv")
    best_by_case = {row["case"]: row for row in current_best_rows if row["case"] in CASES}
    missing_best = [case for case in CASES if case not in best_by_case]
    if missing_best:
        raise SystemExit(f"missing current best rows: {','.join(missing_best)}")

    source_csvs = [
        repo / "student" / "results" / "unknown_candidates_current.csv",
        repo / "student" / "results" / "unknown_candidates_current_best.csv",
    ]
    source_csvs.extend((repo / "student" / "runs" / "unknown").glob("*/results/candidates.csv"))
    source_csvs.extend((repo / "student" / "runs" / "unknown").glob("*/results/best.csv"))

    pool = []
    for csv_path in source_csvs:
        pool.extend(read_rows(repo, csv_path))
    pool = unique_rows(pool)

    alternatives = []
    for case in CASES:
        best = best_by_case[case]
        case_rows = [
            row
            for row in pool
            if row["case"] == case
            and row["candidate_id"] != best["candidate_id"]
            and row["verilog_path"] != best["verilog_path"]
        ]
        selected = select_diverse_alternatives(unique_rows(case_rows), best, count=4)
        if len(selected) < 4:
            raise SystemExit(f"case {case} has only {len(selected)} alternatives")
        for row in selected:
            if not row.get("reference_adp"):
                row["reference_adp"] = best.get("reference_adp", "")
            if not row.get("adp_ratio_to_reference") and row.get("reference_adp"):
                row["adp_ratio_to_reference"] = "{:.6f}".format(
                    float_text(row["adp"]) / float_text(row["reference_adp"])
                )
            if not row.get("within_1p5_reference") and row.get("reference_adp"):
                row["within_1p5_reference"] = "1" if float_text(row["adp"]) <= 1.5 * float_text(row["reference_adp"]) else "0"
            if not row.get("beats_reference") and row.get("reference_adp"):
                row["beats_reference"] = "1" if float_text(row["adp"]) < float_text(row["reference_adp"]) else "0"
        alternatives.extend(selected)

    if current_bundle.exists():
        shutil.rmtree(current_bundle)
    if candidates_bundle.exists():
        shutil.rmtree(candidates_bundle)
    current_bundle.mkdir(parents=True)
    candidates_bundle.mkdir(parents=True)

    best_rows = [best_by_case[case].copy() for case in CASES]
    alt_rows = [row.copy() for row in alternatives]
    copy_seed_files(repo, current_bundle, best_rows)
    copy_seed_files(repo, candidates_bundle, alt_rows)

    current_results = current_bundle / "results"
    candidate_results = candidates_bundle / "results"
    write_csv(current_results / "candidates.csv", best_rows)
    write_csv(current_results / "best.csv", best_rows)
    write_csv(current_results / "evaluate_check.csv", best_rows)
    current_by_case = defaultdict(list)
    for row in best_rows:
        current_by_case[row["case"]].append(row)
    write_summary_csv(current_results / "summary.csv", current_by_case)

    write_csv(candidate_results / "candidates.csv", alt_rows)
    by_case = defaultdict(list)
    for row in alt_rows:
        by_case[row["case"]].append(row)
    alt_best = [sorted(by_case[case], key=row_key)[0] for case in CASES]
    write_csv(candidate_results / "best.csv", alt_best)
    write_csv(candidate_results / "evaluate_check.csv", alt_rows)
    write_summary_csv(candidate_results / "summary.csv", by_case)

    (current_bundle / "MANIFEST.md").write_text(
        render_manifest(
            "ex280_ex299_current",
            "Best-only unknown seed bundle for ex280-ex299. This bundle contains exactly one current best verified Verilog/AIG seed per case.",
            best_rows,
            candidate_mode=False,
        )
    )
    (candidates_bundle / "MANIFEST.md").write_text(
        render_manifest(
            candidates_bundle.name,
            "Non-best unknown backend candidate bundle for ex280-ex299. This bundle intentionally excludes the current best seed for each case and keeps four verified alternatives per case, selected by low ADP first while avoiding duplicate source structures where possible.",
            alt_rows,
            candidate_mode=True,
        )
    )

    print(f"current={current_bundle.relative_to(repo)} rows={len(best_rows)}")
    print(f"candidates={candidates_bundle.relative_to(repo)} rows={len(alt_rows)}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
