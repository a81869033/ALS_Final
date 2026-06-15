#!/usr/bin/env python3
from __future__ import print_function

import csv
from pathlib import Path


ROOT = Path(__file__).resolve().parents[4]
RUN_ID = "frontend_radical_parallel_round83_20260613_2038"
AGENT = "sub-fp8-logicmin-r83"
DOMAIN = "float_fp8"
SHARD = ROOT / "student/frontend_campaigns/campaigns" / RUN_ID / "agent_shards" / AGENT
SOURCE = ROOT / "student/runs/float_fp8" / RUN_ID / AGENT / "results"

CANDIDATE_HEADER = [
    "round", "run_id", "agent_id", "case", "domain", "candidate_id",
    "family", "hypothesis", "representation", "sharing_strategy",
    "shared_structure", "synth_flow", "method_signature", "verilog_path",
    "aig_path", "log_path", "evaluate_log", "official_status",
    "equivalent", "simulation_pass", "area", "delay", "adp",
    "reference_adp", "current_adp", "frontend_best_adp", "beats_frontend",
    "beats_current", "beats_reference", "notes",
]
EVAL_HEADER = [
    "round", "run_id", "agent_id", "case", "candidate_id", "equivalent",
    "area", "delay", "adp", "verilog_path", "aig_path", "evaluate_log",
    "status", "notes",
]
FAILED_HEADER = [
    "round", "run_id", "agent_id", "case", "domain", "hypothesis",
    "representation", "sharing_strategy", "method_signature", "status",
    "reason", "verilog_path", "log_path", "notes",
]
BEST_HEADER = [
    "case", "previous_candidate_id", "previous_adp", "new_candidate_id",
    "new_adp", "area", "delay", "verilog_path", "aig_path", "log_path",
    "method_signature", "agent_id", "notes",
]
SIM_HEADER = [
    "round", "run_id", "agent_id", "case", "candidate_id", "simulator",
    "status", "patterns", "log_path", "notes",
]
SHARED_HEADER = [
    "round", "run_id", "agent_id", "case", "candidate_id",
    "structure_type", "shared_signal_count", "outputs_covered",
    "expected_effect", "observed_area", "observed_delay", "observed_adp",
    "notes",
]

REFERENCE = {"ex244": 4272, "ex246": 2805, "ex247": 2975}
CURRENT = {"ex244": 8928, "ex246": 5984, "ex247": 6804}
FRONTEND = {"ex244": 9120, "ex246": 6888, "ex247": 7291}


def read_rows(path):
    with path.open(newline="") as handle:
        return list(csv.DictReader(handle))


def write_rows(path, header, rows):
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=header)
        writer.writeheader()
        for row in rows:
            writer.writerow({key: row.get(key, "") for key in header})


def main():
    candidates = []
    evals = []
    sims = []
    shared = []
    for row in read_rows(SOURCE / "candidates.csv"):
        case = row["case"]
        candidate_id = row["candidate_id"]
        eval_log = "student/work/{0}/{1}/{2}/logs/{3}.evaluate.py.log".format(
            RUN_ID, AGENT, case, candidate_id
        )
        method_signature = "|".join([
            case,
            "fp8_feature_space_logicmin",
            row.get("variant", ""),
            "shared_class_rounding_signal_sop",
            "yosys_internal_abc_g_aig",
            "official_evaluate",
            "r83_nonwinning",
        ])
        base = {
            "round": "round83",
            "run_id": RUN_ID,
            "agent_id": AGENT,
            "case": case,
            "domain": DOMAIN,
            "candidate_id": candidate_id,
            "family": "fp8_feature_space_logicmin",
            "hypothesis": row.get("hypothesis", ""),
            "representation": row.get("variant", ""),
            "sharing_strategy": "shared class/rounding feature SOP",
            "shared_structure": row.get("notes", ""),
            "synth_flow": "yosys_internal_abc_g_aig",
            "method_signature": method_signature,
            "verilog_path": row.get("verilog_path", ""),
            "aig_path": row.get("aig_path", ""),
            "log_path": eval_log,
            "evaluate_log": eval_log,
            "official_status": "OK",
            "equivalent": row.get("equivalent", ""),
            "simulation_pass": "not_run",
            "area": row.get("area", ""),
            "delay": row.get("delay", ""),
            "adp": row.get("adp", ""),
            "reference_adp": str(REFERENCE.get(case, "")),
            "current_adp": str(CURRENT.get(case, "")),
            "frontend_best_adp": str(FRONTEND.get(case, "")),
            "beats_frontend": "1" if int(row["adp"]) < FRONTEND.get(case, 0) else "0",
            "beats_current": "1" if int(row["adp"]) < CURRENT.get(case, 0) else "0",
            "beats_reference": "1" if int(row["adp"]) < REFERENCE.get(case, 0) else "0",
            "notes": row.get("notes", ""),
        }
        candidates.append(base)
        evals.append({
            "round": "round83",
            "run_id": RUN_ID,
            "agent_id": AGENT,
            "case": case,
            "candidate_id": candidate_id,
            "equivalent": row.get("equivalent", ""),
            "area": row.get("area", ""),
            "delay": row.get("delay", ""),
            "adp": row.get("adp", ""),
            "verilog_path": row.get("verilog_path", ""),
            "aig_path": row.get("aig_path", ""),
            "evaluate_log": eval_log,
            "status": "OK",
            "notes": row.get("notes", ""),
        })
        sims.append({
            "round": "round83",
            "run_id": RUN_ID,
            "agent_id": AGENT,
            "case": case,
            "candidate_id": candidate_id,
            "simulator": "not_run",
            "status": "not_run",
            "patterns": "0",
            "log_path": "",
            "notes": "official evaluate.py used for acceptance",
        })
        shared.append({
            "round": "round83",
            "run_id": RUN_ID,
            "agent_id": AGENT,
            "case": case,
            "candidate_id": candidate_id,
            "structure_type": "feature_space_logicmin",
            "shared_signal_count": "",
            "outputs_covered": "7",
            "expected_effect": "reduce fp8 conversion output equations",
            "observed_area": row.get("area", ""),
            "observed_delay": row.get("delay", ""),
            "observed_adp": row.get("adp", ""),
            "notes": row.get("notes", ""),
        })

    failed = []
    for row in read_rows(SOURCE / "failed_hypotheses.csv"):
        failed.append({
            "round": "round83",
            "run_id": RUN_ID,
            "agent_id": AGENT,
            "case": row.get("case", ""),
            "domain": DOMAIN,
            "hypothesis": row.get("hypothesis", ""),
            "representation": row.get("variant", ""),
            "sharing_strategy": row.get("prior_overlap", ""),
            "method_signature": "{0}|r83_fp8_logicmin_blocker|{1}".format(row.get("case", ""), row.get("variant", "")),
            "status": row.get("status", ""),
            "reason": row.get("reason", ""),
            "verilog_path": "",
            "log_path": "",
            "notes": row.get("next_action", ""),
        })

    write_rows(SHARD / "candidates.csv", CANDIDATE_HEADER, candidates)
    write_rows(SHARD / "evaluation_results.csv", EVAL_HEADER, evals)
    write_rows(SHARD / "simulation_results.csv", SIM_HEADER, sims)
    write_rows(SHARD / "shared_structure_report.csv", SHARED_HEADER, shared)
    write_rows(SHARD / "failed_hypotheses.csv", FAILED_HEADER, failed)
    write_rows(SHARD / "best_improvements.csv", BEST_HEADER, [])
    print("standardized {0}: candidates={1} failed={2}".format(AGENT, len(candidates), len(failed)))


if __name__ == "__main__":
    main()
