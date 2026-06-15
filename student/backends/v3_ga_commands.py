"""Command library for the V3 GA backend search.

The V3 runner samples from these operators instead of replaying one fixed
portfolio.  Entries are plain dictionaries to keep the file Python 3.6 friendly
for the contest environment.
"""

from __future__ import print_function

import json
import re


_CHOICE_RE = re.compile(r"\{([^{}]*)\}")
_INT_RE = re.compile(r"\[(\d+),(\d+)\]")


TIMEOUT_CLASSES = {
    "cheap": 45,
    "normal": 75,
    "medium": 120,
    "expensive": 180,
    "very_exp": 300,
    "final_only": 600,
}

SIZE_BUCKETS = [
    ("tiny", 200),
    ("small", 500),
    ("mid", 2000),
    ("medium", 5000),
    ("large", 10000),
]


def timeout_class_for(timeout_sec, risk_level="normal"):
    if risk_level == "final_only":
        return "final_only"
    timeout_sec = int(timeout_sec or 0)
    if timeout_sec <= 45:
        return "cheap"
    if timeout_sec <= 75:
        return "normal"
    if timeout_sec <= 120:
        return "medium"
    if timeout_sec <= 180:
        return "expensive"
    if timeout_sec <= 300:
        return "very_exp"
    return "final_only"


def node_bucket_for(node_min=None, node_max=None):
    if node_min is None and node_max is None:
        return "all"
    if node_max is None:
        return "huge"
    for name, limit in SIZE_BUCKETS:
        if node_max <= limit:
            return name
    return "huge"


def make_operator(
    operator_id,
    tool,
    template,
    family,
    priority,
    timeout_sec,
    node_min=None,
    node_max=None,
    case_filter=None,
    risk_level="normal",
    can_start_sequence=True,
    can_follow_timeout=True,
    params=None,
    notes="",
    timeout_class=None,
    node_bucket=None,
    source_note="",
    enabled_by_default=True,
):
    return {
        "id": operator_id,
        "tool": tool,
        "template": template,
        "family": family,
        "priority": priority,
        "timeout_sec": timeout_sec,
        "node_min": node_min,
        "node_max": node_max,
        "case_filter": case_filter or [],
        "risk_level": risk_level,
        "can_start_sequence": bool(can_start_sequence),
        "can_follow_timeout": bool(can_follow_timeout),
        "params_json": json.dumps(params or {}, sort_keys=True),
        "notes": notes,
        "timeout_class": timeout_class or timeout_class_for(timeout_sec, risk_level),
        "node_bucket": node_bucket or node_bucket_for(node_min, node_max),
        "source_note": source_note,
        "enabled_by_default": bool(enabled_by_default),
    }


def _abc1(command):
    return "strash; %s; strash" % command


def _abc9(command):
    return "strash; &get; %s; &put; strash" % command


def _mixed(*segments):
    return " || ".join(segments)


ABC_RESYN = "balance; rewrite; rewrite -z; balance; rewrite -z; balance"
ABC_RESYN2 = (
    "balance; rewrite; refactor; balance; rewrite; rewrite -z; "
    "balance; refactor -z; rewrite -z; balance"
)
ABC_RESYN3 = (
    "balance; resub; resub -K 6; balance; resub -z; resub -z -K 6; "
    "balance; resub -z -K 5; balance"
)
ABC_COMPRESS = "balance -l; rewrite -l; refactor -l; balance -l; rewrite -l; balance -l"
ABC_COMPRESS2 = (
    "balance -l; rewrite -l; refactor -l; balance -l; rewrite -l; "
    "rewrite -z -l; balance -l; refactor -z -l; rewrite -z -l; balance -l"
)
ABC_RESYN2RS = (
    "balance; resub -K 6; rewrite; resub -K 6 -N 2; refactor; "
    "resub -K 8; balance; resub -K 8 -N 2; rewrite; resub -K 10; "
    "rewrite -z; resub -K 10 -N 2; balance; resub -K 12; "
    "refactor -z; resub -K 12 -N 2; rewrite -z; balance"
)
ABC_COMPRESS2RS = (
    "balance -l; resub -K 6 -l; rewrite -l; resub -K 6 -N 2 -l; "
    "refactor -l; resub -K 8 -l; balance -l; resub -K 8 -N 2 -l; "
    "rewrite -l; resub -K 10 -l; rewrite -z -l; resub -K 10 -N 2 -l; "
    "balance -l; resub -K 12 -l; refactor -z -l; resub -K 12 -N 2 -l; "
    "rewrite -z -l; balance -l"
)
ABC_RESYN2A = "balance; rewrite; balance; rewrite; rewrite -z; balance; rewrite -z; balance"
ABC_RWSAT = "strash; rewrite -l; balance -l; rewrite -l; refactor -l"
ABC_DRWSAT2 = "strash; drw; balance -l; drw; drf; ifraig -C 20; drw; balance -l; drw; drf"
ABC_SHARE = "strash; multi -m; sop; fx; %s" % ABC_RESYN2
ABC_SHARE2 = "strash; multi -m; sop; fx; %s; dc2" % ABC_RESYN2
ABC_SRC_RW = "strash; rewrite -l; rewrite -z -l; rewrite -z -l"
ABC_SRC_RS = "strash; resub -K 6 -N 2 -l; resub -K 9 -N 2 -l; resub -K 12 -N 2 -l"
ABC_SRC_RWS = (
    "strash; rewrite -l; resub -K 6 -N 2 -l; rewrite -z -l; "
    "resub -K 9 -N 2 -l; rewrite -z -l; resub -K 12 -N 2 -l"
)
ABC9_PUT_COMPRESS2RS = "&put; %s; &get" % ABC_COMPRESS2RS
ABC9_PUT_COMPRESS2RS_TWICE = "&put; %s; %s; &get" % (ABC_COMPRESS2RS, ABC_COMPRESS2RS)

