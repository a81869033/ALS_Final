# ex230_ex234_frontend_fp16_current_20260607_1853

Run ID: `ex230_ex234_frontend_fp16_current_20260607_1853`

Purpose: Curated current-best FP16 seeds from the ex230-ex234 focused pass.

Inputs:
- `ex230`: FP16 sigmoid exp/mant pair-case source from
  `student/runs/fp16/ex220_ex239_semantic_20260604/`, re-emitted with
  `abc -g aig`.
- `ex231`: FP16 reciprocal semantic sign/exp field-default source from
  `student/runs/fp16/ex220_ex239_semantic_20260604/`, re-emitted with
  `abc -g aig`.
- `ex232`: FP16 square selected-bit vector-cover source from
  `student/runs/fp16/ex232_ex233_frontend_fp16_bitrun_20260607_1853/`,
  re-emitted with `abc -g aig`.
- `ex233`: FP16 sqrt selected-bit vector-cover source from
  `student/runs/fp16/ex232_ex233_frontend_fp16_bitrun_20260607_1853/`,
  re-emitted with `abc -g aig`.
- `ex234`: FP16 reciprocal-square sign-pair source from
  `student/runs/fp16/ex220_ex239_semantic_20260604/`, re-emitted with
  `abc -g aig`.

Artifacts:
- Best CSV:
  `student/seeds/fp16/ex230_ex234_frontend_fp16_current_20260607_1853/results/best.csv`
- Official recheck CSV:
  `student/seeds/fp16/ex230_ex234_frontend_fp16_current_20260607_1853/results/evaluate_official_best.csv`
- Improvement summary CSV:
  `student/seeds/fp16/ex230_ex234_frontend_fp16_current_20260607_1853/results/summary.csv`
- Per-case Verilog/AIG directories:
  `student/seeds/fp16/ex230_ex234_frontend_fp16_current_20260607_1853/ex230/`
  through
  `student/seeds/fp16/ex230_ex234_frontend_fp16_current_20260607_1853/ex234/`

Best results:
- `ex230`: `ex230_exp_mant_pair_case_abc_g_aig`,
  `6969/20/139380`, reference ratio `1.286743`.
- `ex231`: `ex231_semantic_sign_exp_field_defaults_abc_g_aig`,
  `1286/16/20576`, reference ratio `1.462818`.
- `ex232`: `ex232_bitvec_bits12_9_t32_abc_g_aig`,
  `1343/16/21488`, reference ratio `1.604540`.
- `ex233`: `ex233_bitvec_bits14_13_12_9_t32_abc_g_aig`,
  `1674/17/28458`, reference ratio `1.410628`.
- `ex234`: `ex234_sign_pair_case_abc_g_aig`,
  `1355/17/23035`, reference ratio `1.480303`.

Notes:
- All five current-best AIGs were rechecked with `evaluate.py --case exNNN`
  and are exact equivalent.
- `ex231`, `ex232`, and `ex233` exact Python semantic models match
  reciprocal, square, and sqrt under DAZ/FTZ/RNE/canonical-NaN assumptions.
- `ex234` matches reciprocal-square under the same assumptions.
- `ex230` behaves as sigmoid-family, but the direct Python DAZ/FTZ/RNE sigmoid
  model has rounding mismatches starting at input `0x1a00`; keep it classified
  as structural/semantic-hybrid until the exact sigmoid rounding rule is
  recovered.
- `ex232` remains the only case in this group above `1.5x` reference after
  this pass.  Direct arithmetic, field-default variants, older rows with
  `abc -g aig`, bitvec neighbor sets, and broad table factoring were checked;
  future work should target a shallower exact square rounding/carry structure
  or a better selected-bit predicate for the remaining critical bits.
