#!/usr/bin/env python3
"""Merge and validate frontend-only shard CSVs for this campaign."""

from __future__ import print_function

import csv
import re
from pathlib import Path


RUN_ID = "ex223_ex225_frontend_fp16_transfer_20260614_1310"
ROOT = Path(__file__).resolve().parents[4]
BASE = ROOT / "student" / "frontend_campaigns" / "campaigns" / RUN_ID
RESULTS = BASE / "results"
AGENTS = [
    "fp16-transfer-r1",
]
FILES = [
    "candidates.csv",
    "evaluation_results.csv",
    "best_improvements.csv",
    "failed_hypotheses.csv",
    "simulation_results.csv",
    "shared_structure_report.csv",
]


def case_domain(case):
    try:
        number = int(case[2:])
    except Exception:
        return ""
    if 200 <= number <= 219:
        return "bf16"
    if 220 <= number <= 239:
        return "fp16"
    if 240 <= number <= 254:
        return "float_fp8"
    if 255 <= number <= 279:
        return "integer"
    if 280 <= number <= 299:
        return "unknown"
    return ""


def read_rows(path):
    if not path.exists():
        return []
    with path.open(newline="") as handle:
        reader = csv.DictReader(handle)
        return list(reader)


def first(row, names):
    for name in names:
        value = row.get(name)
        if value not in (None, ""):
            return value
    return ""


def infer_case(row):
    value = first(row, ["case", "case_id", "benchmark"])
    if value:
        return value
    for key in ("candidate", "candidate_id", "name", "method_signature", "verilog_path", "aig_path", "log_path"):
        match = re.search(r"ex\d{3}", row.get(key, "") or "")
        if match:
            return match.group(0)
    return ""


def normalize(row, agent, fname, source_csv):
    row = dict(row)
    case = infer_case(row)
    if case and not row.get("case"):
        row["case"] = case
    row["agent_id"] = row.get("agent_id") or agent
    row["domain"] = row.get("domain") or case_domain(row.get("case", ""))
    row["source_csv"] = str(source_csv.relative_to(ROOT))
    candidate = first(row, ["candidate", "candidate_id", "name"])
    if candidate and not row.get("candidate"):
        row["candidate"] = candidate
    if not row.get("log_path"):
        row["log_path"] = first(row, ["evaluate_log", "evaluate_log_path", "yosys_log_path"])
    if not row.get("log_path") and row.get("eval_dir") and candidate:
        eval_dir = Path(row["eval_dir"])
        row["log_path"] = str(eval_dir.parent.parent / "logs" / (candidate + ".evaluate.py.log"))
    if not row.get("log_path"):
        inferred = infer_evaluate_log(row)
        if inferred:
            row["log_path"] = inferred
    if not row.get("aig_path"):
        row["aig_path"] = first(row, ["official_aig_path"])
    status = (row.get("status") or row.get("evaluate_status") or "").upper()
    if not row.get("status") and status:
        row["status"] = status
    if not row.get("equivalent") and status == "OK":
        row["equivalent"] = "1"
    if fname == "best_improvements.csv":
        if not row.get("old_adp"):
            row["old_adp"] = first(row, [
                "previous_frontend_adp", "previous_adp", "current_frontend_adp",
                "frontend_target_adp", "catalog_frontend_adp", "baseline_adp",
            ])
        if not row.get("new_area"):
            row["new_area"] = first(row, ["area", "best_area"])
        if not row.get("new_delay"):
            row["new_delay"] = first(row, ["delay", "best_delay"])
        if not row.get("new_adp"):
            row["new_adp"] = first(row, ["adp", "best_adp"])
        if not row.get("improvement_adp"):
            try:
                row["improvement_adp"] = str(int(float(row["old_adp"])) - int(float(row["new_adp"])))
            except Exception:
                pass
    else:
        if not row.get("area"):
            row["area"] = first(row, ["new_area", "best_area"])
        if not row.get("delay"):
            row["delay"] = first(row, ["new_delay", "best_delay"])
        if not row.get("adp"):
            row["adp"] = first(row, ["new_adp", "best_adp"])
        if not row.get("old_adp"):
            row["old_adp"] = first(row, [
                "previous_frontend_adp", "current_frontend_adp",
                "frontend_target_adp", "catalog_frontend_adp",
            ])
    return row


