# ex200 BF16 Frontend Attempts

Hypothesis: `bf16_exp`

Current best snapshot:
- variant: `sign_exp_mant_case`
- class: `structural_exact`
- ADP/reference ratio: `1.591256`

Semantic direction:
- Split sign/exponent/mantissa.
- Negative normal inputs likely collapse to a simple special/zero relation; confirm from truth facts before coding.
- Model positive normal input with exponent range guards and a 128-entry mantissa LUT only in active ranges.
- Try to express saturation/underflow ranges as constants before any mantissa table.

Attempt log:
- 2026-06-05: Created tracking note.  Current best is structural; next work should derive explicit BF16 exp range rules.
- 2026-06-05: Confirmed the truth table exactly matches `DAZ + real exp + BF16 RNE + FTZ`.
- 2026-06-05: Generated focused semantic RTL candidates in run `ex200_frontend_bf16_semantic_20260605_0748`.
- 2026-06-05: Best new candidate is `semantic_exp_default_one_casez_saturation`, with area `3717`, delay `17`, ADP `63189`.  This improves the previous best ADP `63733` but is still above reference ADP `40052`.
- 2026-06-05: Exact official recheck passed for all 5 generated candidates.
- 2026-06-05: Additional frontend-only attempts were run: parallel-case hint, active-first ordering, per-exponent mode/default exceptions, per-exponent `casez` run compression, and sign-split exponent decoders.
- 2026-06-05: Best ADP remains `63189`; `semantic_exp_default_one_parallel_casez_saturation` ties `semantic_exp_default_one_casez_saturation` at area `3717`, delay `17`.
- 2026-06-05: Official recheck passed for all 10 current candidates.
- 2026-06-05: Deep bit-level mantissa attempts were run: per-bit `casez`, base+delta table, hand-written boolean saturation, and full `casez` run compression.
- 2026-06-05: Best ADP still remains `63189`; official recheck passed for all 14 current candidates.
- 2026-06-05: Tried the remaining targeted frontend-only methods suggested after review: hybrid low-variation compression and predecoded active LUTs.
- 2026-06-05: Best ADP still remains `63189`; official recheck passed for all 17 current candidates.

Failed or Avoided Directions:
- Do not repeat broad `sign_exp_mant_case` variants unless they expose a specific semantic boundary.
- Mantissa run-length comparison RTL was exact but bad for Yosys: area `4639`, delay `44`, ADP `204116`.
- Field-split and monotonic-threshold shapes were synthesis-unfriendly in this run and should not be repeated without a smaller formula-driven structure.
- Per-exponent `casez` run compression was exact but worse: area `4233`, delay `20`, ADP `84660`.
- Sign-split exponent decoding reduced area slightly but raised delay: area `3706`, delay `18`, ADP `66708`.
- Per-exponent mode/default exceptions were close but did not beat best: area `3726`, delay `17`, ADP `63342`.
- Per-output-bit `casez` duplicated decoders and was worse: area `4329`, delay `17`, ADP `73593`.
- Base plus mantissa delta table introduced an adder/subtractor on the critical path: area `3736`, delay `45`, ADP `168120`.
- Boolean saturation looked simpler at source level but raised delay: area `3725`, delay `18`, ADP `67050`.
- Full monotonic run compression with `casez(mant)` was worse: area `4316`, delay `18`, ADP `77688`.
- Hybrid low-variation compression did not help: threshold 20 gave area `3809`, delay `18`, ADP `68562`; threshold 48 gave area `4103`, delay `17`, ADP `69751`.
- Predecoded active LUTs did not help: area `3728`, delay `18`, ADP `67104`.

Useful Structure:
- For BF16 exp, default output `1.0` is a good semantic anchor because small positive/negative inputs and DAZ zero map to `1.0`.
- Keep active exponent regions as mantissa case LUTs to preserve delay.
- Compress overflow/underflow saturation ranges with `casez` masks rather than long explicit case lists.
- Verilog `parallel_case/full_case` attributes did not improve Yosys QoR, but also did not hurt for this shape.
- The active mantissa mapping is monotonic, but Yosys does better with direct
  128-entry mantissa cases than with threshold/run/delta encodings.
- For ex200, trying to lower source-level table entries generally raises delay
  or duplicates decode logic; the best area/delay tradeoff remains direct
  active mantissa cases under semantic defaults.

## 2026-06-13 bf16-r22 round22 outcome

Run ID: `ex200_ex299_frontend_refgap_round22_20260613_0218`, agent `bf16-r22`.

- Dossier: `student/work/ex200_ex299_frontend_refgap_round22_20260613_0218/bf16-r22/ex200/dossiers/ex200_round22_dossier.md`.
- Evidence: `student/work/ex200_ex299_frontend_refgap_round22_20260613_0218/bf16-r22/ex200/diagnostics/ex200_round22_blocker_evidence.md`.
- Method signature: `ex200|bf16_exp_round22_new_normalizer|no_candidate|shared_sign_exp_default_one_review|not_run|DAZ_exp_BF16_RNE_FTZ|blocked`.
- Outcome: `BLOCKED_NO_CANDIDATE`; no Verilog candidate was generated because available round22 generator families would replay prior exact bad-QoR variants or known non-equivalent field splitting.
- Next action: only revisit with a materially new exponent/mantissa normalizer or a proven shallow selected-bit formula for BF16 exp.

## 2026-06-14 bf16-extra-r2 continuation outcome

Campaign: `ex204_ex299_frontend_continuation_20260614_1216`, agent `bf16-extra-r2`.

- Tried field residual, mant64 delta-pair residual, and capped exact decision-graph bit14 residual families under `student/work/ex204_ex299_frontend_continuation_20260614_1216/bf16-extra-r2/ex200/`.
- Official `evaluate.py` OK candidates: `ex200_r2_sepfield_e4m3s0_b14bh2` at `3650/16/58400` and `ex200_r2_delta_m64h2_b15bh2` at `3658/20/73160`; neither improved current frontend ADP `54405`.
- Failed direction: `ex200_r2_dg_delta_m64h2_b14` exceeded the exact decision-graph cap (`>6000` nodes) before Verilog emission.
- Shard CSVs: `student/frontend_campaigns/campaigns/ex204_ex299_frontend_continuation_20260614_1216/agent_shards/bf16-extra-r2/`.
