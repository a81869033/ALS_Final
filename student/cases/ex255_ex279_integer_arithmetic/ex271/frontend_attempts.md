# ex271 Frontend Attempts

Semantics: square, `x * x`.

Initial current semantic best:
- `ex271_square_direct`: 664/40/26560

Notes:
- Direct square is verified but far above reference.
- Try square-specific partial products and carry-save accumulation.

2026-06-09 update:
- Verified exact unsigned 10-bit square.
- New frontend best: `331/25/8275`, ratio 1.493143 to reference, now within
  1.5x.
- Best source: triangular square partial products, Wallace outside ordering,
  carry-select final adder group size 4 with `synth_preset`.
- Full-word 1024-entry case was exact but did not improve ADP.

## 2026-06-14 integer-extra-r2 continuation

Run ID: `ex204_ex299_frontend_continuation_20260614_1216`, agent `integer-extra-r2`.

- Official `evaluate.py` OK rows: 22/22.
- New frontend improvement: `ex271_square_wallace_square_outside_csel12_synth_preset_d16`, `332/24/7968`, improving old `331/25/8275` by 307 ADP.
- Artifact paths: Verilog `student/work/ex204_ex299_frontend_continuation_20260614_1216/integer-extra-r2/ex271/verilog/ex271_square_wallace_square_outside_csel12.v`; official AIG `student/runs/integer/ex204_ex299_frontend_continuation_20260614_1216/integer-extra-r2/ex271/official_eval/ex271_square_wallace_square_outside_csel12_synth_preset_d16/ex271.aig`.
- Also improving: `ex271_square_wallace_square_outside_csel12_abc_g_aig`, `336/24/8064`.
- Failed directions: csel3/5/8/10, factored/counter4x/Dadda, and truncated high-output hybrid sources were exact but weaker. The useful change is a much wider final carry-select group on the same triangular square partial-product source.
