#!/usr/bin/env python3
"""Collect visible round19 worker artifacts that were not yet shard-recorded."""

import csv
from pathlib import Path


RUN_ID = "ex200_ex299_frontend_refgap_round19_20260612_2346"
HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[3]
SHARD = HERE / "agent_shards" / "coordinator-visible-r19"
SUMMARY = HERE / "agent_summaries" / "coordinator-visible-r19.md"


ROWS = [
    {
        "case": "ex249",
        "domain": "float_fp8",
        "candidate_id": "ex249_round19_activegap_noabc",
        "hypothesis": "E5M2FN packed hypot abs(high,low) current source flow probe",
        "method_signature": "ex249|E5M2FN_packed_hypot_abs|active-gap_delta_source_flow_probe|shared_abs_max_min_decode_plus_active_gap_delta|yosys_noabc_aigmap|exact_e5m2fn_hypot_abs|word_output",
        "verilog_path": "student/work/{}/fp8-existing-r19/ex249/verilog/ex249_round19_activegap_noabc.v".format(RUN_ID),
        "aig_path": "student/work/{}/fp8-existing-r19/ex249/aigs/ex249.aig".format(RUN_ID),
        "log_path": "student/work/{}/fp8-existing-r19/ex249/logs/ex249_round19_activegap_noabc.official_evaluate.log".format(RUN_ID),
        "area": "307",
        "delay": "40",
        "adp": "12280",
        "reference_adp": "2079",
        "current_frontend_adp": "4368",
        "agent_id": "coordinator-visible-r19",
        "notes": "visible worker artifact; official evaluate.py OK but worse than current frontend",
    },
    {
        "case": "ex266",
        "domain": "integer",
        "candidate_id": "ex266_udiv_cof_bhi2_a4_wordmux_keep_noabc",
        "hypothesis": "unsigned division current cofactor wordmux with keep/noabc flow",
        "method_signature": "ex266|unsigned_division_bhi2_a4_cofactor_wordmux|current_best_source_keep_noabc_probe|shared_cofactor_word_mux_with_keep_attributes|yosys_noabc_aigmap|unsigned_low5_high5_div_dbz_sat|quotient_word",
        "verilog_path": "student/work/{}/integer-existing-r19/ex266/verilog/ex266_udiv_cof_bhi2_a4_wordmux_keep_noabc.v".format(RUN_ID),
        "aig_path": "student/work/{}/integer-existing-r19/ex266/aigs/ex266_udiv_cof_bhi2_a4_wordmux_keep_noabc.aig".format(RUN_ID),
        "log_path": "student/work/{}/integer-existing-r19/ex266/logs/ex266_udiv_cof_bhi2_a4_wordmux_keep_noabc.evaluate.py.log".format(RUN_ID),
        "area": "217",
        "delay": "18",
        "adp": "3906",
        "reference_adp": "848",
        "current_frontend_adp": "1480",
        "agent_id": "coordinator-visible-r19",
        "notes": "visible worker artifact; official evaluate.py OK but keep/noabc flow destroyed QoR",
    },
    {
        "case": "ex288",
        "domain": "unknown",
        "candidate_id": "ex288_keybdd_selected_round19_no_abc",
        "hypothesis": "unknown key-BDD selected source no-ABC flow probe",
        "method_signature": "ex288|hamming_preserving_routing_keybdd|selected_keybdd_noabc_flow_probe|shared_key_decode_and_interleaved_bdd_groups|yosys_noabc_aigmap|official_truth_equivalent_unknown|word_output",
        "verilog_path": "student/work/{}/unknown-existing-r19/ex288/verilog/ex288_keybdd_selected_round19_no_abc.v".format(RUN_ID),
        "aig_path": "student/work/{}/unknown-existing-r19/ex288/aigs/ex288_keybdd_selected_round19_no_abc.aig".format(RUN_ID),
        "log_path": "student/work/{}/unknown-existing-r19/ex288/logs/ex288_keybdd_selected_round19_no_abc.evaluate.py.log".format(RUN_ID),
        "area": "2944",
        "delay": "81",
        "adp": "238464",
        "reference_adp": "16394",
        "current_frontend_adp": "31598",
        "agent_id": "coordinator-visible-r19",
        "notes": "visible worker artifact; official evaluate.py OK but no-ABC mapping is much worse",
    },
    {
        "case": "ex204",
        "domain": "bf16",
        "candidate_id": "ex204_arithbase_hilo3_abc_g_aig",
        "hypothesis": "bf16 log2 arithbase hilo3 current source with abc-g-aig flow",
        "method_signature": "ex204|bf16_log2_arithbase_delta_correction|arithbase_hilo3_abcgaig_source_probe|shared_exponent_mantissa_delta_base|yosys_abc_g_aig|DAZ_log2_BF16_RNE_FTZ|grouped_word_output",
        "verilog_path": "student/work/{}/fpbf-existing-r19/ex204/verilog/ex204_bf16_log2_arithbase_hilo3_abcgaig_r19.v".format(RUN_ID),
        "aig_path": "student/work/{}/fpbf-existing-r19/ex204/official_eval/ex204_arithbase_hilo3_abc_g_aig/ex204.aig".format(RUN_ID),
        "log_path": "student/work/{}/fpbf-existing-r19/ex204/logs/ex204_arithbase_hilo3_abc_g_aig.evaluate.py.log".format(RUN_ID),
        "area": "1511",
        "delay": "17",
        "adp": "25687",
        "reference_adp": "15180",
        "current_frontend_adp": "25670",
        "agent_id": "coordinator-visible-r19",
        "notes": "visible worker artifact; official evaluate.py OK but ties/worsens current frontend by 17 ADP",
    },
    {
        "case": "ex205",
        "domain": "bf16",
        "candidate_id": "ex205_sep_fields_abc_g_and",
        "hypothesis": "bf16 log10 separated fields current source with abc-g-and flow",
        "method_signature": "ex205|bf16_log10_field_decode|sep_fields_module_rename_flow_probe|shared_sign_exp_mant_field_decode|yosys_abc_g_and|DAZ_log10_BF16_RNE_FTZ|grouped_word_output",
        "verilog_path": "student/work/{}/fpbf-existing-r19/ex205/verilog/ex205_bf16_log10_sep_fields_abcgand_r19.v".format(RUN_ID),
        "aig_path": "student/work/{}/fpbf-existing-r19/ex205/aigs/ex205_sep_fields_abc_g_and.aig".format(RUN_ID),
        "log_path": "student/work/{}/fpbf-existing-r19/ex205/logs/ex205_sep_fields_abc_g_and.evaluate.py.log".format(RUN_ID),
        "area": "4463",
        "delay": "17",
        "adp": "75871",
        "reference_adp": "47128",
        "current_frontend_adp": "71104",
        "agent_id": "coordinator-visible-r19",
        "notes": "visible worker artifact; official evaluate.py OK but worsens current frontend",
    },
]


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
    candidate_rows = []
    failed_rows = []
    shared_rows = []
    case_rows = []
    for row in good:
        beat_reference = int(row["adp"]) < int(row["reference_adp"])
        improved = int(row["adp"]) < int(row["current_frontend_adp"])
        candidate = dict(row)
        candidate.update(
            {
                "equivalent": "1",
                "beat_reference": "1" if beat_reference else "0",
                "improved_frontend": "1" if improved else "0",
                "run_id": RUN_ID,
            }
        )
        candidate_rows.append(candidate)
        if not improved:
            failed_rows.append(
                {
                    "case": row["case"],
                    "domain": row["domain"],
                    "hypothesis": row["hypothesis"],
                    "method_signature": row["method_signature"],
                    "status": "EQUIVALENT_NONWINNING",
                    "reason": "official evaluate.py OK but ADP {} is not below current frontend {}".format(
                        row["adp"], row["current_frontend_adp"]
                    ),
                    "artifact_path": row["verilog_path"],
                    "log_path": row["log_path"],
                    "agent_id": row["agent_id"],
                    "run_id": RUN_ID,
                    "notes": row["notes"],
                }
            )
        shared_rows.append(
            {
                "case": row["case"],
                "domain": row["domain"],
                "candidate_id": row["candidate_id"],
                "shared_structures": row["method_signature"].split("|")[3],
                "sharing_strategy": "source/flow probe around existing shared structure",
                "estimated_benefit": "negative" if not improved else "positive",
                "agent_id": row["agent_id"],
                "run_id": RUN_ID,
                "notes": row["notes"],
            }
        )
        case_rows.append(
            {
                "case": row["case"],
                "domain": row["domain"],
                "status": "official_equivalent_nonwinning" if not improved else "official_frontend_improved",
                "best_candidate_id": row["candidate_id"],
                "best_adp": row["adp"],
                "reference_adp": row["reference_adp"],
                "frontend_best_after": row["adp"] if improved else row["current_frontend_adp"],
                "notes": row["notes"],
            }
        )

    write_csv(SHARD / "candidates.csv", CANDIDATE_FIELDS, candidate_rows)
    write_csv(SHARD / "evaluation_results.csv", CANDIDATE_FIELDS, candidate_rows)
    write_csv(SHARD / "failed_hypotheses.csv", FAILED_FIELDS, failed_rows)
    write_csv(SHARD / "best_improvements.csv", CANDIDATE_FIELDS, [row for row in candidate_rows if row["improved_frontend"] == "1"])
    write_csv(SHARD / "shared_structure_report.csv", SHARED_FIELDS, shared_rows)
    write_csv(SHARD / "simulation_results.csv", SIM_FIELDS, [])
    write_csv(SHARD / "case_outcomes.csv", CASE_FIELDS, case_rows)

    SUMMARY.parent.mkdir(parents=True, exist_ok=True)
    lines = [
        "# coordinator-visible-r19",
        "",
        "Collected visible official evaluate.py artifacts that workers had produced before updating shard CSVs.",
        "",
    ]
    for row in candidate_rows:
        lines.append("- `{case}` `{candidate_id}`: OK `{area}/{delay}/{adp}`, current frontend `{current_frontend_adp}`, reference `{reference_adp}`.".format(**row))
    SUMMARY.write_text("\n".join(lines) + "\n")
    print("collected", len(candidate_rows), "rows")


if __name__ == "__main__":
    main()
