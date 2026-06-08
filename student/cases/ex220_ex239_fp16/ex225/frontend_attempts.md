# ex225 FP16 Frontend Attempts

Function hypothesis: `fp16_log10`.

Current known best:
- Run: `ex225_frontend_fp16_predecode_best_neighbor_20260607_1609`
- Variant: `ex225_manual15_14_13_predecode12_9_abc_g_aig`
- QoR: `11488/21/241248`
- Reference ADP: `116676`
- Ratio: `2.067675`
- Classification: `synthflow_exact`

Next maintenance items:
- Highest initial log-family priority by ratio.
- Verify true DAZ + log10(x) + FP16 RNE + FTZ + canonical NaN semantics.
- Try exponent-base plus mantissa-correction and sign/default field factoring.
- Record why any BDD/range/comparator method wins or loses.

## 2026-06-07 Log10 Shell And Casez Attempts

- Pure Python semantic check with DAZ/FTZ/RNE/canonical-NaN confirmed the
  `log10` direction but showed a first `1 ulp` mismatch at input `0x338f`
  (`expected 0xb903`, truth `0xb904`), so exact candidates must still use truth
  correction.
- Generated `ex225_fp16_log10_log10_special_shell`: exact but worse,
  `11628/24/279072` versus the then-current best `11616/23/267168`.
- Ran bounded casez interval compression (`t400`, `t600`, `t800`, `t1024`).
  Best was `t400`, exact but worse at `13234/25/330850`.
- Ran targeted selected-bit hybrids.  Best was
  `ex225_fp16_log10_bitrun_bit11_t8`, exact at `11573/23/266179`, improving
  the previous best `11616/23/267168`.
- Follow-up low-bit single covers (`bit10`, `bit9`, `bit8`, `bit7`) did not
  beat bit11.  Best low-bit candidate was bit8 at ADP `267030`.
- Follow-up multi-bit run-cover combinations found
  `ex225_fp16_log10_bitrun_bits12_9_t32`, exact at `11533/23/265259`.
- Re-emitting that same Verilog through the fixed single Yosys `abc -g aig`
  path produced `ex225_bitrun_bits12_9_t32_abc_g_aig`, official
  `evaluate.py --case ex225` OK at `11499/22/252978`.
- Exclusion: broad special-shell or interval casez compression increases delay
  and area.  Targeted selected-bit replacement can help, but only when the bit
  is critical; broad multi-bit and casez-sign combinations were mostly worse.
  Next useful direction is a true exponent-base plus mantissa correction
  normalizer, not another full positive-normal table rewrite.

## 2026-06-07 Semantic Normalizer Attempt

- Extended `student/generators/fp16_log_deep_semantic.py` to support
  `ex225/log10` and ran a targeted semantic normalizer:
  `base = (exp - bias) * log10(2)` plus a `log10(1.mant)` correction LUT,
  FP16 rounding, and exact exception correction.
- Exact best source candidate:
  `ex225_fp16_log10_fixed_q20_calibrated_exc`, `4061/73/296453`.
- A single `abc_g_aig` synthflow check improved that low-area semantic seed to
  `4028/70/281960`, still worse than the then-current best
  `11509/21/241689`.
- Bucketed const-exp and signsplit normalizers were exact but worse:
  bucket q20/q21 `450135`/`484570`; signsplit q20/q21 `346389`/`349488`.
- Exclusion: pure fixed-point log10 normalization is semantically correct and
  area-efficient, but the normalization/rounding/exception path is too deep
  under the current Yosys AIG flow.  Do not retry wider q-table variants unless
  the normalizer is made structurally shallower.

## 2026-06-07 Shallow Correction Deepening

- Re-emitted the near-miss bit-combo candidates with `abc_g_aig`.  Closest was
  `bits10_12_t16_abc_g_aig`, `11500/22/253000`, still worse than current.
- Added shared vector run-covers for selected output bits.  `bitvec_bits12_9`
  plus `abc_g_aig` reduced delay to 21 and improved ADP to
  `11512/21/241752`.
