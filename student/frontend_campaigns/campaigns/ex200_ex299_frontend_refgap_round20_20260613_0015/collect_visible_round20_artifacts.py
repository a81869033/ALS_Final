#!/usr/bin/env python3
"""Collect visible round20 worker artifacts that are not yet shard-recorded."""

import csv
from pathlib import Path


RUN_ID = "ex200_ex299_frontend_refgap_round20_20260613_0015"
HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[3]
SHARD = HERE / "agent_shards" / "coordinator-visible-r20"
SUMMARY = HERE / "agent_summaries" / "coordinator-visible-r20.md"


ROWS = [
    {
        "case": "ex247",
        "domain": "float_fp8",
        "candidate_id": "ex247_round20_boundary_shell_mux_default",
        "hypothesis": "FP8 boundary shell mux rewrite",
        "method_signature": "ex247|fp8_conversion_boundary_shell|boundary_shell_mux_default|shared_field_decode_boundary_predicates|yosys_default_abc_and_aigmap|official_truth_equivalent_fp8|word_output",
        "verilog_path": "student/work/{}/fp8-tight-r20/ex247/verilog/ex247_round20_boundary_shell_mux.v".format(RUN_ID),
        "aig_path": "student/work/{}/fp8-tight-r20/ex247/aigs/ex247_round20_boundary_shell_mux_default.aig".format(RUN_ID),
        "log_path": "student/work/{}/fp8-tight-r20/ex247/logs/ex247_round20_boundary_shell_mux_default.official_evaluate.log".format(RUN_ID),
        "area": "369",
        "delay": "25",
        "adp": "9225",
        "reference_adp": "2975",
        "current_frontend_adp": "8349",
        "agent_id": "coordinator-visible-r20",
        "notes": "visible worker artifact; official evaluate.py OK but worse than current frontend",
    },
    {
        "case": "ex240",
        "domain": "float_fp8",
        "candidate_id": "ex240_round20_current_anchor_same_grs_diff_param8",
        "hypothesis": "FP8 conversion current-anchor GRS parameter probe",
        "method_signature": "ex240|fp8_conversion_current_anchor|same_grs_diff_param8|shared_grs_rounding_decode|yosys_default_abc_and_aigmap|official_truth_equivalent_fp8|word_output",
        "verilog_path": "student/work/{}/fp8-wide-r20/ex240/verilog/ex240_round20_current_anchor_same_grs_diff_param8.v".format(RUN_ID),
        "aig_path": "student/work/{}/fp8-wide-r20/ex240/aigs/ex240_round20_current_anchor_same_grs_diff_param8.aig".format(RUN_ID),
        "log_path": "student/work/{}/fp8-wide-r20/ex240/logs/ex240_round20_current_anchor_same_grs_diff_param8.official_evaluate.log".format(RUN_ID),
        "area": "590",
        "delay": "51",
        "adp": "30090",
        "reference_adp": "13299",
        "current_frontend_adp": "30090",
        "agent_id": "coordinator-visible-r20",
        "notes": "visible worker artifact; official evaluate.py OK but ties current frontend",
    },
]

# Worker shards now contain the visible first-case artifacts, so keep this
# collector header-only unless new unsharded official artifacts appear.
ROWS = []


CANDIDATE_FIELDS = [
    "case", "domain", "candidate_id", "hypothesis", "method_signature",
    "verilog_path", "aig_path", "equivalent", "area", "delay", "adp",
    "reference_adp", "current_frontend_adp", "beat_reference",
    "improved_frontend", "log_path", "agent_id", "run_id", "notes",
]

FAILED_FIELDS = [
    "case", "domain", "hypothesis", "method_signature", "status", "reason",
    "artifact_path", "log_path", "agent_id", "run_id", "notes",
]

SHARED_FIELDS = [
    "case", "domain", "candidate_id", "shared_structures",
    "sharing_strategy", "estimated_benefit", "agent_id", "run_id", "notes",
]

