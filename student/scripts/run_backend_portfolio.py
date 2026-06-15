#!/usr/bin/env python3
"""Backend portfolio runner for curated ALS seed bundles.

This runner is intentionally conservative: it starts from curated seed
bundles, runs a bounded backend portfolio, records every attempt, and keeps
enough checkpoint state to resume without repeating completed tasks.
"""

import argparse
import csv
import hashlib
import json
import os
import queue
import random
import re
import shutil
import subprocess
import sys
import time
import traceback
from collections import OrderedDict, defaultdict
from concurrent.futures import ThreadPoolExecutor, as_completed
from pathlib import Path

if __package__ in (None, ""):
    sys.path.insert(0, str(Path(__file__).resolve().parents[2]))

from student.backends.culs_flow import CULS_FLOW_COMMANDS, default_culs_bin
from student.backends.abc_step_flow import run_abc_operator, run_truth_ttopt
from student.backends.esyn_flow import EsynContractError, EsynError, esyn_seed_candidates_from_eqn, tool_status as esyn_tool_status
from student.backends.esyn_flow import write_aig_to_eqn
from student.backends.mockturtle_flow import SUPPORTED_FLOWS as MOCKTURTLE_SUPPORTED_FLOWS
from student.backends.mockturtle_flow import discover_runner, run_mockturtle
from student.backends.v3_ga_commands import build_v3_operator_library, eligible_operators, expand_operator
from student.backends.v3_ga_commands import filter_operators_for_policy, operator_manifest_rows
from student.common.abc import is_equivalent, measure_adp, run_aig_flow
from student.frontends.yosys_synth import DEFAULT_YOSYS, SynthError, synthesize_verilog


ROOT = Path(__file__).resolve().parents[2]
DEFAULT_ABC = ROOT / "student" / "abc"
DEFAULT_DOMAIN = "bf16"
DEFAULT_CASES = "ex200-ex219"
DEFAULT_CURRENT_BUNDLE = ROOT / "student" / "seeds" / "bf16" / "ex200_ex219_current"
DEFAULT_BACKEND_BUNDLE_GLOB = "ex200_ex219_backend_candidates_*"
DEFAULT_BF16_V1_PARETO = (
    ROOT
    / "student"
    / "runs"
    / "bf16"
    / "ex200_ex219_backend_portfolio_v1_full_20260610_1738"
    / "results"
    / "pareto.csv"
)

DOMAIN_CONFIGS = {
    "bf16": {
        "cases": "ex200-ex219",
        "current_bundle": ROOT / "student" / "seeds" / "bf16" / "ex200_ex219_current",
        "backend_bundle_glob": "ex200_ex219_backend_candidates_*",
    },
    "fp16": {
        "cases": "ex220-ex239",
        "current_bundle": ROOT / "student" / "seeds" / "fp16" / "ex220_ex239_current",
        "backend_bundle_glob": "ex220_ex239_backend_candidates_*",
    },
    "float_fp8": {
        "cases": "ex240-ex254",
        "current_bundle": ROOT / "student" / "seeds" / "float_fp8" / "ex240_ex254_current",
        "backend_bundle_glob": "ex240_ex254_backend_candidates_*",
    },
    "integer": {
        "cases": "ex255-ex279",
        "current_bundle": ROOT / "student" / "seeds" / "integer" / "ex255_ex279_current",
        "backend_bundle_glob": "ex255_ex279_backend_candidates_*",
    },
    "unknown": {
        "cases": "ex280-ex299",
        "current_bundle": ROOT / "student" / "seeds" / "unknown" / "ex280_ex299_current",
        "backend_bundle_glob": "ex280_ex299_backend_candidates_*",
    },
}


HISTORY_FIELDNAMES = [
    "case",
    "candidate_id",
    "family_id",
    "root_family_id",
    "lineage",
    "parent_id",
    "parent_hash",
    "source",
    "tool",
    "tool_chain",
    "command",
    "command_expanded",
    "params_json",
    "aig_path",
    "aig_hash",
    "verilog_path",
    "seed_origin",
    "area",
    "delay",
    "adp",
    "parent_area",
    "parent_delay",
    "parent_adp",
    "delta_area",
    "delta_delay",
    "delta_adp",
    "equivalent",
    "round",
    "phase",
    "tier",
    "runtime_sec",
    "is_pareto",
    "is_near_pareto",
    "is_active",
    "is_new_pareto",
    "duplicate_of",
    "scheduler_score",
    "selected_reason",
    "preflight_status",
    "esyn_output",
    "esyn_rewrite_rank",
    "generation",
    "sequence_id",
    "command_sequence",
    "hybrid_source",
    "cone_substitution_source",
    "pareto_gap_tag",
    "post_pareto_stage",
    "frontier_region",
    "notes",
]

PROFILE_FIELDNAMES = [
    "case",
    "family_id",
    "tool",
    "tool_chain",
    "command",
    "params_json",
    "attempts",
    "equivalent_count",
    "new_pareto_count",
    "timeout_count",
    "failure_count",
    "best_delta_adp",
    "best_delta_area",
    "best_delta_delay",
    "recent_attempts",
    "recent_new_pareto_count",
    "recent_success_rate",
]

SCHEDULER_FIELDNAMES = [
    "case",
    "round",
    "phase",
    "cycle",
    "parent_id",
    "parent_hash",
    "tool",
    "tool_chain",
    "command",
    "params_json",
    "scheduler_score",
    "selected_reason",
]

PHASE_SUMMARY_FIELDNAMES = [
    "case",
    "cycle",
    "phase",
    "round_start",
    "round_end",
    "attempts",
    "equivalent_count",
    "new_pareto_count",
    "best_adp_before",
    "best_adp_after",
    "runtime_sec",
]

SUMMARY_FIELDNAMES = [
    "case",
    "pre_backend_current_adp",
    "pre_backend_best_candidate_adp",
    "v2_best_adp",
    "v3_best_adp",
    "pre_backend_best_candidate_id",
    "pre_backend_best_aig_path",
    "pre_backend_area",
    "pre_backend_delay",
    "pre_backend_adp",
    "best_candidate_id",
    "best_aig_path",
    "best_area",
    "best_delay",
    "best_adp",
    "delta_adp_vs_pre_backend",
    "adp_ratio_to_pre_backend",
    "improves_pre_backend",
    "improvement_pct_vs_pre_backend",
    "final_deepsyn_status",
    "final_deepsyn_candidate_id",
    "final_deepsyn_area",
    "final_deepsyn_delay",
    "final_deepsyn_adp",
    "final_deepsyn_improved",
    "final_deepsyn_notes",
    "reference_area",
    "reference_delay",
    "reference_adp",
    "delta_vs_current",
    "delta_vs_v2",
    "adp_ratio_to_reference",
    "ratio_to_reference",
    "beats_reference",
    "best_command_sequence",
    "ttopt_used",
    "mockturtle_used",
    "esyn_used",
    "pareto_points",
    "near_pareto_points",
    "history_rows",
]

OPERATOR_STEP_FIELDNAMES = [
    "case",
    "sequence_id",
    "candidate_id",
    "generation",
    "parent_id",
    "step_index",
    "operator_id",
    "family",
    "tool",
    "expanded_command",
    "input_aig",
    "output_aig",
    "status",
    "timeout_sec",
    "runtime_sec",
    "notes",
]

LINEAGE_FIELDNAMES = [
    "case",
    "candidate_id",
    "parent_id",
    "parent_hash",
    "generation",
    "sequence_id",
    "command_sequence",
    "source",
    "aig_hash",
    "area",
    "delay",
    "adp",
    "hybrid_source",
    "cone_substitution_source",
    "pareto_gap_tag",
    "post_pareto_stage",
    "frontier_region",
]

COMMAND_STATS_FIELDNAMES = [
    "case",
    "operator_id",
    "family",
    "attempts",
    "equivalent_count",
    "timeout_count",
    "failed_count",
    "new_pareto_count",
    "best_delta_adp",
    "recent_success_score",
]

TIMEOUT_FAILURE_FIELDNAMES = [
    "case",
    "sequence_id",
    "candidate_id",
    "generation",
    "parent_id",
    "operator_id",
    "status",
    "timeout_sec",
    "runtime_sec",
    "notes",
]


ABC_TIER0 = OrderedDict(
    [
        ("bal_rw", "balance; rewrite; rewrite -z; balance"),
        ("resyn", "balance; rewrite; rewrite -z; balance; rewrite -z; balance"),
        (
            "resyn2",
            "balance; rewrite; refactor; balance; rewrite; rewrite -z; "
            "balance; refactor -z; rewrite -z; balance",
        ),
        ("dc2", "strash; dc2; balance"),
        ("dch", "strash; dch; balance"),
        ("dc2_dch", "strash; dc2; dch; balance"),
        ("dch_dc2", "strash; dch; dc2; balance"),
    ]
)

ABC_TIER1 = OrderedDict(
    [
        (
            "resyn2a",
            "balance; rewrite; balance; rewrite; rewrite -z; balance; rewrite -z; balance",
        ),
        (
            "resyn3",
            "balance; resub; resub -K 6; balance; resub -z; resub -z -K 6; "
            "balance; resub -z -K 5; balance",
        ),
        (
            "compress2",
            "balance -l; rewrite -l; refactor -l; balance -l; rewrite -l; "
            "rewrite -z -l; balance -l; refactor -z -l; rewrite -z -l; balance -l",
        ),
        (
            "resyn2rs",
            "balance; resub -K 6; rewrite; resub -K 6 -N 2; refactor; "
            "resub -K 8; balance; resub -K 8 -N 2; rewrite; resub -K 10; "
            "rewrite -z; resub -K 10 -N 2; balance; resub -K 12; "
            "refactor -z; resub -K 12 -N 2; rewrite -z; balance",
        ),
        (
            "compress2rs",
            "balance -l; resub -K 6 -l; rewrite -l; resub -K 6 -N 2 -l; "
            "refactor -l; resub -K 8 -l; balance -l; resub -K 8 -N 2 -l; "
            "rewrite -l; resub -K 10 -l; rewrite -z -l; resub -K 10 -N 2 -l; "
            "balance -l; resub -K 12 -l; refactor -z -l; resub -K 12 -N 2 -l; "
            "rewrite -z -l; balance -l",
        ),
        ("dc2_rw", "strash; dc2; balance; rewrite; rewrite -z; balance"),
        ("dch_rw", "strash; dch; balance; rewrite; rewrite -z; balance"),
        ("src_rw", "strash; rewrite -l; rewrite -z -l; rewrite -z -l"),
        (
            "src_rws",
            "strash; rewrite -l; resub -K 6 -N 2 -l; rewrite -z -l; "
            "resub -K 9 -N 2 -l; rewrite -z -l; resub -K 12 -N 2 -l",
        ),
        ("delay_try", "strash; dc2; if -K 6; strash; balance; rewrite -z; balance"),
    ]
)

ABC_TIER2 = OrderedDict(
    [
        ("ifraig", "strash; ifraig; balance"),
        ("dch_f", "strash; dch -f; balance"),
        ("if_g_k6", "strash; dc2; if -g -K 6; strash; balance"),
        ("if_g_k8", "strash; dc2; if -g -K 8; strash; balance"),
        ("resub_k4", "balance; resub -K 4; balance"),
        ("resub_k6", "balance; resub -K 6; balance"),
        ("resub_k8", "balance; resub -K 8; balance"),
        ("resub_k10", "balance; resub -K 10; balance"),
        ("resub_k12", "balance; resub -K 12; balance"),
        ("resub_z_k8", "balance; resub -z -K 8; balance"),
        ("resub_z_k10", "balance; resub -z -K 10; balance"),
        ("resub_z_k12", "balance; resub -z -K 12; balance"),
    ]
)

ABC9_COMMANDS = OrderedDict(
    [
        ("abc9_syn2_dc2", "strash; &get; &st; &syn2; &dc2; &put; strash"),
    ]
)

FINAL_DEEPSYN_COMMAND = "strash; &get; &st; &deepsyn -T {timeout} -A {area_limit}; &put; strash"

MOCKTURTLE_FLOWS_V1 = ("resub", "balance", "resub_balance", "balance_resub")
MOCKTURTLE_FLOWS_V2 = (
    "resub",
    "balance",
    "resub_balance",
    "balance_resub",
    "cut_rewrite",
    "refactor",
    "sim_resub",
    "window_rewrite",
    "cut_refactor",
    "window_resub_balance",
)


def rel(path):
    if not path:
        return ""
    path = Path(path)
    try:
        return str(path.resolve().relative_to(ROOT))
    except ValueError:
        return str(path)


def parse_cases(spec):
    cases = []
    for part in str(spec).split(","):
        part = part.strip()
        if not part:
            continue
        if "-" in part:
            left, right = part.split("-", 1)
            left_num = int(left.replace("ex", ""))
            right_num = int(right.replace("ex", ""))
            cases.extend(["ex{0}".format(index) for index in range(left_num, right_num + 1)])
        else:
            cases.append(part if part.startswith("ex") else "ex{0}".format(int(part)))
    return cases


def case_sort_key(case):
    match = re.search(r"\d+", str(case))
    if not match:
        return 10**9
    return int(match.group(0))


def safe_id(value, limit=96):
    text = re.sub(r"[^A-Za-z0-9_.-]+", "_", str(value)).strip("_")
    if not text:
        return "candidate"
    return text[:limit]


def parse_int(value):
    if value is None:
        return None
    text = str(value).strip().replace(",", "")
    if not text:
        return None
    try:
        return int(float(text))
    except ValueError:
        return None


def truthy(value):
    return str(value).strip().lower() in ("1", "true", "t", "yes", "y", "ok", "pass")


