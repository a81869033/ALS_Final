# ex269 Frontend Attempts

Semantics: unsigned 8x8 division, `low8 / high8`, divide-by-zero -> max.

Initial current best:
- `ex269_udiv_direct`: 314/78/24492

Notes:
- Case-denominator source is too large; restoring is close but slower.
- Try quotient-range classifiers and per-denominator compressed tables.

## 2026-06-09 Update

Best verified frontend seed:

- `ex269_udiv_radix4_shift_subtract_wreduce_abc_g_aig`: 380/41/15580, ratio
  1.324830 to reference ADP 11760.

What changed:

- Reconfirmed exact unsigned `low8/high8` division with divide-by-zero
  saturation to `8'hff`.
- Safe direct division improved the original direct seed (`314/78/24492`) to
  `264/77/20328`.
- Shift-subtract with `wreduce_abc_g_aig` improved to `263/76/19988`; this was
  later superseded by radix-4.
- Full BDDs reduced delay but were too large (`1679/22/36938`).  Divisor range
  split, split-direct, threshold trees, low-branch BDD, low-branch restoring,
  constant smallcase, selected low-bit BDD diagnostics, and synthflow delay
  target checks were exact or diagnostic but did not beat the active winner.

Remaining gap:

- Previous note superseded: radix-4 quotient digit selection moved ex269 inside
  1.5x reference.

## 2026-06-09 Deep Follow-Up

What improved:

- Radix-4 shift/subtract chooses two quotient bits per stage, reducing serial
  stages from eight to four.  This cut delay from `76` to `41` and ADP from
  `19988` to `15580`.
- High-bit BDD plus low direct division briefly improved to `263/75/19725`,
  but radix-4 was a much larger improvement.

Rejected follow-up directions:

- Radix-8 lowered delay further in some flows but area rose too much
  (`544/37/20128` best).
- Narrow-remainder radix added overflow guard delay and did not improve.
- Mixed-radix reduced comparator count but lost too much delay.
- MTBDD/full BDD, leading-range threshold, low-branch BDD/restoring,
  constant-divisor smallcase, reciprocal-table correction, residual hybrid,
  and low-delay flow checks were exact or diagnostic but worse by ADP.
- Compact radix digit flags and complemented-edge BDD transfer were also exact
  but worse.  Compact radix saved area (`364`) but delay rose to `46`;
  complemented BDD area exploded (`1710/23/39330` best in the probe).

## 2026-06-09 Cofactor Word-Mux Transfer Check

No new best.

- Transferred the ex266/ex267 cofactor word-mux classifier with `bhi2+ahi1`
  and `bhi3+ahi1` selectors.
- Best exact row was `ex269_udiv_cof_bhi3_ahi1_bitbdd_wordmux_synth_preset`:
  1663/20/33260.
- This confirmed the structure is too area-heavy for n=8; radix-4 remains the
  right active seed family for ex269.
