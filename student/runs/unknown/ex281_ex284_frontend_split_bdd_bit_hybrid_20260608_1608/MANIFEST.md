# ex281_ex284_frontend_split_bdd_bit_hybrid_20260608_1608

Run ID: `ex281_ex284_frontend_split_bdd_bit_hybrid_20260608_1608`

Purpose: Test whether grouping high output bits from the older rotated split
sources with low output bits from the shared-BDD source can reduce delay for
`ex281-ex284` while preserving exact equivalence.

Inputs:
- Truth files: `benchmarks/ex281.truth` through `benchmarks/ex284.truth`
- Primary Verilog family: rotated split/default sources under
  `student/work/reverse_unknown_20260603_1812/`
- Secondary Verilog family: interleaved shared-BDD sources under
  `student/work/ex280_ex284_frontend_bdd_interleave_20260608_1120/`
- Generator: `student/generators/unknown_bit_hybrid_search.py`

Artifacts:
- Work directory: `student/work/ex281_ex284_frontend_split_bdd_bit_hybrid_20260608_1608/`
- Results directory: `student/runs/unknown/ex281_ex284_frontend_split_bdd_bit_hybrid_20260608_1608/results/`
- Candidates CSV: `student/runs/unknown/ex281_ex284_frontend_split_bdd_bit_hybrid_20260608_1608/results/candidates.csv`
- Best CSV: `student/runs/unknown/ex281_ex284_frontend_split_bdd_bit_hybrid_20260608_1608/results/best.csv`
- Summary CSV: `student/runs/unknown/ex281_ex284_frontend_split_bdd_bit_hybrid_20260608_1608/results/summary.csv`
- Official replay: `student/runs/unknown/ex281_ex284_frontend_split_bdd_bit_hybrid_20260608_1608/results/evaluate_check.csv`
- Limited synthflow CSV: `student/runs/unknown/ex281_ex284_frontend_split_bdd_bit_hybrid_20260608_1608/results/synthflow_candidates.csv`

Methods Tried:
- Six grouped output-bit hybrid variants per case.
- Primary bits came from rotated split/default RTL; secondary bits came from
  the interleaved shared-BDD RTL.
- All 24 raw candidates synthesized and were exact under ABC CEC with
  `read_truth -xf`.
- Limited synthflow on each raw per-case best tried `abc_g_aig`,
  `synth_preset`, `extra_opt_share`, `abc_d20`, and `abc_d24`; all 20
  synthflow rows were exact.

Best Results:

| Case | Candidate | Area | Delay | ADP | Current ADP | Result |
| --- | --- | ---: | ---: | ---: | ---: | --- |
| ex281 | `ex281_primary_8_9_10_11_12_abc_g_aig` | 1676 | 22 | 36872 | 25476 | worse |
| ex282 | `ex282_primary_9_10_11_12_13_synth_preset` | 1896 | 22 | 41712 | 31512 | worse |
| ex283 | `ex283_primary_10_11_12_13_14_synth_preset` | 2361 | 25 | 59025 | 38844 | worse |
| ex284 | `ex284_primary_11_12_13_15_abc_g_aig` | 2224 | 27 | 60048 | 50083 | worse |

Notes:
- The lower-delay grouped variants reduced delay for some rows, but area
  growth outweighed the delay reduction.
- The lower-area grouped variants still had delay comparable to the shared-BDD
  source and did not beat current ADP.
- Limited synthflow improved the run bests, but not enough to beat the current
  shared-BDD synthflow rows.
- This run was not merged into the active unknown candidate pool because all
  rows were worse than existing current bests.
- Unknown seed curation remains deferred until the full `ex280-ex299` class has
  converged; no files from this run were copied into `student/seeds`.
