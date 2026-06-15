#!/usr/bin/env python3
"""Merge round10 results using the round8 coordinator merge implementation."""

from pathlib import Path


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[3]
TEMPLATE = ROOT / "student" / "frontend_campaigns" / "campaigns" / "ex200_ex299_frontend_refgap_round8_20260612_1826" / "merge_round8_results.py"
RUN_ID = "ex200_ex299_frontend_refgap_round10_20260612_1911"

namespace = {"__name__": "round10_merge_from_round8", "__file__": str(TEMPLATE)}
exec(compile(TEMPLATE.read_text(), str(TEMPLATE), "exec"), namespace)

namespace["RUN_ID"] = RUN_ID
namespace["HERE"] = HERE
namespace["ROOT"] = ROOT
namespace["SHARDS"] = HERE / "agent_shards"
namespace["RESULTS"] = HERE / "results"
namespace["FRONTEND"] = ROOT / "student" / "frontend_campaigns"

_template_read_rows = namespace["read_rows"]


def read_rows_round10(path):
    rows = _template_read_rows(path)
    if Path(path).name == "candidates.csv":
        # Round10 records synthesis/non-equivalence failures in
        # failed_hypotheses/evaluation_results. Keep final candidates.csv to
        # official equivalent candidates so path validation matches the
        # campaign success contract.
        return [row for row in rows if row.get("equivalent") == "1"]
    return rows


namespace["read_rows"] = read_rows_round10


def update_search_state_round10(changed):
    path = namespace["FRONTEND"] / "search_state.csv"
    fields, rows = namespace["load_csv_by_case"](path)
    by_case = {row["case"]: row for row in rows}
    for case, old, new, cand in changed:
        row = by_case.get(case)
        if not row:
            continue
        row["status"] = "round10_evaluated_gap_remains"
        row["assigned_agent"] = "unknown-state-r10"
        row["current_focus"] = (
            "round10 official frontend improvement accepted: "
            "{0} ADP {1}->{2}".format(cand, old, new)
        )
        row["next_hypothesis"] = (
            "continue state/cell semantic sharing; current improvement still "
            "above reference"
        )
        row["next_representation"] = (
            "materially different lower-delay state descriptor or recurrence, "
            "not same symbol-plane split replay"
        )
        row["budget"] = "continue"
        row["blocked_reason"] = ""
        row["last_update"] = "2026-06-12 round10 coordinator merge"
        ref = namespace["as_int"](row.get("reference_adp"))
        if ref:
            row["current_best_adp"] = str(new)
            row["ratio_to_reference"] = "{:.6f}".format(float(new) / ref)
    namespace["write_rows"](path, fields, rows)


def update_hypothesis_bank_round10(changed):
    if not changed:
        return
    path = namespace["FRONTEND"] / "hypothesis_bank.csv"
    fields, rows = namespace["load_csv_by_case"](path)
    for case, old, new, cand in changed:
        rows.append(
            {
                "case": case,
                "hypothesis": "round10 accepted frontend improvement",
                "representation_family": cand,
                "sharing_strategy": "official evaluate.py candidate from round10 shard",
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


namespace["update_search_state"] = update_search_state_round10
namespace["update_hypothesis_bank"] = update_hypothesis_bank_round10
namespace["main"]()