def infer_evaluate_log(row):
    candidate = first(row, ["candidate", "candidate_id", "name"])
    verilog_path = row.get("verilog_path", "")
    if not candidate or not verilog_path:
        return ""
    path = Path(verilog_path)
    parts = list(path.parts)
    try:
        index = parts.index("verilog")
    except ValueError:
        return ""
    log_path = Path(*parts[:index]) / "logs" / (candidate + ".evaluate.py.log")
    if (ROOT / log_path).exists():
        return str(log_path)
    if log_path.is_absolute() and log_path.exists():
        return str(log_path)
    return ""


def write_csv(path, rows, preferred):
    fields = []
    for name in preferred:
        if name not in fields:
            fields.append(name)
    for row in rows:
        for name in row:
            if name not in fields:
                fields.append(name)
    with path.open("w", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=fields, extrasaction="ignore")
        writer.writeheader()
        writer.writerows(rows)


def merge():
    preferred = {
        "candidates.csv": [
            "agent_id", "domain", "case", "candidate", "method_signature",
            "hypothesis_family", "high_level_description", "representation",
            "sharing_strategy", "synth_flow", "status", "equivalent", "area",
            "delay", "adp", "old_adp", "reference_adp", "verilog_path",
            "aig_path", "log_path", "source_csv", "notes",
        ],
        "evaluation_results.csv": [
            "agent_id", "domain", "case", "candidate", "method_signature",
            "status", "equivalent", "area", "delay", "adp", "verilog_path",
            "aig_path", "log_path", "source_csv", "notes",
        ],
        "best_improvements.csv": [
            "agent_id", "domain", "case", "candidate", "method_signature",
            "old_area", "old_delay", "old_adp", "new_area", "new_delay",
            "new_adp", "improvement_adp", "verilog_path", "aig_path",
            "log_path", "source_csv", "notes",
        ],
        "failed_hypotheses.csv": [
            "agent_id", "domain", "case", "method_signature",
            "hypothesis_family", "reason", "best_area", "best_delay",
            "best_adp", "verilog_path", "aig_path", "log_path", "source_csv",
            "notes",
        ],
        "simulation_results.csv": [
            "agent_id", "domain", "case", "candidate", "method_signature",
            "sim_status", "log_path", "source_csv", "notes",
        ],
        "shared_structure_report.csv": [
            "agent_id", "domain", "case", "candidate", "method_signature",
            "shared_structure", "result", "area", "delay", "adp", "source_csv",
            "notes",
        ],
    }
    counts = {}
    for fname in FILES:
        rows = []
        seen = set()
        for agent in AGENTS:
            source = BASE / "agent_shards" / agent / fname
            for raw in read_rows(source):
                row = normalize(raw, agent, fname, source)
                key = (
                    fname,
                    row.get("agent_id", ""),
                    row.get("case", ""),
                    row.get("candidate", ""),
                    row.get("method_signature", ""),
                    row.get("aig_path", ""),
                    row.get("adp", "") or row.get("new_adp", ""),
                )
                if key in seen:
                    continue
                seen.add(key)
                rows.append(row)
        write_csv(RESULTS / fname, rows, preferred[fname])
        counts[fname] = len(rows)
    return counts


def fill_paths_from_candidates():
    candidates = {}
    for row in read_rows(RESULTS / "candidates.csv"):
        key = (row.get("case", ""), row.get("candidate", ""))
        candidates[key] = row

    path_files = ("evaluation_results.csv", "best_improvements.csv")
    for fname in path_files:
        path = RESULTS / fname
        rows = read_rows(path)
        if not rows:
            continue
        with path.open(newline="") as handle:
            fieldnames = csv.DictReader(handle).fieldnames
        changed = False
        for row in rows:
            key = (row.get("case", ""), row.get("candidate", ""))
            candidate = candidates.get(key, {})
            for column, aliases in (
                ("verilog_path", ("verilog_path",)),
                ("aig_path", ("aig_path", "official_aig_path")),
                ("log_path", ("log_path", "evaluate_log", "evaluate_log_path")),
            ):
                if row.get(column):
                    continue
                for alias in aliases:
                    value = candidate.get(alias)
                    if value:
                        row[column] = value
                        changed = True
                        break
        if changed:
            write_csv(path, rows, fieldnames or [])


