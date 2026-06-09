# ex287_frontend_bit_hybrid_single_20260608_1605

Run ID: `ex287_frontend_bit_hybrid_single_20260608_1605`

Purpose: Test whether replacing individual output bits of the current
symmetry-BDD ex287 source with the older structural decision-tree source can
recover lower-delay structure without losing exact equivalence.

Inputs:
- Truth file: `benchmarks/ex287.truth`
- Primary Verilog: `student/work/reverse_unknown_20260603_1812/ex287/verilog/ex287_unknown_14x14_decision_tree_greedy.v`
- Primary module: `ex287_unknown_14x14_decision_tree_greedy`
- Secondary Verilog: `student/work/ex285_ex289_frontend_symmetry_bdd_20260608_1429/ex287/verilog/ex287_unknown_symbdd_interleave_f10.v`
- Secondary module: `ex287_unknown_symbdd_interleave_f10`
- Generator: `student/generators/unknown_bit_hybrid_search.py`
- Recovery script: `student/work/ex287_frontend_bit_hybrid_single_20260608_1605/recover_results.py`

Artifacts:
- Work directory: `student/work/ex287_frontend_bit_hybrid_single_20260608_1605/`
- Results directory: `student/runs/unknown/ex287_frontend_bit_hybrid_single_20260608_1605/results/`
- Candidates CSV: `student/runs/unknown/ex287_frontend_bit_hybrid_single_20260608_1605/results/candidates.csv`
- Best CSV: `student/runs/unknown/ex287_frontend_bit_hybrid_single_20260608_1605/results/best.csv`
- Summary CSV: `student/runs/unknown/ex287_frontend_bit_hybrid_single_20260608_1605/results/summary.csv`
- Official replay: `student/runs/unknown/ex287_frontend_bit_hybrid_single_20260608_1605/results/evaluate_check.csv`

Methods Tried:
- Generated exact bit-hybrid RTL for variants `primary_0` through `primary_6`,
  where one selected bit came from the structural decision-tree source and all
  other bits came from the symmetry-BDD source.
- Stopped before completing `primary_7` because all completed rows had already
  regressed versus the current ex287 best.
- Recovered the seven completed AIG rows with `evaluate.py`/ABC
  `read_truth -xf` equivalence and ADP measurement.

Best Result:
- Case: `ex287`
- Candidate: `ex287_unknown_bit_hybrid_primary_6`
- Classification: `structural_exact`
- Area: `1814`
- Delay: `19`
- ADP: `34466`
- Reference ADP: `5782`
- Ratio to reference: `5.960913`
- Official replay: `OK`

Notes:
- Current ex287 best remains `ex287_interleave_f10_synth_preset`
  (`1723/18/31014`) from the symmetry-BDD synthflow run.
- This run is an exclusion/diagnostic-quality frontend run. It was not merged
  into the active candidate pool because every completed row was worse than the
  existing current best.
- Unknown seed curation remains deferred until the full `ex280-ex299` class has
  converged; no files from this run were copied into `student/seeds`.