def file_sha256(path):
    digest = hashlib.sha256()
    with Path(path).open("rb") as handle:
        for chunk in iter(lambda: handle.read(1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest()


def read_csv(path):
    path = Path(path)
    if not path.is_file():
        return []
    with path.open(newline="") as handle:
        return list(csv.DictReader(handle))


def write_csv(path, rows, fieldnames):
    path = Path(path)
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=fieldnames)
        writer.writeheader()
        for row in rows:
            writer.writerow({name: csv_cell(row.get(name, "")) for name in fieldnames})


def csv_cell(value):
    if value is None:
        return ""
    text = str(value)
    return text.replace("\r\n", "\\n").replace("\n", "\\n").replace("\r", "\\n")


def write_json(path, value):
    path = Path(path)
    path.parent.mkdir(parents=True, exist_ok=True)
    tmp = path.with_suffix(path.suffix + ".tmp")
    with tmp.open("w") as handle:
        json.dump(value, handle, indent=2, sort_keys=True)
    tmp.replace(path)


def read_json(path, default):
    path = Path(path)
    if not path.is_file():
        return default
    with path.open() as handle:
        return json.load(handle)


def first_module_name(verilog_path):
    module_re = re.compile(r"\bmodule\s+([A-Za-z_][A-Za-z0-9_$]*)")
    with Path(verilog_path).open() as handle:
        for line in handle:
            match = module_re.search(line)
            if match:
                return match.group(1)
    return "top"


def load_reference(path):
    refs = {}
    for row in read_csv(path):
        case = row.get("case", "")
        if not case:
            continue
        refs[case] = {
            "area": parse_int(row.get("area")),
            "delay": parse_int(row.get("delay")),
            "adp": parse_int(row.get("adp")),
        }
    return refs


def command_library_rows(include_abc9=True, include_mockturtle=True, include_culs=True, include_esyn=False, portfolio_version="v1"):
    rows = []
    if include_esyn:
        rows.append(
            {
                "tool": "esyn",
                "tool_chain": "esyn_per_output_single",
                "phase": "esyn_seed",
                "tier": "0",
                "command": "per_output_single",
                "command_expanded": "write_eqn; esyn per-output rewrite; read_eqn",
                "params_json": "{}",
            }
        )
    for name, command in ABC_TIER0.items():
        rows.append(
            {
                "tool": "abc",
                "tool_chain": "abc_{0}".format(name),
                "phase": "abc_abc9",
                "tier": "0",
                "command": name,
                "command_expanded": command,
                "params_json": "{}",
            }
        )
    for name, command in ABC_TIER1.items():
        rows.append(
            {
                "tool": "abc",
                "tool_chain": "abc_{0}".format(name),
                "phase": "abc_abc9",
                "tier": "1",
                "command": name,
                "command_expanded": command,
                "params_json": "{}",
            }
        )
    if portfolio_version == "v2":
        for name, command in ABC_TIER2.items():
            rows.append(
                {
                    "tool": "abc",
                    "tool_chain": "abc_{0}".format(name),
                    "phase": "abc_abc9",
                    "tier": "2",
                    "command": name,
                    "command_expanded": command,
                    "params_json": "{}",
                }
            )
    if include_abc9:
        for name, command in ABC9_COMMANDS.items():
            rows.append(
                {
                    "tool": "abc9",
                    "tool_chain": name,
                    "phase": "abc_abc9",
                    "tier": "0",
                    "command": name,
                    "command_expanded": command,
                    "params_json": "{}",
                }
            )
    if include_mockturtle:
        flows = MOCKTURTLE_FLOWS_V2 if portfolio_version == "v2" else MOCKTURTLE_FLOWS_V1
        for flow in flows:
            if flow not in MOCKTURTLE_SUPPORTED_FLOWS:
                continue
            rows.append(
                {
                    "tool": "mockturtle",
                    "tool_chain": "mockturtle_{0}".format(flow),
                    "phase": "mockturtle",
                    "tier": "0",
                    "command": flow,
                    "command_expanded": flow,
                    "params_json": json.dumps({"flow": flow}, sort_keys=True),
                }
            )
    if include_culs:
        flow_names = ("culs_resyn2",) if portfolio_version != "v2" else tuple(CULS_FLOW_COMMANDS.keys())
        for flow_name in flow_names:
            command = CULS_FLOW_COMMANDS[flow_name]
            rows.append(
                {
                    "tool": "culs",
                    "tool_chain": flow_name,
                    "phase": "culs",
                    "tier": "0",
                    "command": flow_name,
                    "command_expanded": "read <input>; {0}; write <output>".format(command),
                    "params_json": json.dumps({"script": command}, sort_keys=True),
                }
            )
    return rows


def commands_for_phase(phase, round_in_phase, args):
    all_rows = command_library_rows(
        include_abc9=not args.skip_abc9,
        include_mockturtle=not args.skip_mockturtle,
        include_culs=not args.skip_culs,
        include_esyn=args.enable_esyn,
        portfolio_version=args.portfolio_version,
    )
    rows = [row for row in all_rows if row["phase"] == phase]
    if phase == "abc_abc9":
        if args.portfolio_version == "v2":
            desired_tier = str(min(round_in_phase, 2))
            return [row for row in rows if row["tier"] == desired_tier or row["tool"] == "abc9"]
        desired_tier = "0" if round_in_phase == 0 else "1"
        return [row for row in rows if row["tier"] == desired_tier or row["tool"] == "abc9"]
    return rows


def blank_row():
    return {name: "" for name in HISTORY_FIELDNAMES}


def completed_key(parent_hash, command_row):
    return "|".join(
        [
            parent_hash or "",
            command_row["tool"],
            command_row["tool_chain"],
            command_row["command"],
            command_row.get("params_json", "{}"),
        ]
    )


def seed_key(seed):
    return "seed|{0}|{1}|{2}".format(seed["case"], seed["family_id"], rel(seed.get("aig_path") or seed.get("verilog_path")))


def root_family_id(row):
    return row.get("root_family_id") or row.get("family_id") or ""


def is_valid_candidate(row):
    return truthy(row.get("equivalent")) and parse_int(row.get("area")) is not None and parse_int(row.get("delay")) is not None


def is_pool_candidate(row):
    return is_valid_candidate(row) and not row.get("duplicate_of")


def dominates(left, right):
    left_area = parse_int(left.get("area"))
    left_delay = parse_int(left.get("delay"))
    right_area = parse_int(right.get("area"))
    right_delay = parse_int(right.get("delay"))
    if None in (left_area, left_delay, right_area, right_delay):
        return False
    return (
        left_area <= right_area
        and left_delay <= right_delay
        and (left_area < right_area or left_delay < right_delay)
    )


def pareto_rows(rows):
    valid = [row for row in rows if is_pool_candidate(row) and row.get("aig_hash")]
    result = []
    for row in valid:
        dominated = False
        for other in valid:
            if other is row:
                continue
            if dominates(other, row):
                dominated = True
                break
        if not dominated:
            result.append(row)
    result.sort(key=candidate_sort_key)
    return result


def family_priority(row):
    family = row.get("family_id", "")
    if family == "current":
        return 0
    if family.startswith("alt"):
        return 1
    return 2


def candidate_sort_key(row):
    return (
        case_sort_key(row.get("case", "")),
        parse_int(row.get("adp")) or 10**18,
        parse_int(row.get("area")) or 10**18,
        parse_int(row.get("delay")) or 10**18,
        family_priority(row),
        row.get("aig_hash", ""),
        row.get("candidate_id", ""),
    )


def history_sort_key(row):
    phase_order = {
        "seed": 0,
        "ttopt_seed": 1,
        "esyn_seed": 2,
        "v3_ga": 3,
        "abc_abc9": 4,
        "mockturtle": 5,
        "culs": 6,
        "final_deepsyn": 7,
    }
    return (
        case_sort_key(row.get("case", "")),
        parse_int(row.get("round")) if parse_int(row.get("round")) is not None else 10**9,
        phase_order.get(row.get("phase", ""), 99),
        family_priority(row),
        row.get("parent_id", ""),
        row.get("tool", ""),
        row.get("tool_chain", ""),
        row.get("candidate_id", ""),
    )


def profile_sort_key(row):
    return (
        case_sort_key(row.get("case", "")),
        family_priority(row),
        row.get("family_id", ""),
        row.get("tool", ""),
        row.get("tool_chain", ""),
        row.get("command", ""),
        row.get("params_json", ""),
    )


def near_pareto_rows(rows, pareto, limit):
    pareto_hashes = set(row.get("aig_hash") for row in pareto)
    valid = [row for row in rows if is_pool_candidate(row) and row.get("aig_hash") not in pareto_hashes]
    if not valid or limit <= 0:
        return []
    best_adp = min(parse_int(row.get("adp")) for row in pareto) if pareto else min(parse_int(row.get("adp")) for row in valid)
    threshold = int(best_adp * 1.10) if best_adp is not None else None
    near = []
    seen_family = set()
    for row in sorted(valid, key=candidate_sort_key):
        if threshold is not None and parse_int(row.get("adp")) is not None and parse_int(row.get("adp")) <= threshold:
            near.append(row)
        elif row.get("family_id") not in seen_family:
            near.append(row)
            seen_family.add(row.get("family_id"))
        if len(near) >= limit:
            break
    return near


def select_active(pareto, near, max_active):
    selected = []
    seen_hashes = set()

    def add(row):
        if not row.get("aig_hash") or row.get("aig_hash") in seen_hashes:
            return
        selected.append(row)
        seen_hashes.add(row.get("aig_hash"))

    if pareto:
        add(min(pareto, key=candidate_sort_key))
        add(min(pareto, key=lambda row: parse_int(row.get("area")) or 10**18))
        add(min(pareto, key=lambda row: parse_int(row.get("delay")) or 10**18))
    best_by_family = {}
    for row in pareto + near:
        family = row.get("family_id", "")
        if family not in best_by_family or (parse_int(row.get("adp")) or 10**18) < (parse_int(best_by_family[family].get("adp")) or 10**18):
            best_by_family[family] = row
    for row in sorted(best_by_family.values(), key=candidate_sort_key):
        add(row)
    for row in pareto + near:
        add(row)
        if len(selected) >= max_active:
            break
    return selected[:max_active]


def reference_summary_for_case(case, references):
    return references.get(case, {"area": None, "delay": None, "adp": None})


class CaseRunner:
    def __init__(self, case, args, run_id, culs_slots, references):
        self.case = case
        self.args = args
        self.run_id = run_id
        self.culs_slots = culs_slots
        self.references = references
        self.truth = ROOT / "benchmarks" / "{0}.truth".format(case)
        self.case_work = ROOT / "student" / "work" / run_id / case
        self.checkpoint_dir = self.case_work / "checkpoints"
        self.logs_dir = self.case_work / "logs"
        self.artifacts_dir = self.case_work / "artifacts"
        self.seed_work_dir = self.case_work / "seeds"
        self.history_path = self.checkpoint_dir / "history.csv"
        self.pareto_path = self.checkpoint_dir / "pareto.csv"
        self.best_path = self.checkpoint_dir / "best.csv"
        self.profile_path = self.checkpoint_dir / "case_profile.csv"
        self.summary_path = self.checkpoint_dir / "summary.csv"
        self.scheduler_path = self.checkpoint_dir / "scheduler_decisions.csv"
        self.phase_summary_path = self.checkpoint_dir / "phase_summary.csv"
        self.operator_steps_path = self.checkpoint_dir / "operator_steps.csv"
        self.near_pareto_path = self.checkpoint_dir / "near_pareto.csv"
        self.command_stats_path = self.checkpoint_dir / "command_stats.csv"
        self.lineage_path = self.checkpoint_dir / "lineage.csv"
        self.timeout_failures_path = self.checkpoint_dir / "timeout_failures.csv"
        self.rows = []
        self.scheduler_decisions = []
        self.phase_summaries = []
        self.operator_steps = []
        self.lineage_rows = []
        self.timeout_failures = []
        self.completed_tasks = set()
        self.seen_hashes = set()
        self.hash_to_row = {}
        self.culs_failure_counts = defaultdict(int)
        self.disabled_culs_commands = set()
        self.active_pool = []
        self.archive_pool = []
        self.near_pool = []
        self.global_round = 0
        self.start_time = time.time()
        self.v3_operator_library = []
        self.v3_stagnation_generations = 0

    def setup(self):
        for path in (self.checkpoint_dir, self.logs_dir, self.artifacts_dir, self.seed_work_dir):
            path.mkdir(parents=True, exist_ok=True)
        if self.args.resume and self.history_path.is_file():
            self.rows = read_csv(self.history_path)
            self.scheduler_decisions = read_csv(self.scheduler_path)
            self.phase_summaries = read_csv(self.phase_summary_path)
            self.operator_steps = read_csv(self.operator_steps_path)
            self.lineage_rows = read_csv(self.lineage_path)
            self.timeout_failures = read_csv(self.timeout_failures_path)
            self.completed_tasks = set(read_json(self.checkpoint_dir / "completed_tasks.json", []))
            self.seen_hashes = set(read_json(self.checkpoint_dir / "seen_hashes.json", []))
            self.culs_failure_counts.update(read_json(self.checkpoint_dir / "culs_failure_counts.json", {}))
            self.disabled_culs_commands = set(read_json(self.checkpoint_dir / "disabled_culs_commands.json", []))
            self.global_round = int(read_json(self.checkpoint_dir / "run_state.json", {}).get("global_round", 0))
            for row in self.rows:
                if row.get("aig_hash"):
                    self.hash_to_row.setdefault(row["aig_hash"], row)
            self.update_pools(mark_flags=False)

    def save_state(self):
        write_csv(self.history_path, self.rows, HISTORY_FIELDNAMES)
        write_csv(self.pareto_path, self.archive_pool, HISTORY_FIELDNAMES)
        write_csv(self.near_pareto_path, self.near_pool, HISTORY_FIELDNAMES)
        best = self.best_row()
        write_csv(self.best_path, [] if best is None else [best], HISTORY_FIELDNAMES)
        write_csv(self.profile_path, self.profile_rows(), PROFILE_FIELDNAMES)
        write_csv(self.summary_path, [self.summary_row()], SUMMARY_FIELDNAMES)
        write_csv(self.scheduler_path, self.scheduler_decisions, SCHEDULER_FIELDNAMES)
        write_csv(self.phase_summary_path, self.phase_summaries, PHASE_SUMMARY_FIELDNAMES)
        write_csv(self.operator_steps_path, self.operator_steps, OPERATOR_STEP_FIELDNAMES)
        write_csv(self.lineage_path, self.lineage_rows, LINEAGE_FIELDNAMES)
        write_csv(self.timeout_failures_path, self.timeout_failures, TIMEOUT_FAILURE_FIELDNAMES)
        write_csv(self.command_stats_path, self.command_stats_rows(), COMMAND_STATS_FIELDNAMES)
        write_json(self.checkpoint_dir / "seen_hashes.json", sorted(self.seen_hashes))
        write_json(self.checkpoint_dir / "completed_tasks.json", sorted(self.completed_tasks))
        write_json(self.checkpoint_dir / "culs_failure_counts.json", dict(self.culs_failure_counts))
        write_json(self.checkpoint_dir / "disabled_culs_commands.json", sorted(self.disabled_culs_commands))
        write_json(self.checkpoint_dir / "active_pool.json", [row.get("candidate_id") for row in self.active_pool])
        write_json(self.checkpoint_dir / "archive_pool.json", [row.get("candidate_id") for row in self.archive_pool])
        write_json(self.checkpoint_dir / "pareto_archive.json", [row.get("candidate_id") for row in pareto_rows(self.rows)])
        write_json(self.checkpoint_dir / "near_pareto_archive.json", [row.get("candidate_id") for row in self.near_pool])
        best = self.best_row()
        write_json(self.checkpoint_dir / "global_best.json", {} if best is None else best)
        write_json(self.checkpoint_dir / "case_profile.json", self.profile_rows())
        write_json(self.checkpoint_dir / "run_state.json", {"global_round": self.global_round, "updated_at": time.time()})

    def load_seed_rows(self):
        existing_seed_rows = [row for row in self.rows if row.get("source") == "seed"]
        if existing_seed_rows:
            return existing_seed_rows
        seeds = self.discover_seeds()
        seed_rows = []
        for seed in seeds:
            task_key = seed_key(seed)
            if task_key in self.completed_tasks:
                continue
            row = self.evaluate_seed(seed)
            self.rows.append(row)
            seed_rows.append(row)
            self.completed_tasks.add(task_key)
            if row.get("aig_hash"):
                if row["aig_hash"] in self.seen_hashes:
                    duplicate = self.hash_to_row.get(row["aig_hash"])
                    if duplicate is not None and duplicate.get("candidate_id") != row.get("candidate_id"):
                        row["duplicate_of"] = duplicate.get("candidate_id", "")
                else:
                    self.seen_hashes.add(row["aig_hash"])
                    self.hash_to_row.setdefault(row["aig_hash"], row)
            self.save_state()
        return seed_rows

    def discover_seeds(self):
        seeds = []
        current_csv = self.args.current_bundle / "results" / "best.csv"
        for row in read_csv(current_csv):
            if row.get("case") != self.case:
                continue
            seeds.append(self.seed_from_csv_row(row, "current", current_csv))
        backend_glob = self.args.backend_bundle_glob
        backend_pattern = Path(backend_glob)
        if backend_pattern.is_absolute() or "/" in backend_glob:
            if not backend_pattern.is_absolute():
                backend_pattern = ROOT / backend_pattern
            backend_bundles = sorted(backend_pattern.parent.glob(backend_pattern.name))
        else:
            backend_bundles = sorted((ROOT / "student" / "seeds" / self.args.domain).glob(backend_glob))
        alternatives = []
        for bundle in backend_bundles:
            candidate_csv = bundle / "results" / "candidates.csv"
            for row in read_csv(candidate_csv):
                if row.get("case") == self.case:
                    alternatives.append((parse_int(row.get("adp")) or 10**18, row, candidate_csv))
        alternative_limit = 4 if self.args.portfolio_version == "v3-ga" else len(alternatives)
        for index, (_adp, row, source_csv) in enumerate(sorted(alternatives, key=lambda item: (item[0], item[1].get("candidate_id", "")))[:alternative_limit], 1):
            seeds.append(self.seed_from_csv_row(row, "alt{0:02d}".format(index), source_csv))
        extra_rows = []
        for extra_csv in self.args.extra_seed_csv:
            for row in read_csv(extra_csv):
                if row.get("case") == self.case:
                    extra_rows.append((parse_int(row.get("adp")) or 10**18, row, extra_csv))
        for index, (_adp, row, source_csv) in enumerate(
            sorted(extra_rows, key=lambda item: (item[0], item[1].get("candidate_id", "")))[: self.args.max_extra_seeds_per_case],
            1,
        ):
            seeds.append(self.seed_from_csv_row(row, "extra{0:02d}".format(index), source_csv))
        return seeds

    def seed_from_csv_row(self, row, family_id, source_csv):
        aig_path = resolve_path(row.get("aig_path") or row.get("source_aig_path"))
        verilog_path = resolve_path(row.get("verilog_path") or row.get("source_verilog_path"))
        return {
            "case": self.case,
            "family_id": family_id,
            "root_family_id": family_id,
            "candidate_id": row.get("candidate_id") or "{0}_{1}".format(self.case, family_id),
            "aig_path": aig_path,
            "verilog_path": verilog_path,
            "source_csv": source_csv,
            "source_adp": parse_int(row.get("adp")),
            "notes": row.get("notes", ""),
        }

    def synthesize_missing_aig(self, seed):
        verilog = seed.get("verilog_path")
        if not verilog or not Path(verilog).is_file():
            raise RuntimeError("Seed has no usable AIG or Verilog: {0}".format(seed))
        output = self.seed_work_dir / "synthesized" / "{0}_{1}.aig".format(self.case, safe_id(seed["candidate_id"]))
        script_out = output.with_suffix(".ys")
        log_path = output.with_suffix(".yosys.log")
        module = first_module_name(verilog)
        log = synthesize_verilog(
            verilog=verilog,
            module=module,
            output=output,
            yosys=self.args.yosys,
            timeout=self.args.yosys_timeout,
            script_out=script_out,
        )
        log_path.parent.mkdir(parents=True, exist_ok=True)
        with log_path.open("w") as handle:
            handle.write(log)
        return output

    def evaluate_seed(self, seed):
        row = blank_row()
        row.update(
            {
                "case": self.case,
                "family_id": seed["family_id"],
                "root_family_id": seed.get("root_family_id", seed["family_id"]),
                "lineage": seed["family_id"],
                "parent_id": "",
                "parent_hash": "",
                "source": "seed",
                "tool": "seed",
                "tool_chain": "seed",
                "command": "seed",
                "command_expanded": "seed",
                "params_json": "{}",
                "verilog_path": rel(seed.get("verilog_path")),
                "seed_origin": rel(seed.get("source_csv")),
                "round": "0",
                "phase": "seed",
                "tier": "seed",
                "notes": seed.get("notes", ""),
            }
        )
        start = time.time()
        try:
            aig = seed.get("aig_path")
            if not aig or not Path(aig).is_file():
                aig = self.synthesize_missing_aig(seed)
                row["notes"] = (row.get("notes", "") + " synthesized missing AIG").strip()
            equivalent, cec_output = is_equivalent(self.args.abc, self.truth, aig, timeout=self.args.abc_timeout)
            row["equivalent"] = "1" if equivalent else "0"
            if equivalent:
                area, delay, adp = measure_adp(self.args.abc, aig, timeout=self.args.abc_timeout)
                row["area"] = str(area)
                row["delay"] = str(delay)
                row["adp"] = str(adp)
                digest = file_sha256(aig)
                row["aig_hash"] = digest
                stable = self.stable_aig_path("seeds", row, digest)
                shutil.copyfile(str(aig), str(stable))
                row["aig_path"] = rel(stable)
                row["candidate_id"] = stable.stem
            else:
                row["aig_path"] = rel(aig)
                row["candidate_id"] = "{0}_seed_{1}_non_equiv".format(self.case, seed["family_id"])
                row["notes"] = (row.get("notes", "") + " " + cec_output[-500:]).strip()
        except Exception as exc:
            row["equivalent"] = "0"
            row["candidate_id"] = "{0}_seed_{1}_failed".format(self.case, seed["family_id"])
            row["notes"] = "seed evaluation failed: {0}: {1}".format(type(exc).__name__, exc)
        row["runtime_sec"] = "{0:.3f}".format(time.time() - start)
        return row

    def stable_aig_path(self, subdir, row, digest):
        area = row.get("area") or "na"
        delay = row.get("delay") or "na"
        adp = row.get("adp") or "na"
        name = "{case}_r{round}_{tool}_{chain}_p{parent}_a{area}_d{delay}_adp{adp}_{hash8}.aig".format(
            case=self.case,
            round=str(row.get("round", "0")).zfill(3),
            tool=safe_id(row.get("tool", "tool"), 24),
            chain=safe_id(row.get("tool_chain", "chain"), 48),
            parent=safe_id(row.get("parent_id") or row.get("family_id") or "root", 24),
            area=area,
            delay=delay,
            adp=adp,
            hash8=digest[:8],
        )
        target = self.case_work / subdir / name
        target.parent.mkdir(parents=True, exist_ok=True)
        return target

    def run(self):
        self.setup()
        self.load_seed_rows()
        self.update_pools(mark_flags=True)
        self.save_state()
        if self.args.seed_only:
            return self.case_result()
        if self.args.portfolio_version == "v3-ga":
            return self.run_v3_ga()

        if self.args.portfolio_version == "v2":
            phases = []
            if self.args.enable_esyn:
                phases.append("esyn_seed")
            phases.append("abc_abc9")
            if not self.args.skip_mockturtle:
                phases.append("mockturtle")
                phases.append("abc_abc9")
            if not self.args.skip_culs:
                phases.append("culs")
                phases.append("abc_abc9")
        else:
            phases = ["abc_abc9"]
            if not self.args.skip_mockturtle:
                phases.append("mockturtle")
            if not self.args.skip_culs:
                phases.append("culs")

        for cycle in range(self.args.max_search_cycles):
            for phase in phases:
                no_improve_rounds = 0
                phase_start = time.time()
                round_start = self.global_round
                phase_attempts = 0
                phase_equiv = 0
                phase_new_pareto = 0
                best_before = self.best_row()
                best_adp_before = parse_int(best_before.get("adp")) if best_before else None
                for round_in_phase in range(self.args.max_rounds_per_phase):
                    if self.time_limit_reached():
                        self.save_state()
                        return self.case_result()
                    commands = commands_for_phase(phase, round_in_phase, self.args)
                    if not commands:
                        continue
                    parents = self.select_parents(phase, round_in_phase)
                    if not parents:
                        continue
                    previous_pareto_hashes = set(row.get("aig_hash") for row in pareto_rows(self.rows))
                    round_rows = self.run_round(phase, round_in_phase, parents, commands, cycle)
                    self.update_pools(mark_flags=True)
                    new_pareto_hashes = set(row.get("aig_hash") for row in pareto_rows(self.rows)) - previous_pareto_hashes
                    for row in round_rows:
                        if row.get("aig_hash") in new_pareto_hashes:
                            row["is_new_pareto"] = "1"
                    phase_attempts += len(round_rows)
                    phase_equiv += sum(1 for row in round_rows if truthy(row.get("equivalent")))
                    phase_new_pareto += sum(1 for row in round_rows if row.get("aig_hash") in new_pareto_hashes)
                    if new_pareto_hashes:
                        no_improve_rounds = 0
                    else:
                        no_improve_rounds += 1
                    self.global_round += 1
                    self.save_state()
                    if no_improve_rounds >= self.args.stagnation_rounds:
                        break
                best_after = self.best_row()
                best_adp_after = parse_int(best_after.get("adp")) if best_after else None
                self.phase_summaries.append(
                    {
                        "case": self.case,
                        "cycle": str(cycle),
                        "phase": phase,
                        "round_start": str(round_start),
                        "round_end": str(self.global_round),
                        "attempts": str(phase_attempts),
                        "equivalent_count": str(phase_equiv),
                        "new_pareto_count": str(phase_new_pareto),
                        "best_adp_before": "" if best_adp_before is None else str(best_adp_before),
                        "best_adp_after": "" if best_adp_after is None else str(best_adp_after),
                        "runtime_sec": "{0:.3f}".format(time.time() - phase_start),
                    }
                )
                self.save_state()
        if self.args.final_deepsyn_trial:
            self.run_final_deepsyn_trial()
            self.update_pools(mark_flags=True)
            self.save_state()
        self.save_best_aig()
        self.save_state()
        return self.case_result()

    def run_v3_ga(self):
        self.v3_operator_library = build_v3_operator_library(
            include_mockturtle=not self.args.skip_mockturtle,
            include_final=False,
            include_esyn=self.args.enable_esyn,
        )
        self.v3_operator_library = filter_operators_for_policy(self.v3_operator_library, self.args.v3_operator_policy)
        if self.args.enable_ttopt and self.should_run_ttopt():
            ttopt_row = self.run_ttopt_seed()
            if ttopt_row is not None:
                self.rows.append(ttopt_row)
                self.record_seen_hash(ttopt_row)
                self.update_pools(mark_flags=True)
                self.save_state()

        if self.args.enable_esyn:
            self.run_v3_esyn_seed_expansion()
            self.update_pools(mark_flags=True)
            self.save_state()

        for generation in range(self.global_round, self.args.max_generations):
            if self.time_limit_reached() or len(self.rows) >= self.args.max_history_per_case:
                break
            previous_pareto_hashes = set(row.get("aig_hash") for row in pareto_rows(self.rows))
            parents = self.select_v3_parents()
            if not parents:
                break
            tasks = self.build_v3_offspring(generation, parents)
            if not tasks:
                break

            generation_rows = []
            task_jobs = self.args.task_jobs if self.args.task_jobs is not None else self.args.jobs
            max_workers = max(1, min(task_jobs, len(tasks)))
            with ThreadPoolExecutor(max_workers=max_workers) as executor:
                future_to_task = {executor.submit(self.run_v3_sequence_task, task): task for task in tasks}
                for future in as_completed(future_to_task):
                    task = future_to_task[future]
                    try:
                        result = future.result()
                    except Exception as exc:
                        self.timeout_failures.append(
                            {
                                "case": self.case,
                                "sequence_id": task.get("sequence_id", ""),
                                "candidate_id": "",
                                "generation": str(task.get("generation", "")),
                                "parent_id": task.get("parent", {}).get("candidate_id", ""),
                                "operator_id": ",".join(task.get("op_ids", [])),
                                "status": "worker_failed",
                                "timeout_sec": "",
                                "runtime_sec": "",
                                "notes": "{0}: {1}".format(type(exc).__name__, exc),
                            }
                        )
                        self.completed_tasks.add(task.get("completed_key", ""))
                        continue
                    self.operator_steps.extend(result.get("steps", []))
                    self.timeout_failures.extend(result.get("timeout_failures", []))
                    row = result.get("row")
                    if row is None:
                        continue
                    self.rows.append(row)
                    self.completed_tasks.add(result.get("completed_key", ""))
                    self.record_seen_hash(row)
                    generation_rows.append(row)
                    self.lineage_rows.append(self.lineage_row(row))
                    if len(self.rows) >= self.args.max_history_per_case:
                        break

            self.update_pools(mark_flags=True)
            new_pareto_hashes = set(row.get("aig_hash") for row in pareto_rows(self.rows)) - previous_pareto_hashes
            for row in generation_rows:
                if row.get("aig_hash") in new_pareto_hashes:
                    row["is_new_pareto"] = "1"
            if new_pareto_hashes:
                self.v3_stagnation_generations = 0
            else:
                self.v3_stagnation_generations += 1
            self.global_round += 1
            self.save_state()

        if self.args.final_deepsyn_trial:
            self.run_final_deepsyn_trial()
            self.update_pools(mark_flags=True)
            self.save_state()
        self.save_best_aig()
        self.save_state()
        return self.case_result()

    def should_run_ttopt(self):
        if self.args.ttopt_all_cases:
            return True
        cases = set()
        for item in str(self.args.ttopt_cases or "").split(","):
            item = item.strip()
            if item:
                cases.update(parse_cases(item))
        return self.case in cases

    def run_ttopt_seed(self):
        if not self.truth.is_file():
            return None
        key = "ttopt|{0}|{1}".format(self.case, rel(self.truth))
        if key in self.completed_tasks:
            return None
        row = blank_row()
        row.update(
            {
                "case": self.case,
                "family_id": "ttopt",
                "root_family_id": "ttopt",
                "lineage": "ttopt",
                "source": "special_ttopt",
                "tool": "abc9",
                "tool_chain": "ttopt_truth_seed",
                "command": "read_truth_ttopt",
                "command_expanded": "read_truth -xf; &get; &ttopt -I <pi> -O <po>; &put; strash",
                "params_json": "{}",
                "round": str(self.global_round),
                "phase": "ttopt_seed",
                "tier": "seed",
                "generation": "0",
                "sequence_id": "{0}_ttopt_seed".format(self.case),
                "command_sequence": "ttopt",
            }
        )
        output_aig = self.case_work / "ttopt_seed" / "{0}_ttopt.aig".format(self.case)
        start = time.time()
        try:
            result = run_truth_ttopt(
                abc=self.args.abc,
                truth_path=self.truth,
                output_aig=output_aig,
                timeout=self.args.ttopt_timeout,
                pi=self.args.ttopt_pi,
                po=self.args.ttopt_po,
            )
            row["params_json"] = json.dumps({"pi": result.get("pi"), "po": result.get("po")}, sort_keys=True)
            equivalent, cec_output = is_equivalent(self.args.abc, self.truth, output_aig, timeout=self.args.abc_timeout)
            row["equivalent"] = "1" if equivalent else "0"
            row["aig_path"] = rel(output_aig)
            if equivalent:
                area, delay, adp = measure_adp(self.args.abc, output_aig, timeout=self.args.abc_timeout)
                row["area"] = str(area)
                row["delay"] = str(delay)
                row["adp"] = str(adp)
                digest = file_sha256(output_aig)
                row["aig_hash"] = digest
                stable = self.stable_aig_path("artifacts", row, digest)
                shutil.copyfile(str(output_aig), str(stable))
                row["aig_path"] = rel(stable)
                row["candidate_id"] = stable.stem
            else:
                row["candidate_id"] = "{0}_ttopt_non_equiv".format(self.case)
                row["notes"] = cec_output[-1000:] if cec_output else "ttopt CEC failed"
        except subprocess.TimeoutExpired as exc:
            row["equivalent"] = "0"
            row["candidate_id"] = "{0}_ttopt_timeout".format(self.case)
            row["notes"] = "ttopt timeout after {0}s".format(getattr(exc, "timeout", "unknown"))
            self.timeout_failures.append(
                {
                    "case": self.case,
                    "sequence_id": row["sequence_id"],
                    "candidate_id": row["candidate_id"],
                    "generation": "0",
                    "parent_id": "",
                    "operator_id": "ttopt",
                    "status": "timeout",
                    "timeout_sec": str(self.args.ttopt_timeout),
                    "runtime_sec": "{0:.3f}".format(time.time() - start),
                    "notes": row["notes"],
                }
            )
        except Exception as exc:
            row["equivalent"] = "0"
            row["candidate_id"] = "{0}_ttopt_failed".format(self.case)
            row["notes"] = "{0}: {1}".format(type(exc).__name__, exc)
        row["runtime_sec"] = "{0:.3f}".format(time.time() - start)
        self.completed_tasks.add(key)
        self.lineage_rows.append(self.lineage_row(row))
        return row

    def run_v3_esyn_seed_expansion(self):
        command_row = {
            "tool": "esyn",
            "tool_chain": "esyn_per_output_single",
            "command": "per_output_single",
            "command_expanded": "write_eqn; esyn per-output rewrite; read_eqn",
            "params_json": "{}",
            "tier": "seed",
            "_scheduler_score": 0.0,
            "_selected_reason": "optional_v3_seed_generator",
        }
        parents = [row for row in self.active_pool if is_pool_candidate(row)][: self.args.esyn_max_parents]
        for parent_index, parent in enumerate(parents):
            key = completed_key(parent.get("aig_hash"), command_row)
            if key in self.completed_tasks:
                continue
            for row in self.run_esyn_candidate_rows("esyn_seed", 0, parent_index, parent, command_row):
                row["generation"] = "0"
                row["sequence_id"] = "{0}_esyn_seed_{1:02d}".format(self.case, parent_index)
                row["command_sequence"] = "esyn_seed"
                self.rows.append(row)
                self.record_seen_hash(row)
                self.lineage_rows.append(self.lineage_row(row))
            self.completed_tasks.add(key)

    def select_v3_parents(self):
        candidates = []
        seen = set()

        def add(row):
            if not is_pool_candidate(row):
                return
            key = row.get("aig_hash") or row.get("candidate_id")
            if key in seen:
                return
            candidates.append(row)
            seen.add(key)

        add(self.best_row())
        for row in pareto_rows(self.rows):
            add(row)
        for row in self.near_pool:
            add(row)
        best_by_family = {}
        for row in self.rows:
            if not is_pool_candidate(row):
                continue
            family = root_family_id(row)
            if family not in best_by_family or candidate_sort_key(row) < candidate_sort_key(best_by_family[family]):
                best_by_family[family] = row
        for row in sorted(best_by_family.values(), key=candidate_sort_key):
            add(row)
        for row in self.active_pool:
            add(row)
        candidates.sort(key=candidate_sort_key)
        return candidates[: self.args.population_size]

    def build_v3_offspring(self, generation, parents):
        tasks = []
        planned_keys = set()
        rng = random.Random(self.args.v3_random_seed + case_sort_key(self.case) * 1009 + generation * 917)
        attempts = 0
        max_attempts = max(self.args.offspring_per_generation * 4, self.args.offspring_per_generation + 16)
        while len(tasks) < self.args.offspring_per_generation and attempts < max_attempts:
            attempts += 1
            if (attempts % 7 == 0) and self.archive_pool:
                restart_pool = [row for row in self.archive_pool if is_pool_candidate(row)]
                parent = rng.choice(restart_pool or parents)
            else:
                parent = rng.choice(parents)
            if rng.random() < 0.15:
                sequence = self.sample_v3_crossover_sequence(parent, rng)
            else:
                sequence = self.sample_v3_sequence(parent, rng)
            if not sequence:
                continue
            op_ids = [op["id"] for op in sequence]
            expanded = [op["expanded_command"] for op in sequence]
            seq_digest = hashlib.sha1(("|".join(expanded)).encode("utf-8")).hexdigest()[:10]
            sequence_id = "{0}_g{1:03d}_{2:03d}_{3}".format(self.case, generation, len(tasks), seq_digest)
            key = "v3|{0}|{1}".format(parent.get("aig_hash", ""), "|".join(expanded))
            if key in self.completed_tasks or key in planned_keys:
                continue
            planned_keys.add(key)
            tasks.append(
                {
                    "generation": generation,
                    "parent": parent,
                    "sequence": sequence,
                    "sequence_id": sequence_id,
                    "completed_key": key,
                    "op_ids": op_ids,
                    "expanded": expanded,
                }
            )
        return tasks

    def sample_v3_crossover_sequence(self, parent, rng):
        successful = [
            row
            for row in self.rows
            if truthy(row.get("equivalent")) and row.get("command_sequence") and row.get("source") == "v3_ga"
        ]
        if len(successful) < 2:
            return self.sample_v3_sequence(parent, rng)
        left = rng.choice(successful)
        right = rng.choice(successful)
        left_ids = [item for item in left.get("command_sequence", "").split(",") if item]
        right_ids = [item for item in right.get("command_sequence", "").split(",") if item]
        if not left_ids or not right_ids:
            return self.sample_v3_sequence(parent, rng)
        cut_left = rng.randint(1, len(left_ids))
        cut_right = rng.randint(0, max(0, len(right_ids) - 1))
        ids = (left_ids[:cut_left] + right_ids[cut_right:])[: self.current_v3_max_sequence_len()]
        op_by_id = dict((op["id"], op) for op in eligible_operators(self.case, parse_int(parent.get("area")), self.v3_operator_library))
        sequence = []
        for op_id in ids:
            op = op_by_id.get(op_id)
            if op is None or op.get("tool") == "esyn":
                continue
            if len(sequence) == 0 and not op.get("can_start_sequence"):
                continue
            sequence.append(expand_operator(op, rng))
        return sequence or self.sample_v3_sequence(parent, rng)

    def sample_v3_sequence(self, parent, rng):
        node_count = parse_int(parent.get("area"))
        operators = eligible_operators(self.case, node_count, self.v3_operator_library, include_final=False)
        operators = [op for op in operators if op.get("tool") != "esyn"]
        if self.args.skip_mockturtle:
            operators = [op for op in operators if op.get("tool") != "mockturtle"]
        if not operators:
            return []
        length = rng.randint(1, max(1, self.current_v3_max_sequence_len()))
        sequence = []
        for index in range(length):
            pool = self.v3_operator_pool(operators, index, rng)
            if not pool:
                pool = operators
            op = self.weighted_v3_choice(pool, rng)
            sequence.append(expand_operator(op, rng))
        return sequence

    def current_v3_max_sequence_len(self):
        if self.v3_stagnation_generations >= 2:
            return max(self.args.max_sequence_len, 6)
        return self.args.max_sequence_len

    def v3_operator_pool(self, operators, step_index, rng):
        if step_index == 0:
            operators = [op for op in operators if op.get("can_start_sequence")]
        roll = rng.random()
        if roll < 0.50:
            return sorted(operators, key=lambda op: (-self.v3_operator_score(op), -int(op.get("priority", 0))))[: max(8, self.current_v3_max_sequence_len() * 4)]
        if roll < 0.80:
            recent_ids = set(row.get("operator_id", "") for row in self.operator_steps[-self.args.recent_window :])
            stale = []
            for op in operators:
                if op["id"] not in recent_ids:
                    stale.append(op)
            return stale or operators
        perturb = [op for op in operators if op.get("risk_level") in ("gated", "stochastic")]
        return perturb or operators

    def weighted_v3_choice(self, operators, rng):
        weights = []
        for op in operators:
            score = max(1.0, float(op.get("priority", 1)) + self.v3_operator_score(op) * 10.0)
            if op.get("risk_level") in ("gated", "stochastic"):
                score *= 0.75
            weights.append(score)
        total = sum(weights)
        pick = rng.random() * total
        running = 0.0
        for op, weight in zip(operators, weights):
            running += weight
            if running >= pick:
                return op
        return operators[-1]

    def v3_operator_score(self, operator):
        steps = [row for row in self.operator_steps if row.get("operator_id") == operator["id"]]
        if not steps:
            return 1.0
        recent = steps[-self.args.recent_window :]
        score = 0.0
        for index, row in enumerate(recent):
            weight = self.args.decay_factor ** (len(recent) - index - 1)
            if row.get("status") == "ok":
                score += 1.0 * weight
            elif row.get("status") == "timeout":
                score -= 2.0 * weight
            else:
                score -= 1.0 * weight
        history_hits = [
            row
            for row in self.rows[-self.args.recent_window :]
            if operator["id"] in str(row.get("command_sequence", "")).split(",")
        ]
        for row in history_hits:
            if truthy(row.get("is_new_pareto")):
                score += 5.0
            delta = parse_int(row.get("delta_adp"))
            if delta is not None and delta < 0:
                score += min(3.0, float(-delta) / 10000.0)
        return score

    def run_v3_sequence_task(self, task):
        generation = task["generation"]
        parent = task["parent"]
        sequence = task["sequence"]
        sequence_id = task["sequence_id"]
        parent_aig = ROOT / parent["aig_path"] if not Path(parent["aig_path"]).is_absolute() else Path(parent["aig_path"])
        seq_dir = self.case_work / "v3_generation_{0:03d}".format(generation) / safe_id(sequence_id)
        seq_dir.mkdir(parents=True, exist_ok=True)
        current_aig = parent_aig
        steps = []
        failures = []
        ok_steps = 0
        notes = []
        start = time.time()

        for step_index, operator in enumerate(sequence):
            output_aig = seq_dir / "step_{0:02d}_{1}.aig".format(step_index, safe_id(operator["id"], 48))
            step_input_aig = current_aig
            step_start = time.time()
            status = "failed"
            step_notes = ""
            try:
                if operator["tool"] in ("abc", "abc9"):
                    run_abc_operator(
                        abc=self.args.abc,
                        input_aig=step_input_aig,
                        output_aig=output_aig,
                        command=operator["expanded_command"],
                        timeout=int(operator.get("timeout_sec") or self.args.abc_timeout),
                    )
                elif operator["tool"] == "mockturtle":
                    mt_flows = [item.strip() for item in operator["expanded_command"].split(",") if item.strip()]
                    if not mt_flows:
                        raise RuntimeError("empty MockTurtle flow")
                    mt_input = step_input_aig
                    for mt_index, mt_flow in enumerate(mt_flows):
                        mt_output = output_aig
                        if mt_index != len(mt_flows) - 1:
                            mt_output = output_aig.with_name(
                                "{0}.mt{1:02d}_{2}.aig".format(output_aig.stem, mt_index, safe_id(mt_flow, 24))
                            )
                        run_mockturtle(
                            input_aig=mt_input,
                            output_aig=mt_output,
                            runner=self.args.mockturtle_runner,
                            flow=mt_flow,
                            timeout=int(operator.get("timeout_sec") or self.args.mockturtle_timeout),
                            max_pis=self.args.mockturtle_max_pis,
                            max_inserts=self.args.mockturtle_max_inserts,
                        )
                        mt_input = mt_output
                elif operator["tool"] == "mixed":
                    self.run_mixed_operator(
                        input_aig=step_input_aig,
                        output_aig=output_aig,
                        expanded_command=operator["expanded_command"],
                        sequence_dir=seq_dir,
                        step_index=step_index,
                        timeout=int(operator.get("timeout_sec") or self.args.abc_timeout),
                    )
                else:
                    raise RuntimeError("Unsupported V3 operator tool: {0}".format(operator["tool"]))
                status = "ok"
                current_aig = output_aig
                ok_steps += 1
            except subprocess.TimeoutExpired as exc:
                status = "timeout"
                step_notes = "timeout after {0}s".format(getattr(exc, "timeout", operator.get("timeout_sec", "")))
            except Exception as exc:
                status = "failed"
                step_notes = "{0}: {1}".format(type(exc).__name__, exc)
            runtime = time.time() - step_start
            step_row = {
                "case": self.case,
                "sequence_id": sequence_id,
                "candidate_id": "",
                "generation": str(generation),
                "parent_id": parent.get("candidate_id", ""),
                "step_index": str(step_index),
                "operator_id": operator["id"],
                "family": operator.get("family", ""),
                "tool": operator.get("tool", ""),
                "expanded_command": operator.get("expanded_command", ""),
                "input_aig": rel(step_input_aig),
                "output_aig": rel(output_aig) if output_aig.exists() else "",
                "status": status,
                "timeout_sec": str(operator.get("timeout_sec", "")),
                "runtime_sec": "{0:.3f}".format(runtime),
                "notes": step_notes,
            }
            steps.append(step_row)
            if status != "ok":
                notes.append("{0}:{1}".format(operator["id"], step_notes))
                failures.append(
                    {
                        "case": self.case,
                        "sequence_id": sequence_id,
                        "candidate_id": "",
                        "generation": str(generation),
                        "parent_id": parent.get("candidate_id", ""),
                        "operator_id": operator["id"],
                        "status": status,
                        "timeout_sec": str(operator.get("timeout_sec", "")),
                        "runtime_sec": "{0:.3f}".format(runtime),
                        "notes": step_notes,
                    }
                )
                if not operator.get("can_follow_timeout", True):
                    break

        row = blank_row()
        op_ids = task["op_ids"]
        expanded = task["expanded"]
        row.update(
            {
                "case": self.case,
                "family_id": parent.get("family_id", ""),
                "root_family_id": root_family_id(parent),
                "lineage": "{0}>{1}".format(parent.get("lineage") or parent.get("family_id", ""), ",".join(op_ids)),
                "parent_id": parent.get("candidate_id", ""),
                "parent_hash": parent.get("aig_hash", ""),
                "source": "v3_ga",
                "tool": "v3_ga",
                "tool_chain": "v3_ga_sequence",
                "command": "v3_sequence",
                "command_expanded": " ; ".join(expanded),
                "params_json": json.dumps({"operator_ids": op_ids}, sort_keys=True),
                "seed_origin": parent.get("seed_origin", ""),
                "parent_area": parent.get("area", ""),
                "parent_delay": parent.get("delay", ""),
                "parent_adp": parent.get("adp", ""),
                "round": str(self.global_round),
                "phase": "v3_ga",
                "tier": "ga",
                "generation": str(generation),
                "sequence_id": sequence_id,
                "command_sequence": ",".join(op_ids),
                "hybrid_source": "",
                "cone_substitution_source": "",
                "pareto_gap_tag": "",
                "post_pareto_stage": "",
                "frontier_region": "",
            }
        )
        try:
            if ok_steps == 0:
                raise RuntimeError("all operators failed")
            equivalent, cec_output = is_equivalent(self.args.abc, self.truth, current_aig, timeout=self.args.abc_timeout)
            row["equivalent"] = "1" if equivalent else "0"
            row["aig_path"] = rel(current_aig)
            if equivalent:
                area, delay, adp = measure_adp(self.args.abc, current_aig, timeout=self.args.abc_timeout)
                row["area"] = str(area)
                row["delay"] = str(delay)
                row["adp"] = str(adp)
                row["delta_area"] = int_str_delta(parent.get("area"), area)
                row["delta_delay"] = int_str_delta(parent.get("delay"), delay)
                row["delta_adp"] = int_str_delta(parent.get("adp"), adp)
                digest = file_sha256(current_aig)
                row["aig_hash"] = digest
                stable = self.stable_aig_path("artifacts", row, digest)
                shutil.copyfile(str(current_aig), str(stable))
                row["aig_path"] = rel(stable)
                row["candidate_id"] = stable.stem
            else:
                row["candidate_id"] = "{0}_{1}_non_equiv".format(self.case, safe_id(sequence_id))
                notes.append(cec_output[-1000:] if cec_output else "CEC failed")
        except subprocess.TimeoutExpired as exc:
            row["equivalent"] = "0"
            row["candidate_id"] = "{0}_{1}_eval_timeout".format(self.case, safe_id(sequence_id))
            notes.append("evaluation timeout after {0}s".format(getattr(exc, "timeout", "unknown")))
        except Exception as exc:
            row["equivalent"] = "0"
            row["candidate_id"] = "{0}_{1}_failed".format(self.case, safe_id(sequence_id))
            notes.append("{0}: {1}".format(type(exc).__name__, exc))
        row["runtime_sec"] = "{0:.3f}".format(time.time() - start)
        row["notes"] = " | ".join(item for item in notes if item)
        for step in steps:
            step["candidate_id"] = row.get("candidate_id", "")
        for failure in failures:
            failure["candidate_id"] = row.get("candidate_id", "")
        return {
            "row": row,
            "steps": steps,
            "timeout_failures": failures,
            "completed_key": task["completed_key"],
        }

    def run_mixed_operator(self, input_aig, output_aig, expanded_command, sequence_dir, step_index, timeout):
        segments = [item.strip() for item in expanded_command.split("||") if item.strip()]
        if not segments:
            raise RuntimeError("empty mixed operator")
        current = input_aig
        for segment_index, segment in enumerate(segments):
            is_last = segment_index == len(segments) - 1
            target = output_aig if is_last else sequence_dir / "step_{0:02d}_mixed_{1:02d}.aig".format(step_index, segment_index)
            if segment.startswith("ABC9:"):
                command = "strash; &get; {0}; &put; strash".format(segment[len("ABC9:") :].strip())
                run_abc_operator(self.args.abc, current, target, command, timeout=timeout)
            elif segment.startswith("ABC:"):
                command = "strash; {0}; strash".format(segment[len("ABC:") :].strip())
                run_abc_operator(self.args.abc, current, target, command, timeout=timeout)
            elif segment.startswith("MT:"):
                mt_flows = [item.strip() for item in segment[len("MT:") :].split(",") if item.strip()]
                if not mt_flows:
                    raise RuntimeError("empty mixed MockTurtle segment")
                mt_input = current
                for mt_index, mt_flow in enumerate(mt_flows):
                    mt_last = mt_index == len(mt_flows) - 1
                    mt_target = target if mt_last else sequence_dir / "step_{0:02d}_mixed_{1:02d}_mt_{2:02d}.aig".format(
                        step_index,
                        segment_index,
                        mt_index,
                    )
                    run_mockturtle(
                        input_aig=mt_input,
                        output_aig=mt_target,
                        runner=self.args.mockturtle_runner,
                        flow=mt_flow,
                        timeout=timeout,
                        max_pis=self.args.mockturtle_max_pis,
                        max_inserts=self.args.mockturtle_max_inserts,
                    )
                    mt_input = mt_target
            else:
                raise RuntimeError("unknown mixed operator segment: {0}".format(segment))
            current = target

    def record_seen_hash(self, row):
        if not row or not row.get("aig_hash"):
            return
        if row["aig_hash"] in self.seen_hashes:
            duplicate = self.hash_to_row.get(row["aig_hash"])
            if duplicate is not None and duplicate.get("candidate_id") != row.get("candidate_id"):
                row["duplicate_of"] = duplicate.get("candidate_id", "")
        else:
            self.seen_hashes.add(row["aig_hash"])
            self.hash_to_row[row["aig_hash"]] = row

    def lineage_row(self, row):
        return {
            "case": self.case,
            "candidate_id": row.get("candidate_id", ""),
            "parent_id": row.get("parent_id", ""),
            "parent_hash": row.get("parent_hash", ""),
            "generation": row.get("generation", ""),
            "sequence_id": row.get("sequence_id", ""),
            "command_sequence": row.get("command_sequence", ""),
            "source": row.get("source", ""),
            "aig_hash": row.get("aig_hash", ""),
            "area": row.get("area", ""),
            "delay": row.get("delay", ""),
            "adp": row.get("adp", ""),
            "hybrid_source": row.get("hybrid_source", ""),
            "cone_substitution_source": row.get("cone_substitution_source", ""),
            "pareto_gap_tag": row.get("pareto_gap_tag", ""),
            "post_pareto_stage": row.get("post_pareto_stage", ""),
            "frontier_region": row.get("frontier_region", ""),
        }

    def time_limit_reached(self):
        if self.args.per_case_runtime_soft_limit <= 0:
            return False
        return (time.time() - self.start_time) >= self.args.per_case_runtime_soft_limit

    def select_parents(self, phase, round_in_phase):
        has_abc_attempts = any(row.get("source") in ("abc", "abc9") for row in self.rows)
        if phase == "abc_abc9" and round_in_phase == 0 and not has_abc_attempts:
            parents = [row for row in self.rows if row.get("source") == "seed" and is_pool_candidate(row)]
        else:
            parents = [row for row in self.active_pool if is_pool_candidate(row)]
            if not parents:
                parents = [row for row in self.archive_pool if is_pool_candidate(row)]
        parents.sort(key=candidate_sort_key)
        if phase == "esyn_seed":
            return parents[: self.args.esyn_max_parents]
        return parents[: self.args.max_parents_per_round]

    def run_round(self, phase, round_in_phase, parents, commands, cycle):
        round_rows = []
        for parent_index, parent in enumerate(parents):
            parent_commands = self.select_commands_for_parent(phase, parent_index, parent, commands)
            for command_row in parent_commands:
                if len(self.rows) >= self.args.max_history_per_case:
                    return round_rows
                key = completed_key(parent.get("aig_hash"), command_row)
                if key in self.completed_tasks:
                    continue
                self.scheduler_decisions.append(
                    {
                        "case": self.case,
                        "round": str(self.global_round),
                        "phase": phase,
                        "cycle": str(cycle),
                        "parent_id": parent.get("candidate_id", ""),
                        "parent_hash": parent.get("aig_hash", ""),
                        "tool": command_row.get("tool", ""),
                        "tool_chain": command_row.get("tool_chain", ""),
                        "command": command_row.get("command", ""),
                        "params_json": command_row.get("params_json", "{}"),
                        "scheduler_score": "{0:.3f}".format(float(command_row.get("_scheduler_score", 0.0))),
                        "selected_reason": command_row.get("_selected_reason", ""),
                    }
                )
                if command_row["tool"] == "esyn":
                    produced_rows = self.run_esyn_candidate_rows(phase, round_in_phase, parent_index, parent, command_row)
                else:
                    produced_rows = [self.run_command_candidate(phase, round_in_phase, parent_index, parent, command_row)]
                for row in produced_rows:
                    self.rows.append(row)
                    round_rows.append(row)
                    if row.get("aig_hash"):
                        if row["aig_hash"] in self.seen_hashes:
                            duplicate = self.hash_to_row.get(row["aig_hash"])
                            if duplicate is not None and duplicate.get("candidate_id") != row.get("candidate_id"):
                                row["duplicate_of"] = duplicate.get("candidate_id", "")
                        else:
                            self.seen_hashes.add(row["aig_hash"])
                            self.hash_to_row[row["aig_hash"]] = row
                self.completed_tasks.add(key)
                self.save_state()
        return round_rows

    def select_commands_for_parent(self, phase, parent_index, parent, commands):
        selected = []
        for command in commands:
            row = dict(command)
            if row["tool"] == "culs" and row["command"] in self.disabled_culs_commands:
                continue
            row["_scheduler_score"] = self.command_score(row)
            row["_selected_reason"] = self.selection_reason(row)
            selected.append(row)

        if self.args.portfolio_version != "v2" or self.args.max_commands_per_round <= 0:
            return selected
        if len(selected) <= self.args.max_commands_per_round:
            return selected

        explore_count = max(1, int(round(self.args.max_commands_per_round * self.args.exploration_fraction)))
        exploit_count = max(0, self.args.max_commands_per_round - explore_count)
        explore = [row for row in selected if self.command_attempt_count(row) == 0]
        if len(explore) < explore_count:
            stale = [row for row in selected if row not in explore and self.command_recent_count(row) == 0]
            explore.extend(stale)
        explore = explore[:explore_count]
        explore_keys = set(completed_key("explore", row) for row in explore)
        exploit = [
            row
            for row in sorted(selected, key=lambda item: (-float(item.get("_scheduler_score", 0.0)), item.get("tool_chain", "")))
            if completed_key("explore", row) not in explore_keys
        ][:exploit_count]
        return exploit + explore

    def command_rows(self, command_row):
        return [
            row
            for row in self.rows
            if row.get("tool") == command_row.get("tool")
            and row.get("tool_chain") == command_row.get("tool_chain")
            and row.get("command") == command_row.get("command")
        ]

    def command_attempt_count(self, command_row):
        return len(self.command_rows(command_row))

    def command_recent_count(self, command_row):
        return len(self.command_rows(command_row)[-self.args.recent_window :])

    def command_score(self, command_row):
        rows = self.command_rows(command_row)
        if not rows:
            return 1.0
        recent = rows[-self.args.recent_window :]
        score = 0.1
        for index, row in enumerate(recent):
            weight = self.args.decay_factor ** (len(recent) - index - 1)
            if truthy(row.get("is_new_pareto")):
                score += 8.0 * weight
            delta_adp = parse_int(row.get("delta_adp"))
            if delta_adp is not None and delta_adp < 0:
                score += min(5.0, float(-delta_adp) / 10000.0) * weight
            if not truthy(row.get("equivalent")):
                score -= 1.5 * weight
            if "timeout" in row.get("notes", "").lower():
                score -= 2.0 * weight
        return max(-10.0, score)

    def selection_reason(self, command_row):
        attempts = self.command_attempt_count(command_row)
        if attempts == 0:
            return "explore_never_tried"
        if self.command_recent_count(command_row) == 0:
            return "explore_stale"
        return "profile_score"

    def final_deepsyn_command_row(self):
        deepsyn_timeout = self.args.final_deepsyn_timeout
        if self.args.final_deepsyn_grace_sec > 0 and deepsyn_timeout > self.args.final_deepsyn_grace_sec:
            deepsyn_timeout = deepsyn_timeout - self.args.final_deepsyn_grace_sec
        command = FINAL_DEEPSYN_COMMAND.format(
            timeout=deepsyn_timeout,
            area_limit=self.args.final_deepsyn_area_limit,
        )
        return {
            "tool": "abc9",
            "tool_chain": "abc9_final_deepsyn",
            "phase": "final_deepsyn",
            "tier": "final",
            "command": "final_deepsyn",
            "command_expanded": command,
            "params_json": json.dumps(
                {
                    "area_limit": self.args.final_deepsyn_area_limit,
                    "timeout": self.args.final_deepsyn_timeout,
                    "deepsyn_timeout": deepsyn_timeout,
                    "grace_sec": self.args.final_deepsyn_grace_sec,
                    "only_best_row": True,
                },
                sort_keys=True,
            ),
            "_scheduler_score": 0.0,
            "_selected_reason": "final_best_trial",
        }

    def run_final_deepsyn_trial(self):
        parent = self.best_row()
        command_row = self.final_deepsyn_command_row()
        if parent is None:
            return
        key = completed_key(parent.get("aig_hash"), command_row)
        if key in self.completed_tasks:
            return

        parent_area = parse_int(parent.get("area"))
        if (
            self.args.final_deepsyn_area_limit > 0
            and parent_area is not None
            and parent_area >= self.args.final_deepsyn_area_limit
        ):
            row = blank_row()
            row.update(self.command_base_row("final_deepsyn", parent, command_row))
            row["equivalent"] = "0"
            row["candidate_id"] = "{0}_r{1:03d}_abc9_final_deepsyn_skipped".format(self.case, self.global_round)
            row["notes"] = "skipped final deepsyn: parent area {0} >= limit {1}".format(
                parent_area,
                self.args.final_deepsyn_area_limit,
            )
            self.rows.append(row)
            self.completed_tasks.add(key)
            return

        row = self.run_command_candidate("final_deepsyn", 0, 0, parent, command_row)
        self.rows.append(row)
        self.completed_tasks.add(key)
        if row.get("aig_hash"):
            if row["aig_hash"] in self.seen_hashes:
                duplicate = self.hash_to_row.get(row["aig_hash"])
                if duplicate is not None and duplicate.get("candidate_id") != row.get("candidate_id"):
                    row["duplicate_of"] = duplicate.get("candidate_id", "")
            else:
                self.seen_hashes.add(row["aig_hash"])
                self.hash_to_row[row["aig_hash"]] = row

    def run_esyn_candidate_rows(self, phase, round_in_phase, parent_index, parent, command_row):
        parent_aig = ROOT / parent["aig_path"] if not Path(parent["aig_path"]).is_absolute() else Path(parent["aig_path"])
        output_dir = self.case_work / "round_{0:03d}_{1}".format(self.global_round, phase) / safe_id(command_row["tool_chain"])
        eqn_path = output_dir / "{0}_{1}_p{2:03d}.eqn".format(self.case, safe_id(command_row["tool_chain"]), parent_index)
        start = time.time()
        base = self.command_base_row(phase, parent, command_row)
        try:
            write_aig_to_eqn(parent_aig, eqn_path, abc=self.args.abc, timeout=self.args.esyn_synth_timeout)
            candidates = esyn_seed_candidates_from_eqn(
                eqn_path=eqn_path,
                truth=self.truth,
                abc=self.args.abc,
                work_dir=output_dir,
                case=self.case,
                parent_id=parent.get("candidate_id", ""),
                top_n=self.args.esyn_top_n,
                timeout=self.args.esyn_timeout,
                synth_timeout=self.args.esyn_synth_timeout,
                eval_timeout=self.args.esyn_eval_timeout,
                max_outputs=self.args.esyn_max_outputs,
            )
        except (EsynContractError, EsynError, subprocess.TimeoutExpired, RuntimeError, OSError) as exc:
            row = blank_row()
            row.update(base)
            row["equivalent"] = "0"
            row["candidate_id"] = "{0}_r{1:03d}_{2}_failed".format(self.case, self.global_round, safe_id(command_row["tool_chain"]))
            row["runtime_sec"] = "{0:.3f}".format(time.time() - start)
            row["notes"] = "{0}: {1}".format(type(exc).__name__, exc)
            return [row]

        rows = []
        for candidate in candidates:
            row = blank_row()
            row.update(base)
            row["candidate_id"] = candidate.candidate_id
            row["aig_path"] = rel(candidate.aig_path)
            row["area"] = "" if candidate.area is None else str(candidate.area)
            row["delay"] = "" if candidate.delay is None else str(candidate.delay)
            row["adp"] = "" if candidate.adp is None else str(candidate.adp)
            row["equivalent"] = "1" if candidate.equivalent else "0"
            row["runtime_sec"] = "{0:.3f}".format(candidate.runtime_sec)
            row["notes"] = candidate.notes
            row["delta_area"] = int_str_delta(parent.get("area"), candidate.area)
            row["delta_delay"] = int_str_delta(parent.get("delay"), candidate.delay)
            row["delta_adp"] = int_str_delta(parent.get("adp"), candidate.adp)
            output_match = re.search(r"output=([^ ]+)", candidate.notes or "")
            if output_match:
                row["esyn_output"] = output_match.group(1)
            rank_match = re.search(r"_r(\d+)$", candidate.candidate_id)
            if rank_match:
                row["esyn_rewrite_rank"] = rank_match.group(1)
            if candidate.equivalent and Path(candidate.aig_path).is_file():
                digest = file_sha256(candidate.aig_path)
                row["aig_hash"] = digest
                stable = self.stable_aig_path("artifacts", row, digest)
                shutil.copyfile(str(candidate.aig_path), str(stable))
                row["aig_path"] = rel(stable)
                row["candidate_id"] = stable.stem
            rows.append(row)
        return rows

    def command_base_row(self, phase, parent, command_row):
        return {
            "case": self.case,
            "family_id": parent.get("family_id", ""),
            "root_family_id": root_family_id(parent),
            "lineage": "{0}>{1}".format(parent.get("lineage") or parent.get("family_id", ""), command_row["tool_chain"]),
            "parent_id": parent.get("candidate_id", ""),
            "parent_hash": parent.get("aig_hash", ""),
            "source": command_row["tool"],
            "tool": command_row["tool"],
            "tool_chain": command_row["tool_chain"],
            "command": command_row["command"],
            "command_expanded": command_row["command_expanded"],
            "params_json": command_row.get("params_json", "{}"),
            "seed_origin": parent.get("seed_origin", ""),
            "parent_area": parent.get("area", ""),
            "parent_delay": parent.get("delay", ""),
            "parent_adp": parent.get("adp", ""),
            "round": str(self.global_round),
            "phase": phase,
            "tier": command_row.get("tier", ""),
            "scheduler_score": "{0:.3f}".format(float(command_row.get("_scheduler_score", 0.0))),
            "selected_reason": command_row.get("_selected_reason", ""),
        }

    def run_command_candidate(self, phase, round_in_phase, parent_index, parent, command_row):
        row = blank_row()
        row.update(self.command_base_row(phase, parent, command_row))
        parent_aig = ROOT / parent["aig_path"] if not Path(parent["aig_path"]).is_absolute() else Path(parent["aig_path"])
        output_dir = self.case_work / "round_{0:03d}_{1}".format(self.global_round, phase) / safe_id(command_row["tool_chain"])
        output_aig = output_dir / "{0}_{1}_p{2:03d}.aig".format(self.case, safe_id(command_row["tool_chain"]), parent_index)
        log_path = self.logs_dir / "round_{0:03d}_{1}_{2}_p{3:03d}.log".format(
            self.global_round,
            safe_id(command_row["tool"]),
            safe_id(command_row["tool_chain"]),
            parent_index,
        )
        start = time.time()
        try:
            if command_row["tool"] in ("abc", "abc9"):
                log = run_aig_flow(
                    abc=self.args.abc,
                    input_aig=parent_aig,
                    output_aig=output_aig,
                    commands=command_row["command_expanded"],
                    timeout=self.command_timeout(command_row),
                )
            elif command_row["tool"] == "mockturtle":
                log = run_mockturtle(
                    input_aig=parent_aig,
                    output_aig=output_aig,
                    runner=self.args.mockturtle_runner,
                    flow=command_row["command"],
                    timeout=self.args.mockturtle_timeout,
                    max_pis=self.args.mockturtle_max_pis,
                    max_inserts=self.args.mockturtle_max_inserts,
                )
            elif command_row["tool"] == "culs":
                log = self.run_culs(parent_aig, output_aig, command_row)
            else:
                raise RuntimeError("Unknown tool: {0}".format(command_row["tool"]))
            log_path.parent.mkdir(parents=True, exist_ok=True)
            with log_path.open("w") as handle:
                handle.write(log or "")
            equivalent, cec_output = is_equivalent(self.args.abc, self.truth, output_aig, timeout=self.args.abc_timeout)
            row["equivalent"] = "1" if equivalent else "0"
            row["aig_path"] = rel(output_aig)
            if equivalent:
                area, delay, adp = measure_adp(self.args.abc, output_aig, timeout=self.args.abc_timeout)
                row["area"] = str(area)
                row["delay"] = str(delay)
                row["adp"] = str(adp)
                row["delta_area"] = int_str_delta(parent.get("area"), area)
                row["delta_delay"] = int_str_delta(parent.get("delay"), delay)
                row["delta_adp"] = int_str_delta(parent.get("adp"), adp)
                digest = file_sha256(output_aig)
                row["aig_hash"] = digest
                stable = self.stable_aig_path("artifacts", row, digest)
                shutil.copyfile(str(output_aig), str(stable))
                row["aig_path"] = rel(stable)
                row["candidate_id"] = stable.stem
            else:
                row["candidate_id"] = "{0}_r{1:03d}_{2}_non_equiv".format(
                    self.case,
                    self.global_round,
                    safe_id(command_row["tool_chain"]),
                )
                row["notes"] = cec_output[-1000:] if cec_output else "CEC failed"
        except subprocess.TimeoutExpired as exc:
            row["equivalent"] = "0"
            row["candidate_id"] = "{0}_r{1:03d}_{2}_timeout".format(self.case, self.global_round, safe_id(command_row["tool_chain"]))
            row["notes"] = "timeout after {0}s".format(getattr(exc, "timeout", "unknown"))
            if output_aig.is_file():
                try:
                    equivalent, cec_output = is_equivalent(self.args.abc, self.truth, output_aig, timeout=self.args.abc_timeout)
                    row["equivalent"] = "1" if equivalent else "0"
                    row["aig_path"] = rel(output_aig)
                    if equivalent:
                        area, delay, adp = measure_adp(self.args.abc, output_aig, timeout=self.args.abc_timeout)
                        row["area"] = str(area)
                        row["delay"] = str(delay)
                        row["adp"] = str(adp)
                        row["delta_area"] = int_str_delta(parent.get("area"), area)
                        row["delta_delay"] = int_str_delta(parent.get("delay"), delay)
                        row["delta_adp"] = int_str_delta(parent.get("adp"), adp)
                        digest = file_sha256(output_aig)
                        row["aig_hash"] = digest
                        stable = self.stable_aig_path("artifacts", row, digest)
                        shutil.copyfile(str(output_aig), str(stable))
                        row["aig_path"] = rel(stable)
                        row["candidate_id"] = stable.stem
                        row["notes"] = "process timeout after {0}s, but output AIG existed and passed CEC".format(
                            getattr(exc, "timeout", "unknown")
                        )
                    else:
                        row["notes"] = "timeout after {0}s; output AIG existed but CEC failed: {1}".format(
                            getattr(exc, "timeout", "unknown"),
                            (cec_output or "")[-500:],
                        )
                except Exception as recover_exc:
                    row["notes"] = "timeout after {0}s; output recovery failed: {1}: {2}".format(
                        getattr(exc, "timeout", "unknown"),
                        type(recover_exc).__name__,
                        recover_exc,
                    )
            self.note_command_failure(command_row)
        except Exception as exc:
            row["equivalent"] = "0"
            row["candidate_id"] = "{0}_r{1:03d}_{2}_failed".format(self.case, self.global_round, safe_id(command_row["tool_chain"]))
            row["notes"] = "{0}: {1}".format(type(exc).__name__, exc)
            self.note_command_failure(command_row)
        row["runtime_sec"] = "{0:.3f}".format(time.time() - start)
        return row

    def command_timeout(self, command_row):
        if command_row.get("command") == "final_deepsyn":
            return self.args.final_deepsyn_timeout
        return self.args.abc_timeout

    def note_command_failure(self, command_row):
        if command_row.get("tool") != "culs":
            return
        command = command_row.get("command", "")
        self.culs_failure_counts[command] += 1
        if self.culs_failure_counts[command] >= self.args.culs_disable_after_failures:
            self.disabled_culs_commands.add(command)

    def run_culs(self, input_aig, output_aig, command_row):
        culs_bin = Path(self.args.culs_bin)
        if not culs_bin.is_file():
            raise RuntimeError("CULS gpuls executable not found: {0}".format(culs_bin))
        command = CULS_FLOW_COMMANDS.get(command_row["command"], CULS_FLOW_COMMANDS.get(command_row["tool_chain"]))
        if command is None:
            raise RuntimeError("Unknown CULS command: {0}".format(command_row["command"]))
        slot = self.culs_slots.get()
        try:
            env = os.environ.copy()
            if slot is not None:
                env["CUDA_VISIBLE_DEVICES"] = str(slot)
            output_aig = Path(output_aig)
            output_aig.parent.mkdir(parents=True, exist_ok=True)
            if output_aig.exists():
                output_aig.unlink()
            script = "read {0}; {1}; write {2}".format(input_aig, command, output_aig)
            result = subprocess.run(
                [str(culs_bin), "-c", script],
                stdout=subprocess.PIPE,
                stderr=subprocess.STDOUT,
                universal_newlines=True,
                timeout=self.args.culs_timeout,
                env=env,
            )
            if result.returncode != 0:
                raise RuntimeError("CULS failed with return code {0}: {1}".format(result.returncode, result.stdout[-2000:]))
            if not output_aig.is_file() or output_aig.stat().st_size == 0:
                raise RuntimeError("CULS did not create a non-empty output: {0}".format(output_aig))
            return result.stdout
        finally:
            self.culs_slots.put(slot)

    def update_pools(self, mark_flags=True):
        pareto = pareto_rows(self.rows)
        near = near_pareto_rows(self.rows, pareto, self.args.max_near_pareto_points)
        active = select_active(pareto, near, self.args.max_active_search_points)
        archive = (pareto + near)[: self.args.max_archive_pareto_points]
        self.active_pool = active
        self.archive_pool = archive
        self.near_pool = near
        if mark_flags:
            pareto_ids = set(row.get("candidate_id") for row in pareto)
            near_ids = set(row.get("candidate_id") for row in near)
            active_ids = set(row.get("candidate_id") for row in active)
            for row in self.rows:
                row["is_pareto"] = "1" if row.get("candidate_id") in pareto_ids else "0"
                row["is_near_pareto"] = "1" if row.get("candidate_id") in near_ids else "0"
                row["is_active"] = "1" if row.get("candidate_id") in active_ids else "0"

    def best_row(self):
        valid = [row for row in self.rows if is_pool_candidate(row)]
        if not valid:
            return None
        return min(valid, key=candidate_sort_key)

    def pre_backend_best_row(self):
        valid = [
            row
            for row in self.rows
            if row.get("source") == "seed" and not row.get("family_id", "").startswith("extra") and is_pool_candidate(row)
        ]
        if not valid:
            return None
        return min(valid, key=candidate_sort_key)

    def pre_backend_current_row(self):
        valid = [
            row
            for row in self.rows
            if row.get("source") == "seed" and row.get("family_id") == "current" and is_pool_candidate(row)
        ]
        if not valid:
            return None
        return min(valid, key=candidate_sort_key)

    def v2_best_adp_for_case(self):
        path = getattr(self.args, "v2_summary_csv", None)
        if not path:
            return None
        for row in read_csv(path):
            if row.get("case") == self.case:
                return parse_int(row.get("best_adp") or row.get("v2_best_adp") or row.get("adp"))
        return None

    def final_deepsyn_row(self):
        rows = [row for row in self.rows if row.get("command") == "final_deepsyn" or row.get("tool_chain") == "abc9_final_deepsyn"]
        if not rows:
            return None
        return rows[-1]

    def save_best_aig(self):
        best = self.best_row()
        if best is None or not best.get("aig_path"):
            return
        source = ROOT / best["aig_path"] if not Path(best["aig_path"]).is_absolute() else Path(best["aig_path"])
        target = ROOT / "student" / "work" / "best" / "{0}_{1}.aig".format(self.run_id, self.case)
        target.parent.mkdir(parents=True, exist_ok=True)
        if source.is_file():
            shutil.copyfile(str(source), str(target))

    def profile_rows(self):
        grouped = OrderedDict()
        for row in self.rows:
            key = (
                row.get("case", ""),
                row.get("family_id", ""),
                row.get("tool", ""),
                row.get("tool_chain", ""),
                row.get("command", ""),
                row.get("params_json", "{}"),
            )
            if key not in grouped:
                grouped[key] = []
            grouped[key].append(row)
        profile = []
        for key, rows in grouped.items():
            recent = rows[-self.args.recent_window :]
            equivalent_count = sum(1 for row in rows if truthy(row.get("equivalent")))
            new_pareto_count = sum(1 for row in rows if truthy(row.get("is_new_pareto")))
            timeout_count = sum(1 for row in rows if "timeout" in row.get("notes", "").lower() or row.get("candidate_id", "").endswith("_timeout"))
            failure_count = sum(1 for row in rows if not truthy(row.get("equivalent")))
            profile.append(
                {
                    "case": key[0],
                    "family_id": key[1],
                    "tool": key[2],
                    "tool_chain": key[3],
                    "command": key[4],
                    "params_json": key[5],
                    "attempts": str(len(rows)),
                    "equivalent_count": str(equivalent_count),
                    "new_pareto_count": str(new_pareto_count),
                    "timeout_count": str(timeout_count),
                    "failure_count": str(failure_count),
                    "best_delta_adp": min_numeric(rows, "delta_adp"),
                    "best_delta_area": min_numeric(rows, "delta_area"),
                    "best_delta_delay": min_numeric(rows, "delta_delay"),
                    "recent_attempts": str(len(recent)),
                    "recent_new_pareto_count": str(sum(1 for row in recent if truthy(row.get("is_new_pareto")))),
                    "recent_success_rate": "{0:.3f}".format(
                        float(sum(1 for row in recent if truthy(row.get("is_new_pareto")))) / float(len(recent))
                        if recent
                        else 0.0
                    ),
                }
            )
        return profile

    def command_stats_rows(self):
        operators = self.v3_operator_library
        if not operators and self.args.portfolio_version == "v3-ga":
            operators = build_v3_operator_library(
                include_mockturtle=not self.args.skip_mockturtle,
                include_final=False,
                include_esyn=self.args.enable_esyn,
            )
            operators = filter_operators_for_policy(operators, self.args.v3_operator_policy)
        op_by_id = OrderedDict((op["id"], op) for op in operators)
        for step in self.operator_steps:
            op_id = step.get("operator_id", "")
            if op_id and op_id not in op_by_id:
                op_by_id[op_id] = {"id": op_id, "family": step.get("family", ""), "priority": 0}
        stats = []
        for op_id, operator in op_by_id.items():
            steps = [row for row in self.operator_steps if row.get("operator_id") == op_id]
            final_rows = [row for row in self.rows if op_id in str(row.get("command_sequence", "")).split(",")]
            deltas = [parse_int(row.get("delta_adp")) for row in final_rows if parse_int(row.get("delta_adp")) is not None]
            stats.append(
                {
                    "case": self.case,
                    "operator_id": op_id,
                    "family": operator.get("family", ""),
                    "attempts": str(len(steps)),
                    "equivalent_count": str(sum(1 for row in final_rows if truthy(row.get("equivalent")))),
                    "timeout_count": str(sum(1 for row in steps if row.get("status") == "timeout")),
                    "failed_count": str(sum(1 for row in steps if row.get("status") not in ("ok", "timeout"))),
                    "new_pareto_count": str(sum(1 for row in final_rows if truthy(row.get("is_new_pareto")))),
                    "best_delta_adp": "" if not deltas else str(min(deltas)),
                    "recent_success_score": "{0:.3f}".format(self.v3_operator_score(operator) if steps else 0.0),
                }
            )
        return sorted(stats, key=lambda row: (case_sort_key(row.get("case", "")), row.get("family", ""), row.get("operator_id", "")))

    def summary_row(self):
        best = self.best_row()
        pre_backend = self.pre_backend_best_row()
        pre_current = self.pre_backend_current_row()
        final_deepsyn = self.final_deepsyn_row()
        ref = reference_summary_for_case(self.case, self.references)
        best_adp = parse_int(best.get("adp")) if best else None
        pre_adp = parse_int(pre_backend.get("adp")) if pre_backend else None
        current_adp = parse_int(pre_current.get("adp")) if pre_current else None
        v2_adp = self.v2_best_adp_for_case()
        ref_adp = ref.get("adp")
        ratio = ""
        if best_adp is not None and ref_adp:
            ratio = "{0:.6f}".format(float(best_adp) / float(ref_adp))
        pre_ratio = ""
        improvement_pct = ""
        delta_pre = ""
        improves_pre = "0"
        if best_adp is not None and pre_adp:
            delta_pre = str(best_adp - pre_adp)
            pre_ratio = "{0:.6f}".format(float(best_adp) / float(pre_adp))
            improvement_pct = "{0:.3f}".format((float(pre_adp - best_adp) / float(pre_adp)) * 100.0)
            improves_pre = "1" if best_adp < pre_adp else "0"
        final_deepsyn_status = "disabled"
        final_deepsyn_improved = "0"
        final_deepsyn_notes = ""
        if self.args.final_deepsyn_trial:
            final_deepsyn_status = "not_run"
        if final_deepsyn is not None:
            final_deepsyn_notes = final_deepsyn.get("notes", "")
            if "skipped final deepsyn" in final_deepsyn_notes:
                final_deepsyn_status = "skipped"
            elif truthy(final_deepsyn.get("equivalent")):
                final_deepsyn_status = "equivalent"
                delta_final = parse_int(final_deepsyn.get("delta_adp"))
                if delta_final is not None and delta_final < 0:
                    final_deepsyn_status = "improved"
                    final_deepsyn_improved = "1"
            elif "timeout" in final_deepsyn.get("candidate_id", "") or "timeout" in final_deepsyn_notes.lower():
                final_deepsyn_status = "timeout"
            else:
                final_deepsyn_status = "failed"
        delta_current = ""
        if best_adp is not None and current_adp is not None:
            delta_current = str(best_adp - current_adp)
        delta_v2 = ""
        if best_adp is not None and v2_adp is not None:
            delta_v2 = str(best_adp - v2_adp)
        best_sequence = "" if best is None else best.get("command_sequence", "")
        best_lineage = "" if best is None else best.get("lineage", "")
        return {
            "case": self.case,
            "pre_backend_current_adp": "" if current_adp is None else str(current_adp),
            "pre_backend_best_candidate_adp": "" if pre_adp is None else str(pre_adp),
            "v2_best_adp": "" if v2_adp is None else str(v2_adp),
            "v3_best_adp": "" if self.args.portfolio_version != "v3-ga" or best_adp is None else str(best_adp),
            "pre_backend_best_candidate_id": "" if pre_backend is None else pre_backend.get("candidate_id", ""),
            "pre_backend_best_aig_path": "" if pre_backend is None else pre_backend.get("aig_path", ""),
            "pre_backend_area": "" if pre_backend is None else pre_backend.get("area", ""),
            "pre_backend_delay": "" if pre_backend is None else pre_backend.get("delay", ""),
            "pre_backend_adp": "" if pre_backend is None else pre_backend.get("adp", ""),
            "best_candidate_id": "" if best is None else best.get("candidate_id", ""),
            "best_aig_path": "" if best is None else best.get("aig_path", ""),
            "best_area": "" if best is None else best.get("area", ""),
            "best_delay": "" if best is None else best.get("delay", ""),
            "best_adp": "" if best is None else best.get("adp", ""),
            "delta_adp_vs_pre_backend": delta_pre,
            "adp_ratio_to_pre_backend": pre_ratio,
            "improves_pre_backend": improves_pre,
            "improvement_pct_vs_pre_backend": improvement_pct,
            "final_deepsyn_status": final_deepsyn_status,
            "final_deepsyn_candidate_id": "" if final_deepsyn is None else final_deepsyn.get("candidate_id", ""),
            "final_deepsyn_area": "" if final_deepsyn is None else final_deepsyn.get("area", ""),
            "final_deepsyn_delay": "" if final_deepsyn is None else final_deepsyn.get("delay", ""),
            "final_deepsyn_adp": "" if final_deepsyn is None else final_deepsyn.get("adp", ""),
            "final_deepsyn_improved": final_deepsyn_improved,
            "final_deepsyn_notes": final_deepsyn_notes,
            "reference_area": "" if ref.get("area") is None else str(ref.get("area")),
            "reference_delay": "" if ref.get("delay") is None else str(ref.get("delay")),
            "reference_adp": "" if ref.get("adp") is None else str(ref.get("adp")),
            "delta_vs_current": delta_current,
            "delta_vs_v2": delta_v2,
            "adp_ratio_to_reference": ratio,
            "ratio_to_reference": ratio,
            "beats_reference": "1" if best_adp is not None and ref_adp is not None and best_adp < ref_adp else "0",
            "best_command_sequence": best_sequence,
            "ttopt_used": "1" if "ttopt" in best_lineage or "ttopt" in best_sequence else "0",
            "mockturtle_used": "1" if "mt_" in best_sequence or "mockturtle" in best_lineage else "0",
            "esyn_used": "1" if "esyn" in best_lineage or "esyn" in best_sequence else "0",
            "pareto_points": str(len(pareto_rows(self.rows))),
            "near_pareto_points": str(len(self.near_pool)),
            "history_rows": str(len(self.rows)),
        }

    def case_result(self):
        return {
            "case": self.case,
            "history": self.history_path,
            "pareto": self.pareto_path,
            "best": self.best_path,
            "profile": self.profile_path,
            "summary": self.summary_path,
            "scheduler": self.scheduler_path,
            "phase_summary": self.phase_summary_path,
            "operator_steps": self.operator_steps_path,
            "near_pareto": self.near_pareto_path,
            "command_stats": self.command_stats_path,
            "lineage": self.lineage_path,
            "timeout_failures": self.timeout_failures_path,
            "rows": len(self.rows),
        }


def int_str_delta(parent_value, child_value):
    parent = parse_int(parent_value)
    child = parse_int(child_value)
    if parent is None or child is None:
        return ""
    return str(child - parent)


def min_numeric(rows, field):
    values = [parse_int(row.get(field)) for row in rows if parse_int(row.get(field)) is not None]
    if not values:
        return ""
    return str(min(values))


def resolve_path(value):
    if not value:
        return None
    path = Path(value)
    if not path.is_absolute():
        path = ROOT / path
    return path


def merge_case_outputs(run_id, results, args):
    run_dir = ROOT / "student" / "runs" / args.domain / run_id
    results_dir = run_dir / "results"
    results_dir.mkdir(parents=True, exist_ok=True)

    history = []
    pareto = []
    best = []
    profiles = []
    summary = []
    scheduler = []
    phase_summary = []
    operator_steps = []
    near_pareto = []
    command_stats = []
    lineage = []
    timeout_failures = []
    failures = []
    for result in results:
        if "error" in result:
            failures.append(result)
            continue
        history.extend(read_csv(result["history"]))
        pareto.extend(read_csv(result["pareto"]))
        best.extend(read_csv(result["best"]))
        profiles.extend(read_csv(result["profile"]))
        summary.extend(read_csv(result["summary"]))
        scheduler.extend(read_csv(result["scheduler"]))
        phase_summary.extend(read_csv(result["phase_summary"]))
        operator_steps.extend(read_csv(result.get("operator_steps", "")))
        near_pareto.extend(read_csv(result.get("near_pareto", "")))
        command_stats.extend(read_csv(result.get("command_stats", "")))
        lineage.extend(read_csv(result.get("lineage", "")))
        timeout_failures.extend(read_csv(result.get("timeout_failures", "")))

    history.sort(key=history_sort_key)
    pareto.sort(key=candidate_sort_key)
    best.sort(key=candidate_sort_key)
    profiles.sort(key=profile_sort_key)
    summary.sort(key=lambda row: case_sort_key(row.get("case", "")))
    scheduler.sort(key=history_sort_key)
    phase_summary.sort(key=lambda row: (case_sort_key(row.get("case", "")), parse_int(row.get("cycle")) or 0, parse_int(row.get("round_start")) or 0, row.get("phase", "")))
    operator_steps.sort(key=lambda row: (case_sort_key(row.get("case", "")), parse_int(row.get("generation")) or 0, row.get("sequence_id", ""), parse_int(row.get("step_index")) or 0))
    near_pareto.sort(key=candidate_sort_key)
    command_stats.sort(key=lambda row: (case_sort_key(row.get("case", "")), row.get("family", ""), row.get("operator_id", "")))
    lineage.sort(key=lambda row: (case_sort_key(row.get("case", "")), parse_int(row.get("generation")) or 0, row.get("candidate_id", "")))
    timeout_failures.sort(key=lambda row: (case_sort_key(row.get("case", "")), parse_int(row.get("generation")) or 0, row.get("sequence_id", ""), row.get("operator_id", "")))

    write_csv(results_dir / "history.csv", history, HISTORY_FIELDNAMES)
    write_csv(results_dir / "pareto.csv", pareto, HISTORY_FIELDNAMES)
    write_csv(results_dir / "best.csv", best, HISTORY_FIELDNAMES)
    write_csv(results_dir / "case_profile.csv", profiles, PROFILE_FIELDNAMES)
    write_csv(results_dir / "summary.csv", summary, SUMMARY_FIELDNAMES)
    write_csv(results_dir / "scheduler_decisions.csv", scheduler, SCHEDULER_FIELDNAMES)
    write_csv(results_dir / "phase_summary.csv", phase_summary, PHASE_SUMMARY_FIELDNAMES)
    write_csv(results_dir / "operator_steps.csv", operator_steps, OPERATOR_STEP_FIELDNAMES)
    write_csv(results_dir / "near_pareto.csv", near_pareto, HISTORY_FIELDNAMES)
    write_csv(results_dir / "command_stats.csv", command_stats, COMMAND_STATS_FIELDNAMES)
    write_csv(results_dir / "lineage.csv", lineage, LINEAGE_FIELDNAMES)
    write_csv(results_dir / "timeout_failures.csv", timeout_failures, TIMEOUT_FAILURE_FIELDNAMES)
    if failures:
        write_csv(results_dir / "case_failures.csv", failures, ["case", "error", "traceback"])
    write_manifest(run_id, run_dir, history, summary, failures, args)


def write_manifest(run_id, run_dir, history, summary, failures, args):
    text = [
        "# {0}".format(run_id),
        "",
        "Run ID: `{0}`".format(run_id),
        "",
        "Purpose: {0} backend portfolio {1} over `{2}`.".format(args.domain, args.portfolio_version.upper(), args.cases),
        "",
        "Inputs:",
        "- Current seeds: `{0}`".format(rel(args.current_bundle)),
        "- Backend candidate seeds: `{0}`".format(args.backend_bundle_glob),
        "- Extra seed CSVs: `{0}`".format(", ".join(rel(path) for path in args.extra_seed_csv) if args.extra_seed_csv else "none"),
        "- Truth files: `benchmarks/exNNN.truth`",
        "- Reference: `reference_result.csv`",
        "",
        "Artifacts:",
        "- Work directory: `student/work/{0}/`".format(run_id),
        "- History CSV: `results/history.csv`",
        "- Pareto CSV: `results/pareto.csv`",
        "- Best CSV: `results/best.csv`",
        "- Summary CSV: `results/summary.csv`",
        "- Case profile CSV: `results/case_profile.csv`",
        "- Scheduler decisions CSV: `results/scheduler_decisions.csv`",
        "- Phase summary CSV: `results/phase_summary.csv`",
        "- V3 operator steps CSV: `results/operator_steps.csv`",
        "- V3 command stats CSV: `results/command_stats.csv`",
        "- V3 lineage CSV: `results/lineage.csv`",
        "- V3 timeout/failure CSV: `results/timeout_failures.csv`",
        "",
        "Methods tried:",
        "- V1/V2: ABC expanded macro flows through configured tiers",
        "- V1/V2: ABC9 `&syn2; &dc2` during search",
        "- V2/V3: optional final-only ABC9 `&deepsyn` trial on each case best AIG",
        "- V3: CPU-only GA over ABC/ABC9/MockTurtle operator sequences",
        "- V3: generic truth-table `&ttopt` seed generation when enabled for a case",
        "- V3: CULS disabled by default",
        "- Optional E-Syn per-output seed generation when enabled",
        "",
        "Result counts:",
        "- History rows: {0}".format(len(history)),
        "- Summary rows: {0}".format(len(summary)),
        "- Case failures: {0}".format(len(failures)),
        "",
    ]
    path = run_dir / "MANIFEST.md"
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w") as handle:
        handle.write("\n".join(text))


def create_run_layout(run_id, args):
    work_root = ROOT / "student" / "work" / run_id
    run_root = ROOT / "student" / "runs" / args.domain / run_id
    work_root.mkdir(parents=True, exist_ok=True)
    (run_root / "results").mkdir(parents=True, exist_ok=True)
    if args.portfolio_version == "v3-ga":
        library_rows = operator_manifest_rows(
            filter_operators_for_policy(
                build_v3_operator_library(
                    include_mockturtle=not args.skip_mockturtle,
                    include_final=True,
                    include_esyn=args.enable_esyn,
                ),
                args.v3_operator_policy,
            )
        )
    else:
        library_rows = command_library_rows(
            include_abc9=not args.skip_abc9,
            include_mockturtle=not args.skip_mockturtle,
            include_culs=not args.skip_culs,
            include_esyn=args.enable_esyn,
            portfolio_version=args.portfolio_version,
        )
    write_json(
        work_root / "command_library.json",
        library_rows,
    )
    write_csv(
        run_root / "results" / "command_library_manifest.csv",
        library_rows,
        [
            "operator_id",
            "id",
            "tool",
            "template",
            "family",
            "priority",
            "timeout_sec",
            "timeout_class",
            "node_min",
            "node_max",
            "node_bucket",
            "case_filter",
            "risk_level",
            "can_start_sequence",
            "can_follow_timeout",
            "params_json",
            "source_note",
            "enabled_by_default",
            "notes",
        ],
    )
    write_json(
        work_root / "tool_status.json",
        {
            "abc": {"path": str(args.abc), "exists": Path(args.abc).is_file()},
            "yosys": {"path": str(args.yosys), "exists": Path(args.yosys).is_file()},
            "mockturtle_runner": {
                "path": "" if args.mockturtle_runner is None else str(args.mockturtle_runner),
                "exists": args.mockturtle_runner is not None and Path(args.mockturtle_runner).is_file(),
            },
            "culs_bin": {"path": str(args.culs_bin), "exists": Path(args.culs_bin).is_file()},
            "esyn": esyn_tool_status(root=ROOT) if args.enable_esyn else {},
        },
    )
    write_json(
        work_root / "run_state.json",
        {
            "run_id": run_id,
            "domain": args.domain,
            "cases": args.cases,
            "portfolio_version": args.portfolio_version,
            "current_bundle": rel(args.current_bundle),
            "backend_bundle_glob": args.backend_bundle_glob,
            "extra_seed_csv": [rel(path) for path in args.extra_seed_csv],
            "created_at": time.strftime("%Y-%m-%d %H:%M:%S %z"),
        },
    )


def run_case_worker(case, args, run_id, culs_slots, references):
    runner = CaseRunner(case, args, run_id, culs_slots, references)
    try:
        return runner.run()
    except Exception as exc:
        trace = traceback.format_exc()
        failure_dir = ROOT / "student" / "work" / run_id / case / "checkpoints"
        failure_dir.mkdir(parents=True, exist_ok=True)
        with (failure_dir / "case_failure.txt").open("w") as handle:
            handle.write(trace)
        return {"case": case, "error": "{0}: {1}".format(type(exc).__name__, exc), "traceback": trace}


def case_spec_label(spec):
    return safe_id(str(spec).replace("-", "_").replace(",", "_"), limit=120)


def parse_args(argv=None):
    parser = argparse.ArgumentParser(description="Run ALS backend portfolio.")
    parser.add_argument("--portfolio-version", choices=("v1", "v2", "v3-ga"), default="v2")
    parser.add_argument("--domain", choices=tuple(sorted(DOMAIN_CONFIGS.keys())), default=DEFAULT_DOMAIN)
    parser.add_argument("--cases", default=None)
    parser.add_argument("--run-id", default=None)
    parser.add_argument("--current-bundle", type=Path, default=None)
    parser.add_argument("--backend-bundle-glob", default=None)
    parser.add_argument("--extra-seed-csv", type=Path, action="append", default=[])
    parser.add_argument("--max-extra-seeds-per-case", type=int, default=8)
    parser.add_argument("--v2-summary-csv", type=Path, default=None)
    parser.add_argument("--abc", type=Path, default=DEFAULT_ABC)
    parser.add_argument("--yosys", type=Path, default=DEFAULT_YOSYS)
    parser.add_argument("--mockturtle-runner", type=Path, default=None)
    parser.add_argument("--culs-bin", type=Path, default=default_culs_bin())
    parser.add_argument("--jobs", type=int, default=8)
    parser.add_argument("--case-jobs", type=int, default=None)
    parser.add_argument("--task-jobs", type=int, default=None)
    parser.add_argument("--culs-jobs", type=int, default=4)
    parser.add_argument("--max-search-cycles", "--max-cycles", dest="max_search_cycles", type=int, default=None)
    parser.add_argument("--max-history-per-case", type=int, default=None)
    parser.add_argument("--max-active-search-points", type=int, default=None)
    parser.add_argument("--max-archive-pareto-points", type=int, default=None)
    parser.add_argument("--max-near-pareto-points", type=int, default=None)
    parser.add_argument("--max-parents-per-round", type=int, default=16)
    parser.add_argument("--max-commands-per-round", type=int, default=12)
    parser.add_argument("--max-rounds-per-phase", type=int, default=3)
    parser.add_argument("--stagnation-rounds", type=int, default=2)
    parser.add_argument("--abc-timeout", type=int, default=None)
    parser.add_argument("--final-deepsyn-trial", action="store_true")
    parser.add_argument("--final-deepsyn-timeout", "--abc9-deepsyn-timeout", dest="final_deepsyn_timeout", type=int, default=None)
    parser.add_argument("--final-deepsyn-area-limit", "--abc9-deepsyn-area-limit", dest="final_deepsyn_area_limit", type=int, default=10000)
    parser.add_argument("--final-deepsyn-grace-sec", type=int, default=300)
    parser.add_argument("--mockturtle-timeout", type=int, default=None)
    parser.add_argument("--mockturtle-max-pis", type=int, default=8)
    parser.add_argument("--mockturtle-max-inserts", type=int, default=2)
    parser.add_argument("--culs-timeout", type=int, default=None)
    parser.add_argument("--culs-disable-after-failures", type=int, default=2)
    parser.add_argument("--yosys-timeout", type=int, default=120)
    parser.add_argument("--per-case-runtime-soft-limit", type=int, default=None)
    parser.add_argument("--max-generations", type=int, default=None)
    parser.add_argument("--population-size", type=int, default=None)
    parser.add_argument("--offspring-per-generation", type=int, default=None)
    parser.add_argument("--max-sequence-len", type=int, default=4)
    parser.add_argument("--v3-random-seed", type=int, default=1)
    parser.add_argument(
        "--v3-operator-policy",
        choices=("default", "near_ref_polish", "near_ref_heavy_no_deepsyn", "high_gap_rescue"),
        default="default",
    )
    parser.add_argument("--enable-ttopt", action="store_true", default=None)
    parser.add_argument("--disable-ttopt", action="store_false", dest="enable_ttopt")
    parser.add_argument("--ttopt-cases", default="ex286,ex287")
    parser.add_argument("--ttopt-all-cases", action="store_true")
    parser.add_argument("--ttopt-timeout", type=int, default=120)
    parser.add_argument("--ttopt-pi", type=int, default=None)
    parser.add_argument("--ttopt-po", type=int, default=None)
    parser.add_argument("--recent-window", type=int, default=50)
    parser.add_argument("--decay-factor", type=float, default=0.85)
    parser.add_argument("--exploration-fraction", type=float, default=0.30)
    parser.add_argument("--resume", action="store_true", default=True)
    parser.add_argument("--no-resume", action="store_false", dest="resume")
    parser.add_argument("--seed-only", action="store_true", help="Evaluate seeds and write initial outputs only.")
    parser.add_argument("--enable-esyn", action="store_true", default=None)
    parser.add_argument("--disable-esyn", action="store_false", dest="enable_esyn")
    parser.add_argument("--esyn-max-parents", type=int, default=2)
    parser.add_argument("--esyn-max-outputs", type=int, default=6)
    parser.add_argument("--esyn-top-n", type=int, default=2)
    parser.add_argument("--esyn-timeout", type=int, default=180)
    parser.add_argument("--esyn-synth-timeout", type=int, default=90)
    parser.add_argument("--esyn-eval-timeout", type=int, default=90)
    parser.add_argument("--skip-abc9", action="store_true")
    parser.add_argument("--skip-mockturtle", action="store_true")
    parser.add_argument("--skip-culs", action="store_true")
    args = parser.parse_args(argv)
    apply_domain_and_version_defaults(args)
    return args


def apply_domain_and_version_defaults(args):
    config = DOMAIN_CONFIGS[args.domain]
    if args.cases is None:
        args.cases = config["cases"]
    if args.current_bundle is None:
        args.current_bundle = config["current_bundle"]
    if args.backend_bundle_glob is None:
        args.backend_bundle_glob = config["backend_bundle_glob"]
    v2 = args.portfolio_version == "v2"
    v3 = args.portfolio_version == "v3-ga"
    if args.enable_esyn is None:
        args.enable_esyn = v2
    if args.enable_ttopt is None:
        args.enable_ttopt = v3
    if v3:
        args.skip_culs = True
    if args.portfolio_version == "v2" and args.domain == "bf16" and not args.extra_seed_csv and DEFAULT_BF16_V1_PARETO.is_file():
        args.extra_seed_csv.append(DEFAULT_BF16_V1_PARETO)

    if args.max_search_cycles is None:
        args.max_search_cycles = 2 if v2 else 1
    if args.max_generations is None:
        args.max_generations = 8 if v3 else 0
    if args.population_size is None:
        args.population_size = 32 if v3 else args.max_active_search_points or 32
    if args.offspring_per_generation is None:
        args.offspring_per_generation = 96 if v3 else 0
    if args.max_history_per_case is None:
        args.max_history_per_case = 8000 if v2 else (12000 if v3 else 3000)
    if args.max_active_search_points is None:
        args.max_active_search_points = 96 if (v2 or v3) else 64
    if args.max_archive_pareto_points is None:
        args.max_archive_pareto_points = 1024 if (v2 or v3) else 512
    if args.max_near_pareto_points is None:
        args.max_near_pareto_points = 96 if (v2 or v3) else 64
    if args.abc_timeout is None:
        args.abc_timeout = 90 if (v2 or v3) else 60
    if args.final_deepsyn_timeout is None:
        args.final_deepsyn_timeout = 600 if v3 else 3000
    if args.mockturtle_timeout is None:
        args.mockturtle_timeout = 180 if v2 else 120
    if args.culs_timeout is None:
        args.culs_timeout = 240 if v2 else 180
    if args.per_case_runtime_soft_limit is None:
        args.per_case_runtime_soft_limit = 7200 if (v2 or v3) else 3600
    if v3 and args.exploration_fraction == 0.30:
        args.exploration_fraction = 0.40


def main(argv=None):
    args = parse_args(argv)
    cases = parse_cases(args.cases)
    run_id = args.run_id or "{0}_backend_portfolio_{1}_{2}".format(
        case_spec_label(args.cases),
        args.portfolio_version,
        time.strftime("%Y%m%d_%H%M"),
    )
    if args.mockturtle_runner is None:
        discovered = discover_runner()
        args.mockturtle_runner = discovered
    create_run_layout(run_id, args)
    references = load_reference(ROOT / "reference_result.csv")
    culs_slots = queue.Queue()
    for index in range(max(1, args.culs_jobs)):
        culs_slots.put(index)

    results = []
    case_jobs = args.case_jobs if args.case_jobs is not None else args.jobs
    with ThreadPoolExecutor(max_workers=max(1, case_jobs)) as executor:
        future_to_case = {
            executor.submit(run_case_worker, case, args, run_id, culs_slots, references): case for case in cases
        }
        for future in as_completed(future_to_case):
            result = future.result()
            results.append(result)
            if "error" in result:
                print("{0}: failed: {1}".format(result["case"], result["error"]), flush=True)
            else:
                print("{0}: rows={1}".format(result["case"], result["rows"]), flush=True)
    merge_case_outputs(run_id, results, args)
    print("run_id: {0}".format(run_id))
    print("results: {0}".format(ROOT / "student" / "runs" / args.domain / run_id / "results"))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
