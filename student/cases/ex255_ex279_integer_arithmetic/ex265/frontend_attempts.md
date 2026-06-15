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

## 2026-06-13 sub-integer-r74 official rows

Run ID: `frontend_source_parallel_round74_20260613_1439`, agent `sub-integer-r74`.

- `ex265_r74_qthreshold_ladder`: descending shared `q*b` threshold ladder; official `evaluate.py` equivalent, `155/20/3100`.
- `ex265_r74_divisor_case_const`: divisor-keyed constant quotient arms; official `evaluate.py` equivalent, `80/8/640`.
- Shard rows: `student/frontend_campaigns/campaigns/frontend_source_parallel_round74_20260613_1439/agent_shards/sub-integer-r74/candidates.csv`.
- Logs: `student/work/frontend_source_parallel_round74_20260613_1439/sub-integer-r74/ex265/logs/`.
- Outcome: both are nonwinning versus current frontend `63/8/504`. The divisor-case row reproduces the older delay-8 shape but with too much area; the threshold ladder is far too deep. Do not repeat these source families unchanged.

## 2026-06-14 integer-extra-r2 continuation

Run ID: `ex204_ex299_frontend_continuation_20260614_1216`, agent `integer-extra-r2`.

- Official `evaluate.py` OK rows: 10/10.
- Best row: `ex265_udiv_cof_bhi2_ahi1_bitbdd_wordmux_abc_g_aig`, `65/8/520`; nonwinning versus current frontend `63/8/504`.
- Failed directions: smaller/larger cofactor selector mixes, per-bit BDD search, and denominator-leading-zero range-low-BDD stayed exact but lost area at the same delay or increased delay. Current `bhi3+ahi1` word-mux remains the compact n=4 divider point.
