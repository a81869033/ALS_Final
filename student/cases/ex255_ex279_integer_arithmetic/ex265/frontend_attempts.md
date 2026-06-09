# ex265 Frontend Attempts

Semantics: unsigned 4x4 division, `low4 / high4`, divide-by-zero -> max.

Initial verified seeds:
- `ex265_udiv_case_denominator`: 80/8/640
- `ex265_udiv_restoring`: 52/16/832
- `ex265_udiv_direct`: 54/18/972

Notes:
- Denominator case has best ADP due low delay; restoring has lower area.
- Future work should see whether a shallow quotient predicate can keep delay 8
  while reducing area.

## 2026-06-09 Update

Best verified frontend seed:

- `ex265_udiv_bdd_b_msb_abc_g_aig`: 66/8/528, ratio 1.639752 to reference
  ADP 322.

What changed:

- Reconfirmed exact semantics with `TruthTable`/`abc_xf`: unsigned
  `low4/high4`, divide-by-zero returns `4'hf`.
- A divisor-MSB-first reduced BDD quotient classifier beat the old
  denominator-case seed (`80/8/640`) while preserving the same delay.
- Greedy BDD order lowered area but increased delay (`59/9/531`), so ADP was
  slightly worse than `bdd_b_msb`.
- Per-bit QMC/SOP was exact but area-heavy (`85/9/765`), so it is rejected.

## 2026-06-09 Cofactor Word-Mux Transfer

New best verified frontend seed:

- `ex265_udiv_cof_bhi3_ahi1_bitbdd_wordmux_synth_preset`: 63/8/504, ratio
  1.565217 to reference ADP 322.

What changed:

- Transferred the ex266 shallow classifier idea to n=4: split by divisor high
  bits plus dividend MSB, build local per-bit BDDs, then select the 4-bit
  quotient word with one shared mux.
- Best selector in the tested set was generic `cof_bhi3_ahi1_bitbdd_wordmux`.
  It preserves delay 8 and reduces area from 66 to 63.
