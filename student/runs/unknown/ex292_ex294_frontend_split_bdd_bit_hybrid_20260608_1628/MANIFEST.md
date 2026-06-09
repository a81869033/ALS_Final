# ex292_ex294_frontend_split_bdd_bit_hybrid_20260608_1628

Run ID: `ex292_ex294_frontend_split_bdd_bit_hybrid_20260608_1628`

Purpose: Test whether selected grouped output-bit overrides from existing
split/default structural sources can improve the current shared-BDD frontend
sources for `ex292` and `ex294`.

Inputs:
- Truth files: `benchmarks/ex292.truth`, `benchmarks/ex294.truth`
- Primary Verilog family: existing split/default structural sources under
  `student/work/reverse_unknown_20260603_1812/`
- Secondary Verilog family: improved shared-BDD sources under
  `student/work/ex285_ex294_frontend_bdd_diagnostic_20260608_1225/`
- Generator: `student/generators/unknown_bit_hybrid_search.py`

Artifacts:
- Work directory: `student/work/ex292_ex294_frontend_split_bdd_bit_hybrid_20260608_1628/`
- Results directory: `student/runs/unknown/ex292_ex294_frontend_split_bdd_bit_hybrid_20260608_1628/results/`
- Candidates CSV: `student/runs/unknown/ex292_ex294_frontend_split_bdd_bit_hybrid_20260608_1628/results/candidates.csv`
- Best CSV: `student/runs/unknown/ex292_ex294_frontend_split_bdd_bit_hybrid_20260608_1628/results/best.csv`
- Synthflow CSV: `student/runs/unknown/ex292_ex294_frontend_split_bdd_bit_hybrid_20260608_1628/results/synthflow_candidates.csv`
- Summary CSV: `student/runs/unknown/ex292_ex294_frontend_split_bdd_bit_hybrid_20260608_1628/results/summary.csv`
- Official replay: `student/runs/unknown/ex292_ex294_frontend_split_bdd_bit_hybrid_20260608_1628/results/evaluate_check.csv`

Methods Tried:
- Six grouped bit-hybrid variants per case.
- The raw rows were exact under ABC CEC with `read_truth -xf`.
- Limited synthflow was run on the raw best source for each case.
- Official replay was run on the per-case final run bests.

Best Results:

| Case | Candidate | Area | Delay | ADP | Current ADP | Result |
| --- | --- | ---: | ---: | ---: | ---: | --- |
| ex292 | `ex292_primary_0_1_2_3_4_5_6_synth_preset` | 8734 | 20 | 174680 | 142170 | worse |
| ex294 | `ex294_primary_6_7_12_13_abc_g_aig` | 14060 | 21 | 295260 | 246698 | worse |

Notes:
- The grouped structural overrides reduced delay for some rows but increased
  area too much to improve ADP.
- This run was not merged into the active unknown candidate pool because all
  rows were worse than existing current bests.
- No files from this run were copied into `student/seeds`.
