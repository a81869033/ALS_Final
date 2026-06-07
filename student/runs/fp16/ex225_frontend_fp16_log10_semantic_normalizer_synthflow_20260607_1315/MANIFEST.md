# ex225_frontend_fp16_log10_semantic_normalizer_synthflow_20260607_1315

Stage: frontend Yosys synthflow check.

Scope:
- `ex225`

Purpose:
- Check whether the best semantic normalizer seed from
  `ex225_frontend_fp16_log10_semantic_normalizer_20260607_1305` loses only
  because of the default AIG emission path.

Results:
- Candidates CSV:
  `student/runs/fp16/ex225_frontend_fp16_log10_semantic_normalizer_synthflow_20260607_1315/results/candidates.csv`
- Best CSV:
  `student/runs/fp16/ex225_frontend_fp16_log10_semantic_normalizer_synthflow_20260607_1315/results/best.csv`

Outcome:
- `default_recheck`: `4061/73/296453`.
- `abc_g_aig`: `4028/70/281960`.
- `abc_g_aig` helps the semantic normalizer, but it is still worse than the
  curated current best `11499/22/252978`.

Conclusion:
- The semantic normalizer is exact and low-area, but not a current ADP seed.
  Further ex225 improvement needs a shallower exact correction/normalization
  structure, not merely a wider fixed-point q-table or synthflow parameter.