FAMILY_SOURCE_NOTES = {
    "abc9_core": "senior-inspired ABC9/GIA core family; normalized local variants",
    "abc1_core": "senior-inspired ABC1 macro/primitive family; expanded locally",
    "high_priority_senior": "senior-highlighted family with local timeout/node adaptations",
    "deepsyn_primitives": "deepsyn building blocks, not full deepsyn as normal mutation",
    "mapping_remap": "mapping/remap perturbation with repo-local AND/INV genlib",
    "stochastic_or_exact": "stochastic/exact local perturbation with adaptive gates",
    "mockturtle": "MockTurtle rewrite/refactor/resubstitution family",
    "cross_tool": "ABC9/MockTurtle sandwich family",
    "esyn": "optional E-Syn seed generator",
}


def apply_adaptive_metadata(ops):
    """Attach our adaptive timeout/node metadata and small local parameter shifts."""
    for op in ops:
        op.setdefault("source_note", FAMILY_SOURCE_NOTES.get(op.get("family", ""), "local V3 GA operator"))
        op.setdefault("enabled_by_default", True)
        op["timeout_class"] = op.get("timeout_class") or timeout_class_for(op.get("timeout_sec"), op.get("risk_level"))
        op["node_bucket"] = op.get("node_bucket") or node_bucket_for(op.get("node_min"), op.get("node_max"))
        if op["id"] in ("hp_transduction_t1", "hp_transduction_t01", "hp_transduction_t0_t1"):
            op["node_max"] = 800
            op["node_bucket"] = node_bucket_for(op.get("node_min"), op.get("node_max"))
            op["timeout_sec"] = max(int(op.get("timeout_sec") or 0), 180)
            op["timeout_class"] = timeout_class_for(op["timeout_sec"], op.get("risk_level"))
        if op["id"] in ("hp_transduction_t2", "hp_transduction_t3", "hp_transduction_t03", "hp_transduction_t03_repeat", "hp_transduction_t03_s_repeat"):
            op["node_max"] = 300
            op["node_bucket"] = node_bucket_for(op.get("node_min"), op.get("node_max"))
            op["timeout_sec"] = max(int(op.get("timeout_sec") or 0), 180)
            op["timeout_class"] = timeout_class_for(op["timeout_sec"], op.get("risk_level"))
        if op["id"].startswith("mt_wrw") or op["id"] in ("mt_flow", "cross_mt_flow_dc2", "cross_mt_flow_deep"):
            op["node_max"] = 12000
            op["node_bucket"] = "large"
        if op["id"].startswith("hp_collapse"):
            op["node_max"] = 6000
            op["node_bucket"] = "medium"
    return ops


