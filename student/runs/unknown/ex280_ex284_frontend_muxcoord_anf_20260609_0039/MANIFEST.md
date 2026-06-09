# ex280_ex284_frontend_muxcoord_anf_20260609_0039

Run ID: `ex280_ex284_frontend_muxcoord_anf_20260609_0039`

Purpose: Test the newly found nonlinear endpoint-mux coordinate basis as a full degree-3 ANF source.

Coordinate hypothesis:
- `key = prefix_parity_reduce(in)`
- `mc[i] = key[i] ? (key[n-2-i] ^ key[n-1-i]) : key[i+1]`
- Add boundary coordinates `key[0]`, `key[1]`, `key[2]`, `key[n-2]`, `key[n-1]`

Artifacts:
- Work directory: `student/work/ex280_ex284_frontend_muxcoord_anf_20260609_0039/`
- Candidates CSV: `student/runs/unknown/ex280_ex284_frontend_muxcoord_anf_20260609_0039/results/candidates.csv`
- Best CSV: `student/runs/unknown/ex280_ex284_frontend_muxcoord_anf_20260609_0039/results/best.csv`
- Summary CSV: `student/runs/unknown/ex280_ex284_frontend_muxcoord_anf_20260609_0039/results/summary.csv`
- Evaluate check CSV: `student/runs/unknown/ex280_ex284_frontend_muxcoord_anf_20260609_0039/results/evaluate_check.csv`

Best result:
- `ex280`: `1496/33/49368`, exact but worse than current.
- `ex284`: `1886/35/66010`, exact but worse than current.

Conclusion:
- Degree-3 over the mux-coordinate basis proves the basis is expressive, but all-bit degree-3 ANF is still area-heavy.
- The useful follow-up is degree-2 solved bits plus residual Davio, captured in later muxcoord hybrid runs.
- This run did not update `student/seeds` and did not write `output/`.
