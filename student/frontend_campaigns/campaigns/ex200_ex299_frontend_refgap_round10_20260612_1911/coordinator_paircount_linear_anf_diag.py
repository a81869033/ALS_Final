#!/usr/bin/env python3
"""Round10 diagnostic: low-degree output-linear basis for pair-count encoding."""

import csv
import sys
from pathlib import Path


ROOT = Path(__file__).resolve().parents[4]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from student.frontends.truth import TruthTable
from student.generators.unknown_output_pair_component_diag import (
    components_from_relations,
    pair_encoding,
)


RUN_ID = "ex200_ex299_frontend_refgap_round10_20260612_1911"
AGENT_ID = "coordinator-paircount-anf"
CASES = ["ex286", "ex287"]
RELATIONS = (
    ROOT
    / "student"
    / "runs"
    / "unknown"
    / "ex286_ex289_frontend_image_constraint_diag_fix_20260609_1912"
    / "results"
    / "relations.csv"
)
WORK = ROOT / "student" / "work" / RUN_ID / AGENT_ID
SHARD = (
    ROOT
    / "student"
    / "frontend_campaigns"
    / "campaigns"
    / RUN_ID
    / "agent_shards"
    / AGENT_ID
)


def popcount(value):
    return bin(value).count("1")


def parity(value):
    return popcount(value) & 1


def mobius_word(words, input_width):
    coeffs = list(words)
    size = 1 << input_width
    for bit in range(input_width):
        step = 1 << bit
        for base in range(0, size, step << 1):
            for offset in range(step):
                coeffs[base + step + offset] ^= coeffs[base + offset]
    return coeffs


def row_basis(rows):
    basis = {}
    for row in rows:
        value = row
        while value:
            pivot = value.bit_length() - 1
            old = basis.get(pivot)
            if old is None:
                basis[pivot] = value
                break
            value ^= old
    return basis


def nullspace_basis(rows, width):
    basis = row_basis(rows)
    pivots = set(basis)
    free = [bit for bit in range(width) if bit not in pivots]
    out = []
    for free_bit in free:
        vector = 1 << free_bit
        changed = True
        while changed:
            changed = False
            for pivot, row in sorted(basis.items()):
                if parity(vector & row):
                    vector ^= 1 << pivot
                    changed = True
        out.append(vector)
    return out, basis


def degree_term_stats(coeffs, output_mask):
    terms = 0
    max_degree = -1
    hist = {}
    for mono, coeff_vector in enumerate(coeffs):
        if parity(coeff_vector & output_mask):
            degree = popcount(mono)
            terms += 1
            max_degree = max(max_degree, degree)
            hist[degree] = hist.get(degree, 0) + 1
    return terms, max_degree, hist


def encode_words(table, components):
    encoded = []
    encoded_width = None
    conflicts = 0
    for output in table.iter_outputs():
        value, width, conflict = pair_encoding(output, table.output_width, components)
        encoded.append(value)
        encoded_width = width
        if conflict:
            conflicts += 1
    return encoded, encoded_width, conflicts


def run_case(case):
    table = TruthTable(ROOT / "benchmarks" / "{0}.truth".format(case))
    components = components_from_relations(RELATIONS, case, table.output_width)
    encoded, encoded_width, conflicts = encode_words(table, components)
    pair_count_width = 2 * (table.output_width // 2)
    if table.output_width & 1:
        pair_count_width += 1
    count_mask = (1 << pair_count_width) - 1
    count_words = [word & count_mask for word in encoded]
    all_coeffs = mobius_word(encoded, table.input_width)
    count_coeffs = mobius_word(count_words, table.input_width)
    summary = []
    basis_rows = []
    for label, coeffs, width in [
        ("encoded_all", all_coeffs, encoded_width),
        ("pair_count_only", count_coeffs, pair_count_width),
    ]:
        for degree in [2, 3, 4, 5, 6]:
            high_rows = [
                coeff
                for mono, coeff in enumerate(coeffs)
                if popcount(mono) > degree and coeff
            ]
            null_basis, high_basis = nullspace_basis(high_rows, width)
            masks = []
            terms = []
            actual_degrees = []
            for vector in null_basis:
                term_count, actual_degree, hist = degree_term_stats(coeffs, vector)
                masks.append("0x{0:x}".format(vector))
                terms.append(str(term_count))
                actual_degrees.append(str(actual_degree))
                basis_rows.append(
                    {
                        "case": case,
                        "target": label,
                        "degree": degree,
                        "basis_mask": "0x{0:x}".format(vector),
                        "basis_popcount": popcount(vector),
                        "terms": term_count,
                        "actual_degree": actual_degree,
                        "degree_hist": ";".join(
                            "d{0}:{1}".format(k, hist[k]) for k in sorted(hist)
                        ),
                    }
                )
            summary.append(
                {
                    "case": case,
                    "target": label,
                    "input_width": table.input_width,
                    "output_width": table.output_width,
                    "encoded_width": encoded_width,
                    "pair_count_width": pair_count_width,
                    "component_count": len(components),
                    "orientation_conflicts": conflicts,
                    "degree": degree,
                    "high_coeff_rows": len(high_rows),
                    "high_coeff_rank": len(high_basis),
                    "low_degree_nullity": len(null_basis),
                    "basis_masks": ":".join(masks),
                    "basis_term_counts": ":".join(terms),
                    "basis_actual_degrees": ":".join(actual_degrees),
                    "notes": (
                        "pair-count encoded output-linear ANF; seed-worthy only if "
                        "nullity is high and term counts are low"
                    ),
                }
            )
    return summary, basis_rows


def write_csv(path, fieldnames, rows):
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=fieldnames)
        writer.writeheader()
        writer.writerows(rows)


