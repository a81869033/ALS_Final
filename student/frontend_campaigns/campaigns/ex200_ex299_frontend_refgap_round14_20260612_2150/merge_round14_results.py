#!/usr/bin/env python3
"""Merge round14 results using the round8 coordinator merge implementation."""

from pathlib import Path


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[3]
TEMPLATE = ROOT / "student" / "frontend_campaigns" / "campaigns" / "ex200_ex299_frontend_refgap_round8_20260612_1826" / "merge_round8_results.py"
RUN_ID = "ex200_ex299_frontend_refgap_round14_20260612_2150"

namespace = {"__name__": "round14_merge_from_round8", "__file__": str(TEMPLATE)}
exec(compile(TEMPLATE.read_text(), str(TEMPLATE), "exec"), namespace)

namespace["RUN_ID"] = RUN_ID
namespace["HERE"] = HERE
namespace["ROOT"] = ROOT
namespace["SHARDS"] = HERE / "agent_shards"
namespace["RESULTS"] = HERE / "results"
namespace["FRONTEND"] = ROOT / "student" / "frontend_campaigns"

_template_read_rows = namespace["read_rows"]


def read_rows_round14(path):
    rows = _template_read_rows(path)
    if Path(path).name == "candidates.csv":
        official_rows = _template_read_rows(Path(path).parent / "evaluation_results.csv")
        official_by_id = {
            row.get("candidate_id", ""): row
            for row in official_rows
            if row.get("official_evaluate_status") == "OK"
        }
        kept = []
        for row in rows:
            if row.get("equivalent") != "1":
                continue
            status = row.get("official_evaluate_status", "")
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


def update_search_state_round14(changed):
    path = namespace["FRONTEND"] / "search_state.csv"
    fields, rows = namespace["load_csv_by_case"](path)
    by_case = {row["case"]: row for row in rows}
    for case, old, new, cand in changed:
        row = by_case.get(case)
        if not row:
            continue
        row["status"] = "round14_evaluated_gap_remains"
        row["assigned_agent"] = "round14"
        row["current_focus"] = (
            "round14 official frontend improvement accepted: "
            "{0} ADP {1}->{2}".format(cand, old, new)
        )
        row["next_hypothesis"] = "continue only with materially different sharing; reference gap remains"
        row["next_representation"] = "lower-delay/lower-area high-level source, not same round14 replay"
        row["budget"] = "continue"
        row["blocked_reason"] = ""
        row["last_update"] = "2026-06-12 round14 coordinator merge"
        ref = namespace["as_int"](row.get("reference_adp"))
        if ref:
            row["current_best_adp"] = str(new)
            row["ratio_to_reference"] = "{:.6f}".format(float(new) / ref)
    namespace["write_rows"](path, fields, rows)


def update_hypothesis_bank_round14(changed):
    if not changed:
        return
    path = namespace["FRONTEND"] / "hypothesis_bank.csv"
    fields, rows = namespace["load_csv_by_case"](path)
    for case, old, new, cand in changed:
        rows.append(
            {
                "case": case,
                "hypothesis": "round14 accepted frontend improvement",
                "representation_family": cand,
                "sharing_strategy": "official evaluate.py candidate from round14 shard",
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


namespace["read_rows"] = read_rows_round14
namespace["update_search_state"] = update_search_state_round14
namespace["update_hypothesis_bank"] = update_hypothesis_bank_round14
namespace["main"]()