- Adding bit14 into the vector gave `11511/21/241731`; adding bit13 lowered
  area but increased delay to 22, so ADP was worse.
- Hand-derived bit14 threshold formula plus bitvec12/9 was best:
  `manual_ex225_bitvec12_9_bit14_abc_g_aig`, official `evaluate.py --case
  ex225` OK at `11509/21/241689`.
- Tested and excluded:
  - manual bit13 and bit12 formulas: lower/near area but delay 22.
  - threshold 16 table fallback for bitvec12/9: `11570/22/254540`.
  - packed table for non-overridden bits: `11650/22/256300`.
  - sparse sign-exp decoder for bitvec12/9: worse than auto case structure.
  - compact Boolean rewrite of bit14 predicate: `11598/22/255156`.
  - `abc_g_aig_d18` through `abc_g_aig_d21`: all reproduced
    `11509/21/241689`; `gates`/`cmos2` were worse.
- Current interpretation: the best shallow exact correction is manual bit14
  plus shared bit12/9 vector cover.  Further improvement likely needs a new
  way to reduce the bit9 transition tree or a different table sharing structure
  that keeps delay 21.

## 2026-06-07 Deeper Correction Search

- Looked up hardware elementary-function/table literature and translated the
  relevant exact-safe ideas into source-level experiments:
  - bipartite/multipartite-style high/low mantissa split,
  - lossless LUT decomposition/compression ideas,
  - piecewise/logarithm hardware structures using small LUT/correction stages,
  - BDD-style selected-bit logic.
- Added focused generator:
  `student/generators/fp16_ex225_hilo_correction.py`.
- High/low mantissa split for bit9/bit12:
  - Source best: `manual14_vec12_9_hilo_h4`, `11522/23/265006`.
  - After `abc_g_aig`, all high/low rows were checked; best was
    `manual14_vec12_9_hilo_h4_abc_g_aig`, `11477/22/252494`.
  - Exclusion: area can drop below current best, but delay stays 22 or area
    rises when delay returns to 21.
- Threshold-parity/toggle cover:
  - Best after `abc_g_aig`: `11520/22/253440`.
  - Exclusion: many parallel threshold comparisons plus XOR synthesize deeper
    than the current balanced run cover.
- Aligned `casez` cube covers for the complex `sign_exp=0x0e/0x0f` branches:
  - Best after `abc_g_aig`: `11584/22/254848`.
  - Exclusion: cube patterns do not beat comparator-tree factoring in AIG.
- Manual sign and manual bit13/bit12 cross-checks:
  - Best low-area seed was `manual15cmp_14_13_bitvec12_9_abc_g_aig`,
    `11471/22/252362`.
  - No-sign manual13 variants reached `11475/22/252450`.
  - Exclusion: useful as low-area alternatives, but every good one pays one
    extra delay level.
- ROBDD selected-bit attempts:
  - `bit12/bit9` BDD with sign-exp then mantissa-MSB order was close after
    `abc_g_aig`: `11554/21/242634`.
  - Other BDD orders were worse; all-bit BDD was exact but too deep
    (`11606/26/301756` after fixing the manual-bit wire bug).
  - Exclusion: selected-bit BDD is a valid backup seed but cannot reduce area
    below the current `11509/21` best at the same delay.
- Packed remaining-bits run table:
  - Best source candidate `t128` was `12360/25/309000`; after `abc_g_aig`,
    `12316/23/283268`.
  - Exclusion: run-compressing the full packed table saves source items but
    explodes mux/comparator depth.
- Current-best source with `parallel_case/full_case` attributes reproduced the
  same then-current `11509/21/241689`; attributes do not affect that seed.
- Best at the end of this round:
  `manual_ex225_bitvec12_9_bit14_abc_g_aig`, `11509/21/241689`, reference
  ratio `2.071454`.
