#!/usr/bin/env python3
"""Merge round17 frontend campaign shard CSVs."""

from pathlib import Path


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[3]
TEMPLATE = ROOT / "student" / "frontend_campaigns" / "campaigns" / "ex200_ex299_frontend_refgap_round8_20260612_1826" / "merge_round8_results.py"
RUN_ID = "ex200_ex299_frontend_refgap_round17_20260612_2300"

namespace = {"__name__": "round17_merge_from_round8", "__file__": str(TEMPLATE)}
exec(compile(TEMPLATE.read_text(), str(TEMPLATE), "exec"), namespace)

namespace["RUN_ID"] = RUN_ID
namespace["HERE"] = HERE
namespace["ROOT"] = ROOT
namespace["SHARDS"] = HERE / "agent_shards"
namespace["RESULTS"] = HERE / "results"
namespace["FRONTEND"] = ROOT / "student" / "frontend_campaigns"

_template_read_rows = namespace["read_rows"]


def read_rows_round17(path):
    rows = _template_read_rows(path)
    if Path(path).name == "best_improvements.csv":
        kept = []
        for row in rows:
            candidate_id = row.get("candidate_id", "")
            if not candidate_id or candidate_id == "BLOCKED_NO_CANDIDATE":
                continue
            if namespace["as_int"](row.get("adp") or row.get("new_frontend_adp")) is None:
                continue
            if not (
                row.get("verilog_path")
                and row.get("aig_path")
                and (row.get("log_path") or row.get("evaluate_log"))
            ):
                continue
            kept.append(row)
        return kept
    if Path(path).name == "candidates.csv":
        official_rows = _template_read_rows(Path(path).parent / "evaluation_results.csv")
        official_by_id = {
            row.get("candidate_id", ""): row
            for row in official_rows
            if row.get("official_evaluate_status", row.get("official_status", row.get("evaluate_status", ""))) in ("OK", "")
        }
        kept = []
        for row in rows:
            if row.get("equivalent") != "1":
                continue
            status = row.get("official_evaluate_status") or row.get("official_status") or row.get("evaluate_status")
            if status and status != "OK":
                continue
            eval_row = official_by_id.get(row.get("candidate_id", ""))
            log = (
                row.get("log_path")
                or row.get("evaluate_log")
                or row.get("eval_log")
                or row.get("evaluate_py_log_path")
            )
            if not log and eval_row:
                log = (
                    eval_row.get("log_path")
                    or eval_row.get("evaluate_log")
                    or eval_row.get("eval_log")
                    or eval_row.get("evaluate_py_log_path")
                )
            if not log:
                continue
            row["log_path"] = log
            if not row.get("agent_id"):
                row["agent_id"] = Path(path).parent.name
            kept.append(row)
        return kept
    return rows


def update_search_state_round17(changed):
    path = namespace["FRONTEND"] / "search_state.csv"
    fields, rows = namespace["load_csv_by_case"](path)
    by_case = {row["case"]: row for row in rows}
    for case, old, new, cand in changed:
        row = by_case.get(case)
        if not row:
            continue
        row["status"] = "round17_evaluated_gap_remains"
        row["assigned_agent"] = "round17"
        row["current_focus"] = (
            "round17 official frontend improvement accepted: "
            "{0} ADP {1}->{2}".format(cand, old, new)
        )
        row["next_hypothesis"] = "continue only with materially different sharing; reference gap remains"
        row["next_representation"] = "lower-delay/lower-area high-level source, not same round17 replay"
        row["budget"] = "continue"
        row["blocked_reason"] = ""
        row["last_update"] = "2026-06-12 round17 coordinator merge"
        ref = namespace["as_int"](row.get("reference_adp"))
        if ref:
            row["current_best_adp"] = str(new)
            row["ratio_to_reference"] = "{:.6f}".format(float(new) / ref)
    namespace["write_rows"](path, fields, rows)


def update_hypothesis_bank_round17(changed):
    if not changed:
        return
    path = namespace["FRONTEND"] / "hypothesis_bank.csv"
    fields, rows = namespace["load_csv_by_case"](path)
    for case, old, new, cand in changed:
        rows.append(
            {
                "case": case,
                "hypothesis": "round17 accepted frontend improvement",
                "representation_family": cand,
                "sharing_strategy": "official evaluate.py candidate from round17 shard",
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
    namespace["write_rows"](path, fields, rows)


namespace["read_rows"] = read_rows_round17
namespace["update_search_state"] = update_search_state_round17
namespace["update_hypothesis_bank"] = update_hypothesis_bank_round17
namespace["main"]()