def build_v3_operator_library(include_mockturtle=True, include_final=False, include_esyn=False):
    """Return V3 GA operator entries.

    The list intentionally uses our own families and normalized commands.  It
    keeps the same concepts as the senior command list: bounded SAT sweeping,
    ABC9/GIA optimization, transduction, collapse/SOP factoring, exact/local
    improvement, and cross-tool perturbation.
    """
    ops = []

    # ABC9/GIA core.
    ops.extend(
        [
            make_operator("abc9_b", "abc9", _abc9("&b"), "abc9_core", 80, 60),
            make_operator("abc9_dc2", "abc9", _abc9("&dc2"), "abc9_core", 85, 60),
            make_operator("abc9_syn2", "abc9", _abc9("&syn2"), "abc9_core", 80, 60),
            make_operator("abc9_syn3", "abc9", _abc9("&syn3"), "abc9_core", 80, 60),
            make_operator("abc9_syn4", "abc9", _abc9("&syn4"), "abc9_core", 75, 60),
            make_operator("abc9_resyn3", "abc9", _abc9("&resyn3"), "abc9_core", 85, 60),
            make_operator("abc9_resyn3rs", "abc9", _abc9("&resyn3rs"), "abc9_core", 85, 60),
            make_operator("abc9_compress3rs", "abc9", _abc9("&compress3rs"), "abc9_core", 85, 60),
            make_operator("abc9_fraig", "abc9", _abc9("&fraig"), "abc9_core", 80, 90),
            make_operator("abc9_b_dc2", "abc9", _abc9("&b; &dc2"), "abc9_core", 82, 60),
            make_operator("abc9_b_syn2_dc2", "abc9", _abc9("&b; &syn2; &dc2"), "abc9_core", 82, 90),
            make_operator("abc9_b_syn3_dc2", "abc9", _abc9("&b; &syn3; &dc2"), "abc9_core", 80, 90),
            make_operator("abc9_resyn3_dc2", "abc9", _abc9("&resyn3; &dc2"), "abc9_core", 82, 90),
            make_operator("abc9_resyn3rs_dc2", "abc9", _abc9("&resyn3rs; &dc2"), "abc9_core", 82, 90),
            make_operator("abc9_compress3rs_dc2", "abc9", _abc9("&compress3rs; &dc2"), "abc9_core", 82, 90),
            make_operator("abc9_dch_syn2", "abc9", _abc9("&dch{ -f|}; &syn2"), "abc9_core", 78, 90),
            make_operator("abc9_dch_b_dc2", "abc9", _abc9("&dch{ -f|}; &b; &dc2"), "abc9_core", 78, 90),
            make_operator("abc9_fraig_dc2", "abc9", _abc9("&fraig; &dc2"), "abc9_core", 78, 90),
            make_operator("abc9_deepsyn_core", "abc9", _abc9("&dch{ -f|}; &if -a -K [3,6]; &mfs -e -W 20 -L 20{; &fx; &st|}; {&dc2|%s}" % ABC9_PUT_COMPRESS2RS), "abc9_core", 80, 120),
            make_operator("abc9_dch_dc2", "abc9", _abc9("&dch{ -f|}; &dc2"), "abc9_core", 82, 90),
            make_operator("abc9_cfraig_bounded", "abc9", _abc9("&cfraig -C [1000,5000]; &dc2"), "abc9_core", 78, 120),
            make_operator("abc9_cfraig_wide", "abc9", _abc9("&cfraig -C [1000,10000]; &dc2"), "abc9_core", 76, 120),
            make_operator("abc9_choice_bounded", "abc9", _abc9("&choice -C [500,2000]; &dc2"), "abc9_core", 78, 120),
            make_operator("abc9_choice_fraig_mix", "abc9", _abc9("&fraig -C [1000,5000]; &choice -C [500,2000]; &dc2"), "abc9_core", 76, 120),
            make_operator("abc9_sweep_dc2", "abc9", _abc9("&sweep; &dc2"), "abc9_core", 75, 60),
            make_operator("abc9_reduce_dc2", "abc9", _abc9("&reduce; &dc2"), "abc9_core", 75, 60),
            make_operator("abc9_put_compress2rs", "abc9", _abc9(ABC9_PUT_COMPRESS2RS), "abc9_core", 75, 120),
            make_operator("abc9_put_compress2rs_twice", "abc9", _abc9(ABC9_PUT_COMPRESS2RS_TWICE), "abc9_core", 72, 180),
            make_operator("abc9_dc3", "abc9", _abc9("&b; &jf -K 6; &b; &jf -K 4; &b"), "abc9_core", 72, 120),
            make_operator("abc9_dc4", "abc9", _abc9("&b; &jf -K 7; &fx; &b; &jf -K 5; &fx; &b"), "abc9_core", 72, 120),
        ]
    )

    # ABC1 basic building blocks and common macros.
    ops.extend(
        [
            make_operator("abc_resyn", "abc", _abc1(ABC_RESYN), "abc1_core", 70, 60),
            make_operator("abc_resyn2", "abc", _abc1(ABC_RESYN2), "abc1_core", 75, 60),
            make_operator("abc_resyn2a", "abc", _abc1(ABC_RESYN2A), "abc1_core", 73, 60),
            make_operator("abc_resyn3", "abc", _abc1(ABC_RESYN3), "abc1_core", 70, 90),
            make_operator("abc_compress", "abc", _abc1(ABC_COMPRESS), "abc1_core", 70, 60),
            make_operator("abc_compress2", "abc", _abc1(ABC_COMPRESS2), "abc1_core", 75, 90),
            make_operator("abc_resyn2rs", "abc", _abc1(ABC_RESYN2RS), "abc1_core", 75, 120),
            make_operator("abc_r2rs", "abc", _abc1(ABC_RESYN2RS), "abc1_core", 72, 120),
            make_operator("abc_compress2rs", "abc", _abc1(ABC_COMPRESS2RS), "abc1_core", 75, 120),
            make_operator("abc_c2rs", "abc", _abc1(ABC_COMPRESS2RS), "abc1_core", 72, 120),
            make_operator("abc_rewrite", "abc", _abc1("rewrite{ -z|}"), "abc1_core", 65, 60),
            make_operator("abc_refactor", "abc", _abc1("refactor{ -z|}"), "abc1_core", 65, 60),
            make_operator("abc_refactor_n", "abc", _abc1("refactor -N [8,14]{ -z|}"), "abc1_core", 63, 60, node_max=5000),
            make_operator("abc_balance", "abc", _abc1("balance"), "abc1_core", 60, 60),
            make_operator("abc_balance_d", "abc", _abc1("balance -d"), "abc1_core", 58, 60),
            make_operator("abc_balance_x", "abc", _abc1("balance -x"), "abc1_core", 58, 60),
            make_operator("abc_balance_dx", "abc", _abc1("balance -d -x"), "abc1_core", 58, 60),
            make_operator("abc_resub_k", "abc", _abc1("resub -K [5,12] -N [0,3]{ -z|}"), "abc1_core", 70, 60),
            make_operator("abc_resub_k_optional_n", "abc", _abc1("resub -K [5,12]{ -N [0,3]|}"), "abc1_core", 68, 60),
            make_operator("abc_resub_k10_15", "abc", _abc1("resub -K [10,15] -N [1,3]{ -z|}"), "abc1_core", 68, 90, node_max=2000, risk_level="gated"),
            make_operator("abc_resub_f", "abc", _abc1("resub -K [5,10] -F 1"), "abc1_core", 55, 120, node_max=500, risk_level="gated"),
            make_operator("abc_resub_f12", "abc", _abc1("resub -K [5,8] -F [1,2]"), "abc1_core", 52, 120, node_max=200, risk_level="gated"),
            make_operator("abc_resub_l", "abc", _abc1("resub -K [5,12] -N [0,3] -l{ -z|}"), "abc1_core", 65, 60),
            make_operator("abc_dch", "abc", _abc1("dch{ -f|}"), "abc1_core", 70, 60),
            make_operator("abc_dc2", "abc", _abc1("dc2"), "abc1_core", 75, 60),
            make_operator("abc_rw_rf_rs_bal", "abc", _abc1("balance; rewrite -z; refactor -z; resub -K 8 -N 1; balance"), "abc1_core", 75, 90),
            make_operator("abc_rwsat", "abc", _abc1(ABC_RWSAT), "abc1_core", 65, 90),
            make_operator("abc_drwsat", "abc", _abc1("strash; drwsat"), "abc1_core", 62, 90),
            make_operator("abc_drwsat2", "abc", _abc1(ABC_DRWSAT2), "abc1_core", 62, 120),
            make_operator("abc_src_rw", "abc", _abc1(ABC_SRC_RW), "abc1_core", 65, 90),
            make_operator("abc_src_rs", "abc", _abc1(ABC_SRC_RS), "abc1_core", 65, 90),
            make_operator("abc_src_rws", "abc", _abc1(ABC_SRC_RWS), "abc1_core", 65, 120),
            make_operator("abc_dchoice", "abc", _abc1("dchoice -C [500,2000]; dc2"), "abc1_core", 65, 120),
            make_operator("abc_dfraig_plain", "abc", _abc1("dfraig"), "abc1_core", 62, 120),
            make_operator("abc_iresyn", "abc", _abc1("iresyn{ -l|}"), "abc1_core", 62, 90),
            make_operator("abc_irw", "abc", _abc1("irw{ -z|}{ -l|}"), "abc1_core", 62, 90),
            make_operator("abc_logic_mfs2", "abc", _abc1("logic; mfs2"), "abc1_core", 58, 120),
            make_operator("abc_logic_mfs", "abc", _abc1("logic; mfs"), "abc1_core", 58, 120),
            make_operator("abc_share", "abc", _abc1(ABC_SHARE), "abc1_core", 65, 120),
            make_operator("abc_share2", "abc", _abc1(ABC_SHARE2), "abc1_core", 63, 120),
            make_operator("abc_bal_rw_resub_bal", "abc", _abc1("balance; rewrite; resub -K [5,12] -N [0,3]; balance"), "abc1_core", 72, 90),
            make_operator("abc_resub_orch_bal", "abc", _abc1("resub -K [5,12] -N [0,3]; orchestrate; balance"), "abc1_core", 72, 90),
            make_operator("abc_bal_rw_rf_rs_bal", "abc", _abc1("balance; rewrite; refactor; resub -K 8; balance"), "abc1_core", 72, 90),
            make_operator("abc_bal_rwz_rs12_rfz_bal", "abc", _abc1("balance; rewrite -z; resub -K 12 -N 3; refactor -z; balance"), "abc1_core", 65, 90, node_max=2000),
        ]
    )

    # High-priority senior-inspired perturbations.
    ops.extend(
        [
            make_operator("hp_ifraig_small", "abc", _abc1("ifraig -C [20,500]; dc2"), "high_priority_senior", 100, 90),
            make_operator("hp_dfraig_small", "abc", _abc1("dfraig -C [20,500]; dc2"), "high_priority_senior", 95, 90),
            make_operator("hp_ifraig_large", "abc", _abc1("ifraig -C [1000,5000]; dc2"), "high_priority_senior", 85, 120),
            make_operator("hp_orchestrate_k", "abc", _abc1("orchestrate -K [5,12] -N [0,3]"), "high_priority_senior", 100, 90),
            make_operator("hp_orchestrate_optional", "abc", _abc1("orchestrate{ -K [5,12]|}{ -N [0,3]|}"), "high_priority_senior", 98, 90),
            make_operator("hp_orchestrate_large_k", "abc", _abc1("orchestrate -K [10,15] -N [1,3]"), "high_priority_senior", 88, 120, node_max=2000, risk_level="gated"),
            make_operator("hp_orchestrate_f", "abc", _abc1("orchestrate -K [5,10] -F 1"), "high_priority_senior", 82, 120, node_max=500, risk_level="gated"),
            make_operator("hp_transduction_t0", "abc9", _abc9("&transduction -T 0; &dc2"), "high_priority_senior", 100, 90),
            make_operator("hp_transduction_t1", "abc9", _abc9("&transduction -T 1; &dc2"), "high_priority_senior", 90, 120, node_max=500, risk_level="gated"),
            make_operator("hp_transduction_t2", "abc9", _abc9("&transduction -T 2; &dc2"), "high_priority_senior", 85, 120, node_max=200, risk_level="gated"),
            make_operator("hp_transduction_t3", "abc9", _abc9("&transduction -T 3; &dc2"), "high_priority_senior", 80, 120, node_max=200, risk_level="gated"),
            make_operator("hp_transduction_t0_s", "abc9", _abc9("&transduction -T 0 -S [0,4]; &dc2"), "high_priority_senior", 90, 120, node_max=500, risk_level="gated"),
            make_operator("hp_transduction_repeat_t0", "abc9", _abc9("&transduction -T 0; &dc2; &transduction -T 0; &dc2"), "high_priority_senior", 85, 120, node_max=500, risk_level="gated"),
            make_operator("hp_transduction_repeat_t0_3x", "abc9", _abc9("&transduction -T 0; &dc2; &transduction -T 0; &dc2; &transduction -T 0; &dc2"), "high_priority_senior", 80, 120, node_max=5000, risk_level="gated"),
            make_operator("hp_transduction_t01", "abc9", _abc9("&transduction -T [0,1]; &dc2"), "high_priority_senior", 86, 120, node_max=500, risk_level="gated"),
            make_operator("hp_transduction_t03", "abc9", _abc9("&transduction -T [0,3]; &dc2"), "high_priority_senior", 82, 120, node_max=200, risk_level="gated"),
            make_operator("hp_transduction_t03_repeat", "abc9", _abc9("&transduction -T [0,3]; &dc2; &transduction -T [0,3]; &dc2"), "high_priority_senior", 78, 120, node_max=200, risk_level="gated"),
            make_operator("hp_transduction_t03_s_repeat", "abc9", _abc9("&transduction -T [0,3] -S [0,4]; &dc2; &transduction -T [0,3]; &dc2; &dc2"), "high_priority_senior", 76, 120, node_max=200, risk_level="gated"),
            make_operator("hp_transduction_t0_t1", "abc9", _abc9("&transduction -T 0; &dc2; &transduction -T 1; &dc2"), "high_priority_senior", 82, 120, node_max=500, risk_level="gated"),
            make_operator("hp_collapse_sop_fx", "abc", _abc1("collapse; sop; fx; strash"), "high_priority_senior", 100, 90, node_max=5000),
            make_operator("hp_collapse_sop_fx_dc2", "abc", _abc1("collapse; sop; fx; strash; dc2"), "high_priority_senior", 95, 120, node_max=5000),
            make_operator("hp_eslim_small", "abc9", _abc9("&eslim -T [10,30] -Z [1,9]"), "high_priority_senior", 95, 60, node_max=5000, risk_level="gated"),
            make_operator("hp_eslim_dc2", "abc9", _abc9("&eslim -T [10,30] -Z [1,9]; &dc2"), "high_priority_senior", 90, 60, node_max=5000, risk_level="gated"),
        ]
    )

    # Deepsyn primitives.  Full &deepsyn remains final-only.
    ops.extend(
        [
            make_operator("deep_dch_if_mfs", "abc9", _abc9("&dch -f; &if -a -K [3,6]; &mfs -e -W 20 -L 20"), "deepsyn_primitives", 80, 120),
            make_operator("deep_if_mfs", "abc9", _abc9("&if -a -K [3,6]; &mfs -e -W 20 -L 20"), "deepsyn_primitives", 75, 120),
            make_operator("deep_if_fx_st", "abc9", _abc9("&if -a -K [3,6]; &fx; &st"), "deepsyn_primitives", 70, 120),
            make_operator("deep_dch_dc2", "abc9", _abc9("&dch -f; &dc2"), "deepsyn_primitives", 80, 90),
            make_operator("deep_compress2rs", "abc", _abc1(ABC_COMPRESS2RS), "deepsyn_primitives", 75, 120),
        ]
    )

    if include_final:
        ops.append(
            make_operator(
                "final_deepsyn",
                "abc9",
                _abc9("&deepsyn -I 1 -T [8,15]"),
                "deepsyn_primitives",
                40,
                600,
                risk_level="final_only",
                can_start_sequence=False,
                can_follow_timeout=False,
            )
        )

    # Mapping/remap experiments.
    ops.extend(
        [
            make_operator("map_if_g", "abc9", _abc9("&if -g -K [4,6]"), "mapping_remap", 65, 90),
            make_operator("map_dch_if_g", "abc9", _abc9("&dch{ -f|}; &if -g -K [4,6]"), "mapping_remap", 68, 120),
            make_operator("map_if_a_st_dc2", "abc9", _abc9("&if -a -K [3,5]; &st; &dc2"), "mapping_remap", 65, 90),
            make_operator("map_and_inv_s", "abc", "read_genlib student/scripts/and_inv.genlib; dch; amap -s; strash", "mapping_remap", 60, 90, node_max=10000),
            make_operator("map_and_inv_c", "abc", "read_genlib student/scripts/and_inv.genlib; dch; amap -C [100,500] -s; strash", "mapping_remap", 55, 90, node_max=10000),
            make_operator("map_and_inv_dchf_s", "abc", "read_genlib student/scripts/and_inv.genlib; dch -f; amap -s; strash", "mapping_remap", 55, 90, node_max=10000),
            make_operator("map_and_inv_map_a", "abc", "read_genlib student/scripts/and_inv.genlib; dch; map -a; strash", "mapping_remap", 55, 90, node_max=10000),
            make_operator("map_and_inv_map_o", "abc", "read_genlib student/scripts/and_inv.genlib; dch; map -a -o; strash", "mapping_remap", 55, 90, node_max=10000),
        ]
    )

    # Stochastic/exact and local-minima escape operators.
    ops.extend(
        [
            make_operator("rand_randsyn", "abc9", _abc9("&randsyn; &dc2"), "stochastic_or_exact", 60, 90, risk_level="stochastic"),
            make_operator("rand_randsyn_twice", "abc9", _abc9("&randsyn; &randsyn; &dc2"), "stochastic_or_exact", 58, 120, risk_level="stochastic"),
            make_operator("rand_randsyn_sopb", "abc9", _abc9("&randsyn; &sopb; &dc2"), "stochastic_or_exact", 60, 120, risk_level="stochastic"),
            make_operator("sat_satsyn", "abc9", _abc9("&satsyn -T [5,15]; &dc2"), "stochastic_or_exact", 55, 120, risk_level="gated"),
            make_operator("sat_satsyn_short", "abc9", _abc9("&satsyn -T [1,5]; &dc2"), "stochastic_or_exact", 58, 90, risk_level="gated"),
            make_operator("sync_synch2", "abc9", _abc9("&synch2 -f; &dc2"), "stochastic_or_exact", 55, 90, node_max=2000),
            make_operator("sync_synch2_dc2", "abc9", _abc9("&synch2; &dc2"), "stochastic_or_exact", 55, 90, node_max=2000),
            make_operator("rewire_small", "abc9", _abc9("&rewire -I [50,200] -T 10"), "stochastic_or_exact", 55, 120, node_max=2000, risk_level="gated"),
            make_operator("rewire_t15", "abc9", _abc9("&rewire -I [100,500] -T 15"), "stochastic_or_exact", 50, 120, node_max=500, risk_level="gated"),
            make_operator("sopb", "abc9", _abc9("&sopb"), "stochastic_or_exact", 62, 60),
            make_operator("sopb_dc2", "abc9", _abc9("&sopb; &dc2"), "stochastic_or_exact", 65, 90),
            make_operator("sopb_c", "abc9", _abc9("&sopb -C [6,12]"), "stochastic_or_exact", 60, 60),
            make_operator("sopb_c_dc2", "abc9", _abc9("&sopb -C [6,12]; &dc2"), "stochastic_or_exact", 62, 90),
            make_operator("dsdb", "abc9", _abc9("&dsdb"), "stochastic_or_exact", 52, 60),
            make_operator("dsdb_dc2", "abc9", _abc9("&dsdb -C [6,12]; &dc2"), "stochastic_or_exact", 55, 90),
            make_operator("eslim_tiny", "abc9", _abc9("&eslim -T [1,5] -Z [1,9]; &dc2"), "stochastic_or_exact", 52, 60, node_max=5000, risk_level="gated"),
            make_operator("eslim_iter", "abc9", _abc9("&eslim -I [1,2] -T [8,15] -Z [1,9]; &dc2"), "stochastic_or_exact", 52, 90, node_max=5000, risk_level="gated"),
            make_operator("eslim_cleanup_5k", "abc9", _abc9("&put; cleanup; &get; &eslim -T [30,120] -Z [1,9]"), "stochastic_or_exact", 52, 120, node_max=5000, risk_level="gated"),
            make_operator("eslim_cleanup_2k", "abc9", _abc9("&put; cleanup; &get; &eslim -T [60,180] -Z [1,9]"), "stochastic_or_exact", 48, 180, node_max=2000, risk_level="gated"),
            make_operator("eslim_cleanup_1k", "abc9", _abc9("&put; cleanup; &get; &eslim -T [120,300] -Z [1,9]"), "stochastic_or_exact", 45, 300, node_max=1000, risk_level="gated"),
            make_operator("eslim_cleanup_dc2", "abc9", _abc9("&put; cleanup; &get; &eslim -T [30,120] -Z [1,9]; &dc2"), "stochastic_or_exact", 50, 120, node_max=5000, risk_level="gated"),
            make_operator("eslim_cleanup_2k_dc2", "abc9", _abc9("&put; cleanup; &get; &eslim -T [60,180] -Z [1,9]; &dc2"), "stochastic_or_exact", 48, 180, node_max=2000, risk_level="gated"),
            make_operator("eslim_cleanup_1k_dc2", "abc9", _abc9("&put; cleanup; &get; &eslim -T [120,300] -Z [1,9]; &dc2"), "stochastic_or_exact", 45, 300, node_max=1000, risk_level="gated"),
            make_operator("deep_deepsyn_i1", "abc9", _abc9("&deepsyn -I 1 -T [8,15]"), "stochastic_or_exact", 45, 120, node_max=5000, risk_level="gated"),
            make_operator("deep_deepsyn_i1_o", "abc9", _abc9("&deepsyn -I 1 -T [8,15] -o"), "stochastic_or_exact", 43, 120, node_max=5000, risk_level="gated"),
            make_operator("deep_deepsyn_i12", "abc9", _abc9("&deepsyn -I [1,2] -T [10,20]"), "stochastic_or_exact", 42, 180, node_max=5000, risk_level="gated"),
            make_operator("jf_k35", "abc9", _abc9("&jf -K [3,5]; &st; &dc2"), "stochastic_or_exact", 58, 90),
            make_operator("jf_a_k35", "abc9", _abc9("&jf -a -K [3,5]; &st; &dc2"), "stochastic_or_exact", 58, 90),
            make_operator("jf_a_m_k36", "abc9", _abc9("&jf -a -m -K [3,6]; &st; &dc2"), "stochastic_or_exact", 55, 90),
            make_operator("jf_k68", "abc9", _abc9("&jf -K [6,8]; &st; &dc2"), "stochastic_or_exact", 52, 90),
            make_operator("sweep_sopb_dc2", "abc9", _abc9("&sweep; &sopb; &dc2"), "stochastic_or_exact", 62, 90),
            make_operator("reduce_sopb_dc2", "abc9", _abc9("&reduce; &sopb; &dc2"), "stochastic_or_exact", 62, 90),
            make_operator("deepsyn_i1_t15_dc2", "abc9", _abc9("&deepsyn -I 1 -T 15; &dc2"), "stochastic_or_exact", 45, 120, node_max=5000, risk_level="gated"),
            make_operator("deepsyn_i1_t15_sopb", "abc9", _abc9("&deepsyn -I 1 -T 15; &sopb"), "stochastic_or_exact", 42, 120, node_max=5000, risk_level="gated"),
            make_operator("dch_randsyn_dc2", "abc9", _abc9("&dch{ -f|}; &randsyn; &dc2"), "stochastic_or_exact", 58, 120, risk_level="stochastic"),
            make_operator("syn2_randsyn_dc2", "abc9", _abc9("&syn2; &randsyn; &dc2"), "stochastic_or_exact", 58, 120, risk_level="stochastic"),
            make_operator("compress3rs_randsyn_dc2", "abc9", _abc9("&compress3rs; &randsyn; &dc2"), "stochastic_or_exact", 58, 120, risk_level="stochastic"),
            make_operator("reduce_dc2_dch_dc2", "abc9", _abc9("&reduce; &dc2; &dch{ -f|}; &dc2"), "stochastic_or_exact", 60, 120),
        ]
    )

    if include_mockturtle:
        ops.extend(
            [
                make_operator("mt_crw", "mockturtle", "crw", "mockturtle", 80, 120),
                make_operator("mt_wrw", "mockturtle", "wrw", "mockturtle", 75, 120, node_max=10000),
                make_operator("mt_rf", "mockturtle", "rf", "mockturtle", 75, 120),
                make_operator("mt_resub", "mockturtle", "resub", "mockturtle", 75, 120),
                make_operator("mt_resub2", "mockturtle", "resub2", "mockturtle", 70, 180),
                make_operator("mt_sim_resub", "mockturtle", "sim_resub", "mockturtle", 75, 120),
                make_operator("mt_crw_resub", "mockturtle", "crw,resub", "mockturtle", 75, 180),
                make_operator("mt_crw_resub2", "mockturtle", "crw,resub2", "mockturtle", 72, 240),
                make_operator("mt_crw_sim_resub", "mockturtle", "crw,sim_resub", "mockturtle", 72, 180),
                make_operator("mt_resub_crw", "mockturtle", "resub,crw", "mockturtle", 72, 180),
                make_operator("mt_resub2_crw", "mockturtle", "resub2,crw", "mockturtle", 70, 240),
                make_operator("mt_sim_resub_crw", "mockturtle", "sim_resub,crw", "mockturtle", 70, 180),
                make_operator("mt_wrw_resub", "mockturtle", "wrw,resub", "mockturtle", 70, 180, node_max=10000),
                make_operator("mt_wrw_sim_resub", "mockturtle", "wrw,sim_resub", "mockturtle", 70, 180, node_max=10000),
                make_operator("mt_rf_resub", "mockturtle", "rf,resub", "mockturtle", 72, 180),
                make_operator("mt_rf_resub2", "mockturtle", "rf,resub2", "mockturtle", 70, 240),
                make_operator("mt_crw_resub_sim_resub", "mockturtle", "crw,resub,sim_resub", "mockturtle", 68, 240),
                make_operator("mt_crw_rf_resub2", "mockturtle", "crw,rf,resub2", "mockturtle", 68, 300),
                make_operator("mt_resub_crw_sim_resub", "mockturtle", "resub,crw,sim_resub", "mockturtle", 68, 240),
                make_operator("mt_wrw_resub_crw", "mockturtle", "wrw,resub,crw", "mockturtle", 65, 240, node_max=10000),
                make_operator(
                    "mt_flow",
                    "mockturtle",
                    (
                        "crw,resub,rf,resub2,wrw,sim_resub,"
                        "crw,resub,rf,resub2,wrw,sim_resub,"
                        "crw,resub,rf,resub2,wrw,sim_resub"
                    ),
                    "mockturtle",
                    62,
                    360,
                    node_max=10000,
                ),
            ]
        )

        # Cross-tool operators are represented as single ABC cleanup/MT steps;
        # the GA sequence sampler composes them across steps.
        ops.extend(
            [
                make_operator("cross_abc9_dc2", "abc9", _abc9("&dc2"), "cross_tool", 70, 60),
                make_operator("cross_abc9_dch_dc2", "abc9", _abc9("&dch -f; &dc2"), "cross_tool", 70, 90),
                make_operator("cross_mt_crw", "mockturtle", "crw", "cross_tool", 70, 120),
                make_operator("cross_mt_resub", "mockturtle", "resub", "cross_tool", 70, 120),
                make_operator("cross_mt_sim_resub", "mockturtle", "sim_resub", "cross_tool", 70, 120),
                make_operator("cross_dc2_mt_resub", "mixed", _mixed("ABC9:&dc2", "MT:resub"), "cross_tool", 72, 180),
                make_operator("cross_dc2_mt_sim_resub", "mixed", _mixed("ABC9:&dc2", "MT:sim_resub"), "cross_tool", 72, 180),
                make_operator("cross_dc2_mt_crw", "mixed", _mixed("ABC9:&dc2", "MT:crw"), "cross_tool", 72, 180),
                make_operator("cross_dch_dc2_mt_crw_resub", "mixed", _mixed("ABC9:&dch{ -f|}; &dc2", "MT:crw,resub"), "cross_tool", 70, 240),
                make_operator("cross_syn2_mt_sim_resub", "mixed", _mixed("ABC9:&syn2", "MT:sim_resub"), "cross_tool", 70, 180),
                make_operator("cross_resyn3_mt_crw_resub", "mixed", _mixed("ABC9:&resyn3", "MT:crw,resub"), "cross_tool", 70, 240),
                make_operator("cross_compress3rs_mt_sim_resub", "mixed", _mixed("ABC9:&compress3rs", "MT:sim_resub"), "cross_tool", 70, 180),
                make_operator("cross_compress2rs_mt_crw_resub", "mixed", _mixed("ABC:%s" % ABC_COMPRESS2RS, "MT:crw,resub"), "cross_tool", 70, 240),
                make_operator("cross_mt_crw_dc2", "mixed", _mixed("MT:crw", "ABC9:&dc2"), "cross_tool", 72, 180),
                make_operator("cross_mt_resub_dc2", "mixed", _mixed("MT:resub", "ABC9:&dc2"), "cross_tool", 72, 180),
                make_operator("cross_mt_sim_resub_dc2", "mixed", _mixed("MT:sim_resub", "ABC9:&dc2"), "cross_tool", 72, 180),
                make_operator("cross_mt_crw_resub_dch_dc2", "mixed", _mixed("MT:crw,resub", "ABC9:&dch{ -f|}; &dc2"), "cross_tool", 70, 240),
                make_operator("cross_mt_flow_dc2", "mixed", _mixed("MT:crw,resub,rf,resub2,wrw,sim_resub", "ABC9:&dc2"), "cross_tool", 62, 360, node_max=10000),
                make_operator("cross_mt_flow_deep", "mixed", _mixed("MT:crw,resub,rf,resub2,wrw,sim_resub", "ABC9:&dch{ -f|}; &if -a -K [3,6]; &mfs -e -W 20 -L 20"), "cross_tool", 60, 420, node_max=10000),
                make_operator("cross_sandwich_dc2_crw_resub_dc2", "mixed", _mixed("ABC9:&dc2", "MT:crw,resub", "ABC9:&dc2"), "cross_tool", 70, 300),
                make_operator("cross_sandwich_dch_sim_resub_dc2", "mixed", _mixed("ABC9:&dch{ -f|}; &dc2", "MT:sim_resub", "ABC9:&dc2"), "cross_tool", 70, 300),
            ]
        )

    # Our adaptive parameter sweeps.  These keep the senior command concepts but
    # avoid replaying the exact fixed limits from the reference file.
    ops.extend(
        [
            make_operator("adapt_ifraig_conflict", "abc", _abc1("ifraig -C {30|80|160|320|640}; dc2"), "high_priority_senior", 94, 180, node_max=20000, risk_level="gated", source_note="local conflict sweep over senior ifraig concept"),
            make_operator("adapt_dfraig_conflict", "abc", _abc1("dfraig -C {30|80|160|320|640}; dc2"), "high_priority_senior", 90, 180, node_max=20000, risk_level="gated", source_note="local conflict sweep over senior dfraig concept"),
            make_operator("adapt_cfraig_choice", "abc9", _abc9("&cfraig -C {800|1500|3000|6000|12000}; &choice -C {800|1500|3000|6000}; &dc2"), "abc9_core", 88, 240, risk_level="gated", source_note="local ABC9 conflict sweep"),
            make_operator("adapt_choice_only", "abc9", _abc9("&choice -C {800|1500|3000|6000|12000}; &dc2"), "abc9_core", 84, 180, risk_level="gated", source_note="local ABC9 choice conflict sweep"),
            make_operator("adapt_resub_large_low", "abc", _abc1("resub -K {4|5|6|8} -N {0|1}; balance"), "abc1_core", 66, 75, risk_level="normal", source_note="large-safe low-K/low-N resub variant"),
            make_operator("adapt_resub_f_aggressive", "abc", _abc1("resub -K {5|6|8|10} -F 1; balance"), "abc1_core", 52, 180, node_max=800, risk_level="gated", source_note="slightly wider local resub -F gate"),
            make_operator("adapt_orchestrate_wide", "abc", _abc1("orchestrate -K {6|8|10|12} -N {0|1|2|3}; balance"), "high_priority_senior", 92, 180, node_max=10000, risk_level="gated", source_note="local orchestrate parameter sweep"),
            make_operator("adapt_orchestrate_highk", "abc", _abc1("orchestrate -K {10|12|14|15} -N {1|2|3}; balance"), "high_priority_senior", 86, 180, node_max=3000, risk_level="gated", source_note="local high-K orchestrate gate"),
            make_operator("adapt_collapse_sop_fx_aggr", "abc", _abc1("collapse; sop; fx; strash; dc2"), "high_priority_senior", 82, 180, node_max=8000, risk_level="gated", source_note="local wider collapse/sop/fx gate"),
            make_operator("adapt_eslim_fast", "abc9", _abc9("&put; cleanup; &get; &eslim -T {30|60|120|180} -Z {1|3|5|9}; &dc2"), "stochastic_or_exact", 58, 240, node_max=5000, risk_level="gated", source_note="local eSLIM T/Z sweep"),
            make_operator("adapt_eslim_deep_1k", "abc9", _abc9("&put; cleanup; &get; &eslim -T 300 -Z {1|3|5|9}; &dc2"), "stochastic_or_exact", 48, 360, node_max=1000, risk_level="gated", source_note="local eSLIM deep small-case gate"),
            make_operator("adapt_rewire_medium", "abc9", _abc9("&rewire -I {50|100|200|400} -T {8|12|20}; &dc2"), "stochastic_or_exact", 54, 240, node_max=2500, risk_level="gated", source_note="local rewire medium gate"),
            make_operator("adapt_rewire_aggr", "abc9", _abc9("&rewire -I {100|250|500} -T {10|15|25}; &dc2"), "stochastic_or_exact", 48, 300, node_max=4000, risk_level="gated", source_note="local aggressive rewire gate"),
        ]
    )

    if include_esyn:
        ops.append(
            make_operator(
                "esyn_seed_only",
                "esyn",
                "seed_generator",
                "esyn",
                20,
                180,
                risk_level="seed_only",
                can_start_sequence=False,
                can_follow_timeout=False,
                notes="Optional seed generator; not used as a normal mutation operator.",
            )
        )

    return apply_adaptive_metadata(ops)


