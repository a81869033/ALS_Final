# ex205-ex209 BF16 Frontend Attempts

Run: `ex205_ex209_frontend_bf16_semantic_20260606_0946`

Results:
- CSV: `student/runs/bf16/ex205_ex209_frontend_bf16_semantic_20260606_0946/results/`
- Active work: `student/work/ex205_ex209_frontend_bf16_semantic_20260606_0946/`
- Archived low-value intermediates: `student/archive/cleanup_20260606/ex205_ex209_frontend_bf16_semantic_20260606_0946_low_value_intermediates/`
- Official best recheck: `results/evaluate_official_best.csv`

Truth convention:
- All candidates use `student.frontends.truth.TruthTable` with ABC `read_truth -xf` indexing.
- Best candidates were also rechecked with `evaluate.py --case` using a run-local output directory.

## Semantic Identification

All five cases match BF16 unary functions under DAZ input, FTZ output, RNE rounding, and canonical NaN:

| Case | Semantics | Special behavior |
| --- | --- | --- |
| ex205 | `log10(x)` | zero/denormal to `-inf`; negative normal to canonical NaN; positive inf to inf; NaN to canonical NaN |
| ex206 | `sin(x)` | odd symmetry; exp=255 to canonical NaN |
| ex207 | `tan(x)` | odd symmetry; exp=255 to canonical NaN |
| ex208 | `sinh(x)` | odd symmetry; large normal saturation to signed inf; NaN canonical |
| ex209 | `tanh(x)` | odd symmetry; large normal saturation to signed 1.0; NaN canonical |

## Best Seeds

| Case | Best variant | Area | Delay | ADP | Old ADP | Improvement | Reference ratio |
| --- | --- | ---: | ---: | ---: | ---: | ---: | ---: |
| ex205 | `sep_fields_e3_m3_s0_bits_15_bh1` | 4463 | 17 | 75871 | 83358 | 8.98% | 1.609892 |
| ex206 | `odd_pos_fullword_h4` | 26872 | 21 | 564312 | 640332 | 11.87% | 1.046866 |
| ex207 | `odd_pos_fullword_expflip_h4` | 29873 | 21 | 627333 | 775654 | 19.12% | 0.999229 |
| ex208 | `default_in_const_excepts_h4` | 2167 | 15 | 32505 | 33120 | 1.86% | 1.326464 |
| ex209 | `sign_exp_default_expr_casez` | 756 | 13 | 9828 | 9945 | 1.18% | 1.342623 |

## Case Notes

### ex205 log10

Useful:
- `sep_fields_e3_m3_s0_bits_15_bh1` beat the prior `sign_exp_mant_case` by splitting output fields and overriding the output sign bit with a shallow truth-derived predicate.
- `hilo3_word_mode` was close and remains a useful structural baseline.

Tried and excluded:
- Corrected semantic exponent-base plus mantissa delta was exact but too deep (`4549/23/104627`).
- Hand formula for output sign, `(exp==0) || (!sign && exp<127)`, was exact but synthesized worse (`4475/18/80550`).
- Bitplanes and full-output BDDs did not reduce ADP; best BDD was `4332/23/99636`.
- Legacy structural families were all worse than the new selected-bit seed.
- Positive-domain monotone range encoding was exact but poor: range `casez`
  was `13255/23/304865`, balanced range tree was `12327/30/369810`, and the
  linear comparator chain timed out in Yosys.
- Output exponent range-runs plus mantissa hi/lo table was exact but worse;
  best tested was `log10_exp_runs_mant_sep_m3` at `4767/18/85806`.

Stopping reason:
- No remaining frontend-only source representation tested so far gives both the low delay of the selected-bit seed and the low area implied by the reference. A better result likely needs a new semantic arithmetic/log10 decomposition that avoids the long exponent-base conversion path.

### ex206 sin

Useful:
- Positive-domain full-word odd symmetry was best.
- Positive-domain full-word odd symmetry `odd_pos_fullword_h4` improved ADP to `564312` and became the best seed.
- `split_sign_word_h4_first` was close at `569730` and remains a useful alternate seed.

Tried and excluded:
- Magnitude-only odd symmetry was wrong for periodic functions because positive inputs can produce negative outputs.
- Full-word odd h5/h6 and exp=255 NaN shortcut increased delay.
- Selected-bit overrides on h4 word increased area or failed equivalence for comparator-run form.
- Separate-field variants were worse than word-mode split-sign tables.

Stopping reason:
- Positive-domain full-word h4 is the best area/delay balance found; h3 is too large, while h5/h6 reduce or hold area but add delay.

### ex207 tan

Useful:
- Positive-domain full-word odd symmetry became best after simplifying the
  output sign flip to `flip_sign = sign & (exp != 8'hff)`.
- `odd_pos_fullword_expflip_h4` reached `29873/21/627333`, slightly beating
  the reference ADP `627817`.
- Split-sign mixed h5/h6 special was a useful near miss at `30193/21/634053`.

Tried and excluded:
- Exp=255 output mux shortcut worsened QoR.
- h3/h5/h6 expflip and first-base variants either increased delay or area.
- h4/h6 mixed split lowered area in some cases but did not beat expflip h4.
- Legacy exp/mant pair remained at the older `775654` ADP.

Stopping reason:
- The best found source-level balance now beats reference by a small margin.
  Remaining tested alternatives all trade lower local table size for worse
  delay or area; further improvement likely needs a new tan-specific
  range-reduction or transition-region semantic structure.

### ex208 sinh

Useful:
- Input-default exception table with direct constant sign-exp groups improved the legacy split-sign seed.
- `default_in_const_excepts_h4` reached `2167/15/32505`.
- The exact sign formula `sign && !(exp==255 && mant!=0)` was verified but not best.

Tried and excluded:
- Signed-inf default was worse than input default.
- Manual sign-bit override increased delay/ADP.
- h5/h6 exception granularity increased delay and area.

Stopping reason:
- The best remaining structure is a compact passthrough/default seed with constant saturation groups. Further source rewrites tried so far trade lower local table size for worse critical path.

### ex209 tanh

Useful:
- Range-compressed sign-exp default expression improved the prior legacy best from `9945` to `9828`.
- Low-area manual sign-bit default variants are useful alternatives but delay 14 lost ADP.

Tried and excluded:
- Direct input-default constant exception variants reduced area as low as `710-713` but delay rose to 14 or 15.
- Positive-domain and delta variants were exact but worse than compressed sign-exp defaults.
- Signed-one default was worse than the sign-exp default-expression structure.

Stopping reason:
- The function is already compact as sign-exp default expressions. Further improvements likely need hand formulas for the small transition exponent range that do not add comparator depth.
