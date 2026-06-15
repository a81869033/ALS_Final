#!/usr/bin/env python3
"""Merge round20 frontend campaign shard CSVs."""

import csv
import importlib.util
from pathlib import Path


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[3]
TEMPLATE = ROOT / "student" / "frontend_campaigns" / "campaigns" / "ex200_ex299_frontend_refgap_round8_20260612_1826" / "merge_round8_results.py"
RUN_ID = "ex200_ex299_frontend_refgap_round20_20260613_0015"
ROUND_LABEL = "round20"

spec = importlib.util.spec_from_file_location("round20_merge_base", str(TEMPLATE))
base = importlib.util.module_from_spec(spec)
spec.loader.exec_module(base)

base.RUN_ID = RUN_ID
base.HERE = HERE
base.ROOT = ROOT
base.SHARDS = HERE / "agent_shards"
base.RESULTS = HERE / "results"
base.FRONTEND = ROOT / "student" / "frontend_campaigns"

_read_rows = base.read_rows


def read_rows_round20(path):
    rows = _read_rows(path)
    name = Path(path).name
    if name == "best_improvements.csv":
        kept = []
        for row in rows:
            candidate_id = row.get("candidate_id", "")
            if not candidate_id or candidate_id == "BLOCKED_NO_CANDIDATE":
                continue
            new_adp = base.as_int(row.get("adp") or row.get("new_frontend_adp"))
            old_adp = base.as_int(row.get("previous_frontend_adp") or row.get("current_frontend_adp"))
            if new_adp is None:
                continue
            if old_adp is not None and new_adp >= old_adp:
                continue
            if not (row.get("verilog_path") and row.get("aig_path") and (row.get("log_path") or row.get("evaluate_log"))):
                continue
            kept.append(row)
        return kept
    if name == "candidates.csv":
        official_rows = _read_rows(Path(path).parent / "evaluation_results.csv")
        official_by_id = {
            row.get("candidate_id", ""): row
            for row in official_rows
            if row.get("official_evaluate_status", row.get("official_status", row.get("evaluate_status", ""))) in ("OK", "")
        }
        kept = []
        for row in rows:
            if row.get("candidate_id") == "BLOCKED_NO_CANDIDATE":
                continue
            if row.get("equivalent") != "1":
                continue
            status = row.get("official_evaluate_status") or row.get("official_status") or row.get("evaluate_status")
            if status and status != "OK":
                continue
            if base.as_int(row.get("adp")) is None:
                continue
            eval_row = official_by_id.get(row.get("candidate_id", ""))
            log = row.get("log_path") or row.get("evaluate_log") or row.get("eval_log") or row.get("evaluate_py_log_path")
            if not log and eval_row:
                log = eval_row.get("log_path") or eval_row.get("evaluate_log") or eval_row.get("eval_log") or eval_row.get("evaluate_py_log_path")
            if not log:
                continue
            row["log_path"] = log
            if not row.get("method_signature") and eval_row and eval_row.get("method_signature"):
                row["method_signature"] = eval_row.get("method_signature", "")
            if not row.get("notes") and eval_row and eval_row.get("notes"):
                row["notes"] = eval_row.get("notes", "")
            if not row.get("agent_id"):
                row["agent_id"] = Path(path).parent.name
            kept.append(row)
        return kept
    return rows


def update_search_state_round20(changed):
    path = base.FRONTEND / "search_state.csv"
    fields, rows = base.load_csv_by_case(path)
    by_case = {row["case"]: row for row in rows}
    for case, old, new, cand in changed:
        row = by_case.get(case)
        if not row:
            continue
        row["status"] = "{0}_evaluated_gap_remains".format(ROUND_LABEL)
        row["assigned_agent"] = ROUND_LABEL
        row["current_focus"] = "{0} official frontend improvement accepted: {1} ADP {2}->{3}".format(ROUND_LABEL, cand, old, new)
        row["next_hypothesis"] = "continue only with materially different shared high-level structure; reference gap remains"
        row["next_representation"] = "avoid exact {0} replay".format(ROUND_LABEL)
        row["budget"] = "continue"
        row["blocked_reason"] = ""
        row["last_update"] = "2026-06-13 {0} coordinator merge".format(ROUND_LABEL)
        ref = base.as_int(row.get("reference_adp"))
        if ref:
            row["current_best_adp"] = str(new)
            row["ratio_to_reference"] = "{:.6f}".format(float(new) / ref)
    base.write_rows(path, fields, rows)