NEAR_REF_POLISH_OPERATOR_IDS = set(
    [
        "abc_resyn",
        "abc_resyn2",
        "abc_resyn2a",
        "abc_resyn3",
        "abc_compress",
        "abc_compress2",
        "abc_resyn2rs",
        "abc_r2rs",
        "abc_compress2rs",
        "abc_c2rs",
        "abc_rewrite",
        "abc_refactor",
        "abc_balance",
        "abc_balance_d",
        "abc_balance_x",
        "abc_dch",
        "abc_dc2",
        "abc_rw_rf_rs_bal",
        "abc_src_rw",
        "abc_src_rs",
        "abc_src_rws",
        "abc_bal_rw_resub_bal",
        "abc_bal_rw_rf_rs_bal",
        "abc_bal_rwz_rs12_rfz_bal",
        "abc9_b",
        "abc9_dc2",
        "abc9_syn2",
        "abc9_syn3",
        "abc9_resyn3",
        "abc9_resyn3rs",
        "abc9_compress3rs",
        "abc9_b_dc2",
        "abc9_b_syn2_dc2",
        "abc9_b_syn3_dc2",
        "abc9_resyn3_dc2",
        "abc9_resyn3rs_dc2",
        "abc9_compress3rs_dc2",
        "abc9_dch_syn2",
        "abc9_dch_b_dc2",
        "abc9_dch_dc2",
        "abc9_sweep_dc2",
        "abc9_reduce_dc2",
        "abc9_put_compress2rs",
        "deep_dch_dc2",
        "deep_compress2rs",
        "map_if_g",
        "map_dch_if_g",
        "map_if_a_st_dc2",
        "sopb",
        "sopb_dc2",
        "sopb_c",
        "sopb_c_dc2",
        "dsdb",
        "dsdb_dc2",
        "mt_crw",
        "mt_resub",
        "mt_resub2",
        "mt_sim_resub",
        "mt_crw_resub",
        "mt_resub_crw",
        "mt_resub2_crw",
        "mt_sim_resub_crw",
        "mt_rf_resub",
        "cross_abc9_dc2",
        "cross_abc9_dch_dc2",
        "cross_mt_crw",
        "cross_mt_resub",
        "cross_mt_sim_resub",
        "cross_dc2_mt_resub",
        "cross_dc2_mt_sim_resub",
        "cross_dc2_mt_crw",
        "cross_mt_crw_dc2",
        "cross_mt_resub_dc2",
        "cross_mt_sim_resub_dc2",
        "cross_sandwich_dc2_crw_resub_dc2",
    ]
)


