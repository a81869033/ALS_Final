# ex272 Frontend Attempts

Semantics: square, `x * x`.

Initial current semantic best:
- `ex272_square_direct`: 923/46/42458

Notes:
- Symmetric-terms source increases delay heavily; do not repeat without a new
  carry structure.

2026-06-09 update:
- Verified exact unsigned 12-bit square.
- New frontend best: `507/32/16224`, ratio 1.491176 to reference, now within
  1.5x.
- Best source: triangular square partial products, Wallace outside ordering,
  carry-select final adder group size 5 with `synth_preset`.
- Direct, low/high split, cofactor, LUT-to-AIG, and column-count structures did
  not beat the Wallace/carry-select family.

## 2026-06-14 integer-extra-r2 continuation

Run ID: `ex204_ex299_frontend_continuation_20260614_1216`, agent `integer-extra-r2`.

- Official `evaluate.py` OK rows: 24/24.
- New frontend improvement: `ex272_square_wallace_square_outside_csel14_synth_preset_d20`, `509/30/15270`, improving old `507/32/16224` by 954 ADP.
- Artifact paths: Verilog `student/work/ex204_ex299_frontend_continuation_20260614_1216/integer-extra-r2/ex272/verilog/ex272_square_wallace_square_outside_csel14.v`; official AIG `student/runs/integer/ex204_ex299_frontend_continuation_20260614_1216/integer-extra-r2/ex272/official_eval/ex272_square_wallace_square_outside_csel14_synth_preset_d20/ex272.aig`.
- Also improving: `ex272_square_wallace_square_outside_csel14_abc_g_aig`, `510/30/15300`.
- Failed directions: csel4/6/8/10/12/16, factored/counter4x/Dadda, and high-output hybrid variants either tied old ADP or lost area/delay. The breakthrough is csel14 on the existing triangular outside Wallace square source.