def main():
    summaries = []
    bases = []
    for case in CASES:
        case_summary, case_bases = run_case(case)
        summaries.extend(case_summary)
        bases.extend(case_bases)
        (WORK / case / "notes").mkdir(parents=True, exist_ok=True)
    write_csv(
        SHARD / "diagnostics" / "paircount_linear_anf_summary.csv",
        [
            "case",
            "target",
            "input_width",
            "output_width",
            "encoded_width",
            "pair_count_width",
            "component_count",
            "orientation_conflicts",
            "degree",
            "high_coeff_rows",
            "high_coeff_rank",
            "low_degree_nullity",
            "basis_masks",
            "basis_term_counts",
            "basis_actual_degrees",
            "notes",
        ],
        summaries,
    )
    write_csv(
        SHARD / "diagnostics" / "paircount_linear_anf_basis.csv",
        [
            "case",
            "target",
            "degree",
            "basis_mask",
            "basis_popcount",
            "terms",
            "actual_degree",
            "degree_hist",
        ],
        bases,
    )
    write_csv(
        SHARD / "failed_hypotheses.csv",
        [
            "case",
            "domain",
            "hypothesis",
            "method_signature",
            "status",
            "reason",
            "representation",
            "sharing_strategy",
            "failure_stage",
            "failure_reason",
            "artifact_path",
            "log_path",
            "agent_id",
            "run_id",
            "notes",
        ],
        [
            {
                "case": case,
                "domain": "unknown",
                "hypothesis": "pair-count encoded output-linear low-degree basis",
                "method_signature": "{0}|hamming_weight_preserving_lossy_routing_normalizer|paircount_linear_anf_basis_diag|component_pair_count_output_linear_basis|no_synth|blocked_before_verilog|encoded_paircount_coordinates".format(
                    case
                ),
                "status": "blocked_no_verilog",
                "reason": "partial low-degree pair-count basis is incomplete and not seed-worthy",
                "representation": "component_pair_count_encoded_word_mobius_nullspace",
                "sharing_strategy": "shared output-linear coordinates over adjacent pair-count fields",
                "failure_stage": "diagnostic_no_verilog",
                "failure_reason": "diagnostic only unless high-nullity low-term pair-count basis appears",
                "artifact_path": str(
                    SHARD / "diagnostics" / "paircount_linear_anf_summary.csv"
                ),
                "log_path": "",
                "agent_id": AGENT_ID,
                "run_id": RUN_ID,
                "notes": "coordinator diagnostic avoids replaying raw-output lane parity or pair-count MDD wrappers",
            }
            for case in CASES
        ],
    )
    write_csv(
        SHARD / "shared_structure_report.csv",
        [
            "case",
            "domain",
            "candidate_id",
            "shared_structures",
            "sharing_strategy",
            "estimated_benefit",
            "agent_id",
            "run_id",
            "notes",
        ],
        [
            {
                "case": case,
                "domain": "unknown",
                "candidate_id": "",
                "shared_structures": "component-pair-count encoded output-linear ANF basis",
                "sharing_strategy": "share low-degree output coordinates if a complete basis is found",
                "estimated_benefit": "blocked: partial basis only",
                "agent_id": AGENT_ID,
                "run_id": RUN_ID,
                "notes": "semantic clue recorded; no Verilog emitted",
            }
            for case in CASES
        ],
    )
    write_csv(
        SHARD / "candidates.csv",
        [
            "case",
            "domain",
            "candidate_id",
            "hypothesis",
            "method_signature",
            "verilog_path",
            "aig_path",
            "equivalent",
            "area",
            "delay",
            "adp",
            "reference_adp",
            "current_frontend_adp",
            "beat_reference",
            "improved_frontend",
            "log_path",
            "agent_id",
            "run_id",
            "notes",
        ],
        [],
    )
    write_csv(
        SHARD / "evaluation_results.csv",
        [
            "case",
            "domain",
            "candidate_id",
            "equivalent",
            "area",
            "delay",
            "adp",
            "reference_adp",
            "current_frontend_adp",
            "verilog_path",
            "aig_path",
            "log_path",
            "method_signature",
            "agent_id",
            "run_id",
            "notes",
        ],
        [],
    )
    for row in summaries:
        if row["target"] == "pair_count_only" and row["degree"] in [4, 6]:
            print(
                "{case} {target} degree={degree} nullity={low_degree_nullity}/{pair_count_width} terms={basis_term_counts}".format(
                    **row
                )
            )
    print("summary={0}".format(SHARD / "diagnostics" / "paircount_linear_anf_summary.csv"))


if __name__ == "__main__":
    main()