def filter_operators_for_policy(operators, policy):
    """Return the V3 operator subset for a targeted rescue policy."""
    policy = policy or "default"
    if policy in ("default", "all", "high_gap_rescue"):
        return list(operators)
    if policy == "near_ref_heavy_no_deepsyn":
        return [
            op
            for op in operators
            if op.get("risk_level") not in ("final_only", "seed_only")
            and "deepsyn" not in (op.get("id") or "").lower()
            and "deepsyn" not in (op.get("template") or "").lower()
            and (op.get("family") or "") != "deepsyn_primitives"
        ]
    if policy == "near_ref_polish":
        return [
            op
            for op in operators
            if op.get("id") in NEAR_REF_POLISH_OPERATOR_IDS
            and op.get("risk_level") not in ("final_only", "seed_only")
        ]
    raise ValueError("unknown V3 operator policy: %s" % policy)


def eligible_operators(case, node_count, operators, include_final=False):
    selected = []
    for op in operators:
        if not op.get("enabled_by_default", True):
            continue
        if op.get("risk_level") == "final_only" and not include_final:
            continue
        filters = op.get("case_filter") or []
        if filters and case not in filters:
            continue
        node_min = op.get("node_min")
        node_max = op.get("node_max")
        if node_count is not None:
            if node_min is not None and node_count < node_min:
                continue
            if node_max is not None and node_count > node_max:
                continue
        selected.append(op)
    return selected


