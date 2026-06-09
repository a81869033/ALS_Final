# ex280_ex284_frontend_muxcoord_hybrid_20260609_0039

Run ID: `ex280_ex284_frontend_muxcoord_hybrid_20260609_0039`

Purpose: Smoke-test the high-value mux-coordinate degree-2 solved-bit source plus residual Davio on the endpoint cases `ex280` and `ex284`.

Artifacts:
- Work directory: `student/work/ex280_ex284_frontend_muxcoord_hybrid_20260609_0039/`
- Candidates CSV: `student/runs/unknown/ex280_ex284_frontend_muxcoord_hybrid_20260609_0039/results/candidates.csv`
- Best CSV: `student/runs/unknown/ex280_ex284_frontend_muxcoord_hybrid_20260609_0039/results/best.csv`
- Summary CSV: `student/runs/unknown/ex280_ex284_frontend_muxcoord_hybrid_20260609_0039/results/summary.csv`
- Evaluate check CSV: `student/runs/unknown/ex280_ex284_frontend_muxcoord_hybrid_20260609_0039/results/evaluate_check.csv`

Best result:
- `ex280`: `436/30/13080`, exact and better than prior current `16821`.
- `ex284`: `518/41/21238`, exact and better than prior current `37791`.

Conclusion:
- This was the first confirmed large-drop structure: nonlinear mux-coordinate degree-2 formulas solve most output bits, and residual Davio handles the remaining three bits.
- Full five-case replay is in `ex280_ex284_frontend_muxcoord_hybrid_full_20260609_0057`.
- This run did not update `student/seeds` and did not write `output/`.
