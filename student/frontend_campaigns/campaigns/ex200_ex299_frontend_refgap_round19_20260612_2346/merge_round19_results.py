#!/usr/bin/env python3
"""Merge round19 frontend campaign shard CSVs."""

import importlib.util
import csv
from pathlib import Path


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[3]
TEMPLATE = ROOT / "student" / "frontend_campaigns" / "campaigns" / "ex200_ex299_frontend_refgap_round8_20260612_1826" / "merge_round8_results.py"
RUN_ID = "ex200_ex299_frontend_refgap_round19_20260612_2346"

spec = importlib.util.spec_from_file_location("round19_merge_base", str(TEMPLATE))
base = importlib.util.module_from_spec(spec)
spec.loader.exec_module(base)

base.RUN_ID = RUN_ID
base.HERE = HERE
base.ROOT = ROOT
base.SHARDS = HERE / "agent_shards"
base.RESULTS = HERE / "results"
base.FRONTEND = ROOT / "student" / "frontend_campaigns"

_read_rows = base.read_rows


def read_rows_round19(path):
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
            if not row.get("agent_id"):
                row["agent_id"] = Path(path).parent.name
            kept.append(row)
        return kept
    return rows


def update_search_state_round19(changed):
    path = base.FRONTEND / "search_state.csv"
    fields, rows = base.load_csv_by_case(path)
    by_case = {row["case"]: row for row in rows}
    for case, old, new, cand in changed:
        row = by_case.get(case)
        if not row:
            continue
        row["status"] = "round19_evaluated_gap_remains"
        row["assigned_agent"] = "round19"
        row["current_focus"] = "round19 official frontend improvement accepted: {0} ADP {1}->{2}".format(cand, old, new)
        row["next_hypothesis"] = "continue only with materially different sharing; reference gap remains"
        row["next_representation"] = "lower-delay/lower-area high-level source, not same round19 replay"
        row["budget"] = "continue"
        row["blocked_reason"] = ""
        row["last_update"] = "2026-06-12 round19 coordinator merge"
        ref = base.as_int(row.get("reference_adp"))
        if ref:
            row["current_best_adp"] = str(new)
            row["ratio_to_reference"] = "{:.6f}".format(float(new) / ref)
    base.write_rows(path, fields, rows)


def update_hypothesis_bank_round19(changed):
    if not changed:
        return
    path = base.FRONTEND / "hypothesis_bank.csv"
    fields, rows = base.load_csv_by_case(path)
    for case, old, new, cand in changed:
        rows.append(
            {
                "case": case,
                "hypothesis": "round19 accepted frontend improvement",
                "representation_family": cand,
                "sharing_strategy": "official evaluate.py candidate from round19 shard",
                "source": RUN_ID,
                "confidence": "high",
                "novelty": "exploit",
                "expected_gain": "medium",
                "status": "tested_improved",
                "reason": "frontend ADP {0}->{1}; reference gap remains".format(old, new),
                "created_by": "coordinator",
                "created_at": "2026-06-12",
            }
        )
    base.write_rows(path, fields, rows)


base.read_rows = read_rows_round19
base.update_search_state = update_search_state_round19
base.update_hypothesis_bank = update_hypothesis_bank_round19


def post_process_round19_outputs():
    improvements = read_rows_round19(base.RESULTS / "best_improvements.csv")
    improved_by_case = {row.get("case", ""): row for row in improvements}

    case_outcomes = base.RESULTS / "case_outcomes.csv"
    if case_outcomes.is_file():
        with case_outcomes.open(newline="") as handle:
            reader = csv.DictReader(handle)
            rows = list(reader)
        rename = {
            "round8_candidates": "round19_candidates",
            "round8_best_candidate": "round19_best_candidate",
            "round8_best_adp": "round19_best_adp",
            "round8_improved_frontend": "round19_improved_frontend",
        }
        fields = [rename.get(field, field) for field in reader.fieldnames]
        for row in rows:
            for old, new in rename.items():
                if old in row:
                    row[new] = row.pop(old)
            case = row.get("case", "")
            if case in improved_by_case:
                row["round19_improved_frontend"] = "1"
                row["frontend_best_adp_after"] = improved_by_case[case].get("new_frontend_adp") or improved_by_case[case].get("adp", "")
        with case_outcomes.open("w", newline="") as handle:
            writer = csv.DictWriter(handle, fieldnames=fields)
            writer.writeheader()
            writer.writerows(rows)

    report = HERE / "COORDINATOR_REPORT.md"
    if report.is_file():
        text = report.read_text()
        text = text.replace("Round8", "Round19").replace("round8", "round19")
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


base.main()
post_process_round19_outputs()