def update_hypothesis_bank_round20(changed):
    if not changed:
        return
    path = base.FRONTEND / "hypothesis_bank.csv"
    fields, rows = base.load_csv_by_case(path)
    for case, old, new, cand in changed:
        rows.append(
            {
                "case": case,
                "hypothesis": "{0} accepted frontend improvement".format(ROUND_LABEL),
                "representation_family": cand,
                "sharing_strategy": "official evaluate.py candidate from round20 shard",
                "source": RUN_ID,
                "confidence": "high",
                "novelty": "exploit",
                "expected_gain": "medium",
                "status": "tested_improved",
                "reason": "frontend ADP {0}->{1}; reference gap remains".format(old, new),
                "created_by": "coordinator",
                "created_at": "2026-06-13",
            }
        )
    base.write_rows(path, fields, rows)


def post_process_round20_outputs():
    improvements = read_rows_round20(base.RESULTS / "best_improvements.csv")
    improved_by_case = {row.get("case", ""): row for row in improvements}

    case_outcomes = base.RESULTS / "case_outcomes.csv"
    if case_outcomes.is_file():
        with case_outcomes.open(newline="") as handle:
            reader = csv.DictReader(handle)
            rows = list(reader)
        rename = {
            "round8_candidates": "{0}_candidates".format(ROUND_LABEL),
            "round8_best_candidate": "{0}_best_candidate".format(ROUND_LABEL),
            "round8_best_adp": "{0}_best_adp".format(ROUND_LABEL),
            "round8_improved_frontend": "{0}_improved_frontend".format(ROUND_LABEL),
        }
        fields = [rename.get(field, field) for field in reader.fieldnames]
        for row in rows:
            for old, new in rename.items():
                if old in row:
                    row[new] = row.pop(old)
            case = row.get("case", "")
            if case in improved_by_case:
                row["{0}_improved_frontend".format(ROUND_LABEL)] = "1"
                row["frontend_best_adp_after"] = improved_by_case[case].get("new_frontend_adp") or improved_by_case[case].get("adp", "")
        with case_outcomes.open("w", newline="") as handle:
            writer = csv.DictWriter(handle, fieldnames=fields)
            writer.writeheader()
            writer.writerows(rows)

    report = HERE / "COORDINATOR_REPORT.md"
    if report.is_file():
        text = report.read_text()
        text = text.replace("Round8", ROUND_LABEL.replace("round", "Round")).replace("round8", ROUND_LABEL)
        if improvements:
            lines = ["Accepted frontend best improvements:"]
            for row in improvements:
                old = row.get("previous_frontend_adp") or row.get("current_frontend_adp", "")
                new = row.get("new_frontend_adp") or row.get("adp", "")
                lines.append(
                    "- `{case}`: `{candidate_id}` ADP `{old}->{new}`, reference `{ref}`.".format(
                        case=row.get("case", ""),
                        candidate_id=row.get("candidate_id", ""),
                        old=old,
                        new=new,
                        ref=row.get("reference_adp", ""),
                    )
                )
            replacement = "\n".join(lines)
            start = text.find("Accepted registry updates:")
            if start != -1:
                end = text.find("\n\n", start)
                if end != -1:
                    text = text[:start] + replacement + text[end:]
        report.write_text(text)


base.read_rows = read_rows_round20
base.update_search_state = update_search_state_round20
base.update_hypothesis_bank = update_hypothesis_bank_round20

def clear_previous_results():
    base.write_rows(base.RESULTS / "candidates.csv", base.CANDIDATE_FIELDS, [])
    base.write_rows(base.RESULTS / "evaluation_results.csv", base.EVAL_FIELDS, [])
    base.write_rows(base.RESULTS / "failed_hypotheses.csv", base.FAILED_FIELDS, [])
    base.write_rows(base.RESULTS / "shared_structure_report.csv", base.SHARED_FIELDS, [])
    base.write_rows(base.RESULTS / "simulation_results.csv", base.SIM_FIELDS, [])
    base.write_rows(base.RESULTS / "best_improvements.csv", base.IMPROVEMENT_FIELDS, [])

def run_merge():
    clear_previous_results()
    base.main()
    post_process_round20_outputs()


if __name__ == "__main__":
    run_merge()