def ok(row):
    status = (row.get("status") or row.get("evaluate_status") or "").upper()
    equiv = (row.get("equivalent") or "").lower()
    return status == "OK" or equiv in ("1", "true", "yes")


def make_case_summary():
    baseline = {}
    for row in read_rows(BASE / "target_snapshot.csv"):
        baseline[row["case"]] = row
    best = {}
    counts = {}
    ok_counts = {}
    non_ok_counts = {}
    for row in read_rows(RESULTS / "evaluation_results.csv"):
        case = row.get("case", "")
        if not case:
            continue
        counts[case] = counts.get(case, 0) + 1
        if ok(row):
            ok_counts[case] = ok_counts.get(case, 0) + 1
        else:
            non_ok_counts[case] = non_ok_counts.get(case, 0) + 1
            continue
        try:
            adp = int(float(row.get("adp", "")))
        except Exception:
            continue
        if case not in best or adp < int(float(best[case]["adp"])):
            best[case] = row
    rows = []
    for case in sorted(counts, key=lambda value: int(value[2:])):
        row = best.get(case, {})
        base = baseline.get(case, {})
        delta = ""
        improved = ""
        try:
            delta = str(int(float(base["frontend_best_adp"])) - int(float(row.get("adp", ""))))
            improved = "1" if int(delta) > 0 else "0"
        except Exception:
            pass
        rows.append({
            "domain": row.get("domain") or base.get("domain", ""),
            "case": case,
            "attempts": counts.get(case, 0),
            "official_ok": ok_counts.get(case, 0),
            "non_ok": non_ok_counts.get(case, 0),
            "campaign_best_candidate": row.get("candidate", ""),
            "campaign_best_area": row.get("area", ""),
            "campaign_best_delay": row.get("delay", ""),
            "campaign_best_adp": row.get("adp", ""),
            "baseline_frontend_adp": base.get("frontend_best_adp", ""),
            "delta_vs_baseline": delta,
            "improved_vs_baseline": improved,
            "reference_adp": base.get("reference_adp", ""),
            "verilog_path": row.get("verilog_path", ""),
            "aig_path": row.get("aig_path", ""),
            "log_path": row.get("log_path", ""),
            "agent_id": row.get("agent_id", ""),
            "method_signature": row.get("method_signature", ""),
        })
    write_csv(RESULTS / "case_best_summary.csv", rows, [
        "domain", "case", "attempts", "official_ok", "non_ok",
        "campaign_best_candidate", "campaign_best_area",
        "campaign_best_delay", "campaign_best_adp", "baseline_frontend_adp",
        "delta_vs_baseline", "improved_vs_baseline", "reference_adp",
        "verilog_path", "aig_path", "log_path", "agent_id",
        "method_signature",
    ])


def validate():
    errors = []
    ok_keys = set()
    for index, row in enumerate(read_rows(RESULTS / "evaluation_results.csv"), 2):
        if not ok(row):
            continue
        key = (row.get("case", ""), row.get("candidate", ""))
        ok_keys.add(key)
        for name in ("area", "delay", "adp"):
            if not row.get(name):
                errors.append(("missing_qor", index, name, key))
        for name in ("verilog_path", "aig_path", "log_path"):
            path = row.get(name, "")
            if not path or not (ROOT / path).exists():
                errors.append(("missing_ok_path", index, name, path, key))
    for index, row in enumerate(read_rows(RESULTS / "best_improvements.csv"), 2):
        key = (row.get("case", ""), row.get("candidate", ""))
        if key not in ok_keys:
            errors.append(("improvement_without_ok_eval", index, key))
    return errors


def main():
    counts = merge()
    fill_paths_from_candidates()
    make_case_summary()
    errors = validate()
    print("merged", counts)
    print("validation_errors", len(errors))
    for error in errors[:30]:
        print(error)
    state = [
        {"item": "run_id", "value": RUN_ID},
        {"item": "merged_files", "value": str(counts)},
        {"item": "validation_errors", "value": str(len(errors))},
    ]
    write_csv(RESULTS / "coordinator_merge_state.csv", state, ["item", "value"])
    return 1 if errors else 0


if __name__ == "__main__":
    raise SystemExit(main())