def expand_template(template, rng):
    def choose(match):
        options = match.group(1).split("|")
        return rng.choice(options)

    def randint(match):
        lo = int(match.group(1))
        hi = int(match.group(2))
        if hi < lo:
            lo, hi = hi, lo
        return str(rng.randint(lo, hi))

    expanded = _CHOICE_RE.sub(choose, template)
    expanded = _INT_RE.sub(randint, expanded)
    return " ".join(expanded.split())


def expand_operator(operator, rng):
    expanded = expand_template(operator["template"], rng)
    row = dict(operator)
    row["expanded_command"] = expanded
    return row


def operator_manifest_rows(operators):
    rows = []
    for op in operators:
        rows.append(
            {
                "operator_id": op["id"],
                "id": op["id"],
                "tool": op["tool"],
                "template": op["template"],
                "family": op["family"],
                "priority": op["priority"],
                "timeout_sec": op["timeout_sec"],
                "timeout_class": op.get("timeout_class", ""),
                "node_min": op["node_min"],
                "node_max": op["node_max"],
                "node_bucket": op.get("node_bucket", ""),
                "case_filter": ",".join(op.get("case_filter") or []),
                "risk_level": op["risk_level"],
                "can_start_sequence": op["can_start_sequence"],
                "can_follow_timeout": op["can_follow_timeout"],
                "params_json": op["params_json"],
                "source_note": op.get("source_note", ""),
                "enabled_by_default": op.get("enabled_by_default", True),
                "notes": op["notes"],
            }
        )
    return rows
