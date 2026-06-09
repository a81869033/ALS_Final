# ex266 Frontend Attempts

Semantics: unsigned 5x5 division, `low5 / high5`, divide-by-zero -> max.

Initial current best:
- `ex266_udiv_restoring`: 93/30/2790

Notes:
- Denominator case lowers delay but area dominates.
- Try quotient-bit formulas and denominator grouping.

## 2026-06-09 Update

Best verified frontend seed:

- `ex266_udiv_bdd_interleave_msb_synth_preset`: 152/12/1824, ratio 2.150943
  to reference ADP 848.

What changed:

- Reconfirmed exact unsigned `low5/high5` division with divide-by-zero
  saturation to `5'h1f`.
- MSB-interleaved BDD quotient classifier reduced ADP from the old restoring
  best (`93/30/2790`) to `152/12/1824`.
- Guarded direct division improved over restoring (`88/28/2464`) but BDD was
  still better by ADP.
- QMC/SOP and denominator-case-style sources were exact but area-heavy.

## 2026-06-09 Deep Follow-Up

First deep follow-up did not find a new best.  Current remained:

- `ex266_udiv_bdd_interleave_msb_synth_preset`: 152/12/1824.

Additional exact directions tried:

- Custom BDD order search reduced node count but synthesized to `146/13/1898`,
  worse by ADP.
- MTBDD word-level quotient classifier was close (`154/12/1848`) but did not
  beat the bit-BDD winner.
- Radix-4 divider lowered area but delay was too high (`123/18/2214`).
- Reciprocal-table multiply with one-step correction, leading-range threshold,
  high-bit BDD hybrids, residual hybrids, and low-delay flow checks all lost
  ADP.

## 2026-06-09 ex266-Centered Follow-Up

New best verified frontend seed:

- `ex266_udiv_bdd_perbit_interleave_msb_synth_preset`: 150/12/1800, ratio
  2.122642 to reference ADP 848.

What changed:

- Rewrote the BDD classifier as independent per-output BDD cones.  This
  removed source-level cross-bit sharing; Yosys found a same-delay but slightly
  smaller AIG than the shared BDD (`150/12/1800` vs `152/12/1824`).

Additional exact structures tried and rejected:

- Binary-search quotient/product tests: low area but long product/compare path
  (`113/38/4294` best).
- High-bit hand formulas (`q4/q3/q2`) plus low-bit BDD: exact but worse than
  the full per-bit BDD.
- Denominator interval case classifiers: delay as low as `11`, but area over
  `225` made ADP worse.
- Compact radix-4 digit flags: area dropped to `128`, but delay rose to `20`.
- Complemented-edge BDDs: node count improved, but synthesized delay became
  `13`; best was `147/13/1911`.
- High-bit residual subtract plus low serial/parallel classifier: low area
  (`97`) but residual path delay stayed high (`26`).
- Fully parallel `q>=k` threshold network: exact but very large
  (`520/25/13000`).
- Small BDD QoR-order probe: no order beat per-bit interleave after synthesis.

Current blocker:

- The remaining gap to reference `106/8/848` is mainly delay.  Current BDD
  forms give delay `12`; arithmetic/residual forms get area near or below
  reference but delay `20+`.  A future breakthrough likely needs a shallow
  shared multi-output quotient classifier, not another serial divider or broad
  threshold table.

## 2026-06-09 Shallow Shared Classifier Follow-Up

New best verified frontend seed:

- `ex266_udiv_ex266_cof_bhi2_a4_bitbdd_wordmux_synth_preset_d18`:
  148/10/1480, ratio 1.745283 to reference ADP 848.

Key structure:

- Use selector `{b[4:3], a[4]}` to split the 10-input division truth table into
  eight cofactors.
- Inside each cofactor, generate local per-output BDD classifiers over the
  remaining bits.
- Reassemble each cofactor into a 5-bit word and use one shared word mux for
  the final quotient, instead of five independent output-bit mux trees.

Why this worked:

- Plain shared BDD: `152/12/1824`.
- Per-output BDD: `150/12/1800`.
- `b[4:3]` cofactor bit-BDD: `147/12/1764`.
- `{b[4:3], a[4:3]}` cofactor bit-BDD: `152/11/1672`.
- `{b[4:3], a[4]}` cofactor bit-BDD with shared word mux: `148/10/1480`.

Additional exact directions tried in this pass:

- Word-level MTBDD cofactors by `b` high bits: exact and close, but best
  `151/12/1812` did not beat bit-level cofactor.
- More aggressive selectors such as `{b[4:3],a[4:3]}` and
  `{b[4:2],a[4:3]}` reduced local depth but increased mux/group area.
- Low divisor-bit selectors such as `{b[4],b[2]}` were exact but worse; the
  useful selector is magnitude-oriented, not arbitrary divisor-low-bit split.
- Complemented-edge local BDDs and explicit balanced mux trees both lost ADP.
- Limited frontend synthflow replay tied the same `148/10/1480` result.

Current blocker:

- The best source now has a real shallow shared classifier shape, but still
  misses reference delay `8` and area `106`.  Further progress likely needs
  deriving algebraic/shared predicates inside the `{b[4:3],a[4]}` cofactors,
  rather than adding more selector bits.

## 2026-06-09 Selected-Bit Hybrid Follow-Up

Additional run/result location:

- `student/runs/integer/ex266_ex276_frontend_highgap_struct2_20260609_1750/results/`

Tested:

- Top1/top2 selected-bit hybrids using the current cheap selector
  `{b[4:3],a[4]}` for low quotient bits and deeper selectors
  `{b[4:3],a[4:3]}` or `{b[4:2],a[4]}` for high quotient bits.

Result:

- No new best.  The closest row was `udiv_ex266_hybrid_top1_a43` at
  `142/11/1562`: lower area than current best, but one extra delay level makes
  ADP worse than `148/10/1480`.
- This suggests the current ex266 gap is not solved by selected high-bit
  deeper cofactors; future work needs a genuinely smaller delay-10 or delay-9
  shared classifier.
