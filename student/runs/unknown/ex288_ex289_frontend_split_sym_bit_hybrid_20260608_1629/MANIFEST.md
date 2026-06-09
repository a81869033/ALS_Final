# ex288_ex289_frontend_split_sym_bit_hybrid_20260608_1629

Run ID: `ex288_ex289_frontend_split_sym_bit_hybrid_20260608_1629`

Purpose: Test whether grouped high output bits from low-delay rotate-split
sources can reduce the critical path of the current `swap_in_4_5`
symmetry-BDD sources for `ex288` and `ex289`.

Inputs:
- Truth files: `benchmarks/ex288.truth`, `benchmarks/ex289.truth`
- Primary Verilog:
  - `student/work/reverse_unknown_20260603_1812/ex288/verilog/ex288_unknown_15x15_rotate_high_split_default.v`
  - `student/work/reverse_unknown_20260603_1812/ex289/verilog/ex289_unknown_16x16_rotate_high_split_default.v`
- Secondary Verilog:
  - `student/work/ex285_ex289_frontend_symmetry_bdd_20260608_1429/ex288/verilog/ex288_unknown_symbdd_interleave_f10.v`
  - `student/work/ex285_ex289_frontend_symmetry_bdd_20260608_1429/ex289/verilog/ex289_unknown_symbdd_interleave_f00.v`
- Generator: `student/generators/unknown_bit_hybrid_search.py`

Artifacts:
- Work directory: `student/work/ex288_ex289_frontend_split_sym_bit_hybrid_20260608_1629/`
- Results directory: `student/runs/unknown/ex288_ex289_frontend_split_sym_bit_hybrid_20260608_1629/results/`
- Candidates CSV: `student/runs/unknown/ex288_ex289_frontend_split_sym_bit_hybrid_20260608_1629/results/candidates.csv`
- Best CSV: `student/runs/unknown/ex288_ex289_frontend_split_sym_bit_hybrid_20260608_1629/results/best.csv`
- Summary CSV: `student/runs/unknown/ex288_ex289_frontend_split_sym_bit_hybrid_20260608_1629/results/summary.csv`
- Official replay: `student/runs/unknown/ex288_ex289_frontend_split_sym_bit_hybrid_20260608_1629/results/evaluate_check.csv`

Methods Tried:
- Five grouped high-bit variants per case.
- All 10 rows synthesized and were exact under ABC CEC with `read_truth -xf`.
- Official replay was run on the per-case run bests.

Best Results:

| Case | Candidate | Area | Delay | ADP | Current ADP | Result |
| --- | --- | ---: | ---: | ---: | ---: | --- |
| ex288 | `ex288_unknown_bit_hybrid_primary_12_13_14` | 3025 | 20 | 60500 | 35663 | worse |
| ex289 | `ex289_unknown_bit_hybrid_primary_12_13_14_15` | 2567 | 21 | 53907 | 36393 | worse |

Notes:
- The rotate-split source did not combine cleanly with the symmetry-BDD source:
  area increased enough to overwhelm any delay benefit.
- This run was not merged into the active unknown candidate pool because all
  rows were worse than existing current bests.
- No files from this run were copied into `student/seeds`.
