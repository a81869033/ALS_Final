# ex230 FP16 Frontend Attempts

Function hypothesis: `fp16_sigmoid`.

Current known best:
- Run: `ex230_ex234_frontend_fp16_current_20260607_1853`
- Variant: `ex230_exp_mant_pair_case_abc_g_aig`
- QoR: `6969/20/139380`
- Reference ADP: `108320`
- Ratio: `1.286743`
- Classification: `synthflow_exact structural/semantic-hybrid`

2026-06-07 focused pass:
- Official `evaluate.py --case ex230` recheck: OK.
- Best source is still the exp/mant pair-case sigmoid-family seed; re-emitting
  with Yosys `abc -g aig` lowered delay from 21 to 20.
- Direct Python DAZ/FTZ/RNE sigmoid model did not exact-match the truth table;
  first observed mismatch was input `0x1a00`, expected `0x3801`, actual
  `0x3802`.
- Treat as sigmoid-family structural/semantic-hybrid until the exact rounding
  rule is recovered.

Next maintenance items:
- Recover the exact sigmoid rounding behavior around tiny positive transition
  bands before replacing the current pair-case seed.
- Isolate the small transition exponent bands before mantissa LUT generation.
- Record whether field reassembly beats packed word tables.