SIM_FIELDS = ["case", "candidate_id", "simulator", "status", "log_path", "agent_id", "run_id", "notes"]
CASE_FIELDS = ["case", "domain", "status", "best_candidate_id", "best_adp", "reference_adp", "frontend_best_after", "notes"]


def exists(row):
    return (
        (ROOT / row["verilog_path"]).is_file()
        and (ROOT / row["aig_path"]).is_file()
        and (ROOT / row["log_path"]).is_file()
    )


def write_csv(path, fields, rows):
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=fields)
        writer.writeheader()
        for row in rows:
            writer.writerow({field: row.get(field, "") for field in fields})


def main():
    good = [row for row in ROWS if exists(row)]
    candidates = []
    failed = []
    shared = []
    outcomes = []
    for row in good:
        adp = int(row["adp"])
        ref = int(row["reference_adp"])
        current = int(row["current_frontend_adp"])
        improved = adp < current
        candidate = dict(row)
        candidate.update(
            {
                "equivalent": "1",
                "beat_reference": "1" if adp < ref else "0",
                "improved_frontend": "1" if improved else "0",
                "run_id": RUN_ID,
            }
        )
        candidates.append(candidate)
        if not improved:
            failed.append(
                {
                    "case": row["case"],
                    "domain": row["domain"],
                    "hypothesis": row["hypothesis"],
                    "method_signature": row["method_signature"],
                    "status": "EQUIVALENT_NONWINNING",
                    "reason": "official evaluate.py OK but ADP {} is not below current frontend {}".format(adp, current),
                    "artifact_path": row["verilog_path"],
                    "log_path": row["log_path"],
                    "agent_id": row["agent_id"],
                    "run_id": RUN_ID,
                    "notes": row["notes"],
                }
            )
        shared.append(
            {
                "case": row["case"],
                "domain": row["domain"],
                "candidate_id": row["candidate_id"],
                "shared_structures": row["method_signature"].split("|")[3],
                "sharing_strategy": "visible worker shared-structure probe",
                "estimated_benefit": "negative" if not improved else "positive",
                "agent_id": row["agent_id"],
                "run_id": RUN_ID,
                "notes": row["notes"],
            }
        )
        outcomes.append(
            {
                "case": row["case"],
                "domain": row["domain"],
                "status": "official_frontend_improved" if improved else "official_equivalent_nonwinning",
                "best_candidate_id": row["candidate_id"],
                "best_adp": row["adp"],
                "reference_adp": row["reference_adp"],
                "frontend_best_after": row["adp"] if improved else row["current_frontend_adp"],
                "notes": row["notes"],
            }
        )

    write_csv(SHARD / "candidates.csv", CANDIDATE_FIELDS, candidates)
    write_csv(SHARD / "evaluation_results.csv", CANDIDATE_FIELDS, candidates)
    write_csv(SHARD / "failed_hypotheses.csv", FAILED_FIELDS, failed)
    write_csv(SHARD / "best_improvements.csv", CANDIDATE_FIELDS, [row for row in candidates if row["improved_frontend"] == "1"])
    write_csv(SHARD / "shared_structure_report.csv", SHARED_FIELDS, shared)
    write_csv(SHARD / "simulation_results.csv", SIM_FIELDS, [])
    write_csv(SHARD / "case_outcomes.csv", CASE_FIELDS, outcomes)

    SUMMARY.parent.mkdir(parents=True, exist_ok=True)
    lines = [
        "# coordinator-visible-r20",
        "",
        "Collected visible official evaluate.py artifacts that workers had produced before updating shard CSVs.",
        "",
    ]
    for row in candidates:
        lines.append("- `{case}` `{candidate_id}`: OK `{area}/{delay}/{adp}`, current frontend `{current_frontend_adp}`, reference `{reference_adp}`.".format(**row))
    SUMMARY.write_text("\n".join(lines) + "\n")
    print("collected", len(candidates), "rows")


if __name__ == "__main__":
    main()
