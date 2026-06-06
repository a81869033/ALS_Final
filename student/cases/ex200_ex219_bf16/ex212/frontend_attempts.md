# ex212 BF16 Frontend Attempts

Hypothesis: `bf16_square`

Current best snapshot:
- variant: `exp_mant_delta_pair`
- class: `structural_exact`
- ADP/reference ratio: `1.518229`

Semantic direction:
- Square removes sign for normal finite inputs.
- Normal-domain exponent formula should be `out_exp = 2*exp - 127 + delta`.
- Use one 128-entry mantissa LUT for `(1.mant)^2` with carry/delta.
- Explicitly guard underflow, overflow, zero, inf, and NaN.

Attempt log:
- 2026-06-05: Created tracking note.  High priority because it is just above 1.5x and has a clear arithmetic semantic form.
- 2026-06-06: Run `ex210_ex214_frontend_bf16_semantic_20260606_1315` confirmed exact square semantics.  Best seed is `delta_pair_mode_hilo4_bits_15_bh1` at `281/11/3091`, improving old `3498` by 11.64%.  Direct arithmetic stayed exact but delay 12; delta-pair hi split 4 preserved the 11-level path while reducing area.

Failed or Avoided Directions:
- Avoid delta-pair structural tables once a clean square mantissa LUT is available.
- In practice the clean arithmetic mantissa LUT was exact but not best after Yosys.  Positive-domain full-word/field tables and most selected-bit overrides raised delay or area; only constant output sign bit saved one node on the h4 mode delta-pair base.
