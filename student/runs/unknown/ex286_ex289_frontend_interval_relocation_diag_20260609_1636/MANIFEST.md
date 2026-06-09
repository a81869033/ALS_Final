# ex286_ex289_frontend_interval_relocation_diag_20260609_1636

Run ID: `ex286_ex289_frontend_interval_relocation_diag_20260609_1636`

Purpose: Test whether the structured outputs of contiguous input runs are evidence of a direct interval relocation, next-combination, or simple arithmetic conservative transform.

Inputs:
- Truth files: `benchmarks/ex286.truth` through `benchmarks/ex289.truth`
- Script: `student/generators/unknown_interval_relocation_diag.py`

Artifacts:
- Results directory: `student/runs/unknown/ex286_ex289_frontend_interval_relocation_diag_20260609_1636/results/`
- Diagnostic CSV: `results/interval_relocation_diagnostics.csv`
- Single-run output table: `results/single_interval_outputs.csv`
- Empty frontend CSVs: `results/candidates.csv`, `results/best.csv`, `results/evaluate_check.csv`

Methods tried:
- Next/previous combination rank-neighbor transforms with small positive/negative steps and bit-reversal variants.
- Direct interval-run superposition using OR/XOR of each contiguous input run's exact single-run output.
- Simple modular multiplication, reversed-domain multiplication, and rotations.

Best result:
- Diagnostic only; no Verilog/AIG candidates emitted.
- Best for all four cases was direct interval OR superposition, but row matches were only `142/8192`, `183/16384`, `259/32768`, and `368/65536`.

Notes:
- Contiguous runs show visible local structure, but the function is not a direct interval relocation/superposition or next-combination transform. Any useful recurrence must model interactions between separated runs.
