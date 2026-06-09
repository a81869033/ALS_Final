# ex268 Frontend Attempts

Semantics: unsigned 7x7 division, `low7 / high7`, divide-by-zero -> max.

Initial current best:
- `ex268_udiv_restoring`: 227/61/13847

Notes:
- Direct and restoring tie area; restoring wins delay.
- Need shallow quotient classifier or denominator-specialized factoring.

## 2026-06-09 Update

Best verified frontend seed:

- `ex268_udiv_denom_lz_range_direct_synth_preset`: 199/53/10547, ratio
  1.416465 to reference ADP 7446.

What changed:

- Reconfirmed exact unsigned `low7/high7` division with divide-by-zero
  saturation to `7'h7f`.
- Guard/safe-divisor sources improved the old restoring best (`227/61/13847`)
  to around `195/58/11310`.
- The best source splits by divisor leading range: high divisor bits select a
  narrower quotient-width division, while the low-divisor branch remains
  direct.  This lowered ADP to `10547` and brought ex268 within 1.5x reference.
- Full BDD and threshold classifier variants were exact but area-heavy.
  Low-branch BDD/restoring and constant smallcase variants also lost ADP.

## 2026-06-09 Cofactor Word-Mux Transfer Check

No new best.

- Transferred the ex266/ex267 cofactor word-mux classifier with `bhi2+ahi1`
  and `bhi3+ahi1` selectors.
- Best exact row was `ex268_udiv_cof_bhi3_ahi1_bitbdd_wordmux_synth_preset`:
  744/16/11904.
- Delay dropped dramatically versus current `199/53/10547`, but area was too
  large, so ADP lost.  Current best remains divisor-leading-range direct split.
