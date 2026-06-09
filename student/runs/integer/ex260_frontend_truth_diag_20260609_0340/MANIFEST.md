# ex260_frontend_truth_diag_20260609_0340

Run ID: `ex260_frontend_truth_diag_20260609_0340`

Purpose: diagnostic direct truth-table AIG for `ex260`, to check whether a
generic `read_truth -xf; st` structure could explain the small reference.

Inputs:
- Truth file: `benchmarks/ex260.truth`
- ABC command: `read_truth -xf; st; write_aiger -s`

Artifacts:
- Work directory: `student/work/ex260_frontend_truth_diag_20260609_0340/`
- Candidates CSV: `student/runs/integer/ex260_frontend_truth_diag_20260609_0340/results/candidates.csv`
- Best CSV: `student/runs/integer/ex260_frontend_truth_diag_20260609_0340/results/best.csv`
- Summary CSV: `student/runs/integer/ex260_frontend_truth_diag_20260609_0340/results/summary.csv`

Methods tried:
- Direct ABC truth frontend only.

Best result:
- ex260: `364/16/5824`, exact but much worse than Baugh-Wooley+hCLA4.

Notes:
- Diagnostic only; no backend optimization portfolio was run.