- Stop rationale for this round:
  - semantic normalizer is exact and low-area but delay 70;
  - table compression, cube, high/low, BDD, toggle, manual sign/bit13, and
    Yosys-script variants were all exact-tested and fail to beat current ADP;
  - the observed frontier is either delay 21 with area >= 11509, or area <
    11509 with delay 22.

## 2026-06-07 Shared Predecode Breakthrough

- Added architecture-level variants to
  `student/generators/fp16_ex225_hilo_correction.py`:
  - multi-terminal BDD (MTBDD) shared across selected output bits,
  - shared threshold-predecode networks for bit12/bit9 and related high bits,
  - mixed predecode/tree hybrids for only complex `sign_exp` groups,
  - sign predicate style neighbors.
- MTBDD was exact but did not improve:
  - source candidates were `11595/23`, `11656/25`, `11625/23`,
    `11687/23`, `11686/24`.
  - after `abc_g_aig`, best was `manual14_mtbdd13_12_9_interleave`,
    `11653/21/244713`; delay 21 but area too high.
- Shared threshold predecode succeeded:
  - `manual15_14_13_predecode12_9_abc_g_aig`:
    `11488/21/241248`, official evaluate wrapper OK.
  - Structure: manual sign, bit14, and bit13 predicates; shared global
    threshold predecode for bit12/bit9.
  - This breaks the previous frontier by keeping delay 21 while dropping area
    from `11509` to `11488`.
- Neighbor/exclusion results:
  - `manual15bits_14_13_predecode12_9`: `11463/22/252186`, lower area but
    delay 22; delay targets `d18..d21` reproduced `11463/22`.
  - `manual15_14_predecode13_12_9`: `11484/22/252648`, delay 22.
  - `manual15bits2_14_13_predecode12_9`: `11482/22/252604`, delay 22.
  - mixed predecode only on complex groups (`0x0e/0x0f`, plus neighbors) all
    stayed delay 22 after `abc_g_aig`; best `11497/22/252934`.
  - New best Yosys neighbors `abc_g_aig_d18..d21` reproduced
    `11488/21/241248`; `extra_opt_share`, `synth_preset`, `gates`, and
    `cmos2` were worse.
- Curated seed bundle updated:
  `student/seeds/fp16/ex225_ex229_frontend_fp16_bitrun_shells_current/`.
- Current best:
  `ex225_manual15_14_13_predecode12_9_abc_g_aig`,
  `11488/21/241248`, reference ratio `2.067675`.

## 2026-06-07 Log-Family Nested Mantissa Follow-Up

Generator:
- `student/generators/fp16_log_nested_semantic.py`

Curated seed:
- `student/seeds/fp16/ex223_ex225_frontend_fp16_log_nested_current_20260607_2140/`

Best result:
- `ex225_log_nested_low12_hi5_abc_g_aig`, official `evaluate.py` OK at
  `11533/19/219127`, reference ratio `1.878081`.

Structure:
- Non-positive/special sign-exp groups are exact special/default table.
- Positive-normal log10 region is split by sign+exponent.
- Output high bits are per-exp mantissa run trees.
- Output low12 bits use a nested mantissa hi5/lo5 LUT.

Delta from previous best:
- Previous current best was `manual15_14_13_predecode12_9_abc_g_aig`,
  `11488/21/241248`.
- New nested seed raises area by 45 but cuts delay from 21 to 19, improving ADP
  by `22121`.

Exclusions from this nested family:
- `low8`, `low9`, and `low11` were exact and improved earlier rows, but
  `low12_hi5` was best.
- `low12_hi6`, `low13_hi5`, and `low13_hi6` did not beat `low12_hi5`.
- `hi4` gave lower area on some rows but delay 20; `hi6/hi7` generally raised
  area too much for ex225.

Next useful direction:
- The nested source is now the best exact frontend seed, but it is still above
  `1.5x` reference.  Future work should target a shallower arithmetic
  exponent-base/mantissa-correction normalizer, or compress the low12 nested
  LUT without reintroducing the high delay seen in the fixed-point normalizer.
