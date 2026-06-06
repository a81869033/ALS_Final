# ex218 BF16 Frontend Attempts

Hypothesis: `bf16_reciprocal_cube`

Current best snapshot:
- variant: `value_case`
- class: `structural_exact`
- ADP/reference ratio: `2.155493`

Semantic direction:
- Odd function: use sign symmetry.
- Normal-domain exponent formula should be `out_exp = 508 - 3*exp + delta`.
- Use a 128-entry mantissa LUT for reciprocal-cube mantissa and explicit underflow/overflow guards.
- This is one of the highest priority BF16 cases because current best is a direct value case.

Attempt log:
- 2026-06-05: Created tracking note.  First real attempt should replace `value_case` with arithmetic exponent RTL.
- 2026-06-06: Run `ex215_ex219_frontend_bf16_semantic_20260606_1447` confirmed exact `bf16_reciprocal_cube` semantics.  Best seed is `legacy_value_case_bits_4_bh1_fix3`, `458/15/6870`, a small improvement from `6945` ADP.
- 2026-06-06: Deep run `ex216_ex218_ex219_frontend_bf16_deep_20260606_1600` improved best to `legacy_value_case_bits_15_cmp_caseattrs_fix9`, `467/13/6071`.  The key was extracting output bit15 with a comparator predicate, reducing delay from 15 to 13.
- 2026-06-06: Deep2 run `ex215_ex219_frontend_bf16_deep2_20260606_1726` did not improve beyond `467/13/6071`.

Failed or Avoided Directions:
- Do not repeat `value_case` or sign-pair structural tables as candidates.
- The warning above is revised: the old value-case seed is still the best frontend base after semantic attempts; keep only the curated value-case plus bit4 override as a seed.  Semantic arithmetic, positive-symmetry, delta, split-sign, and default-expression exception variants all lost; default-expression exception was especially bad at `19506/24/468144`.
- Hand reciprocal-cube guarded semantic RTL was exact but too deep (`469/22/10318`).  Manual sign extraction was exact but did not beat the comparator-coded bit15 predicate.  Mixed bit15+bit4/bit9 overrides regressed.
- Manual sign casez became exact after fixing case order, but still lost (`467/14/6538`).  Additional bit15 plus exponent high-bit overlays regressed.
