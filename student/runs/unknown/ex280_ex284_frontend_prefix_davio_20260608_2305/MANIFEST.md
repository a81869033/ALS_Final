# ex280-ex284 Prefix-Key Davio

Created: 2026-06-08 23:05 +0800

## Hypothesis

The prefix-parity transformed output may be compact as a positive-Davio
decision DAG over transformed input bits.  This run emits the full
prefix-key ANF residual through Davio (`threshold=0`) with the generator's
best-residual order, testing whether the low-area ANF structure can replace
the cofactor-BDD mux structure.

## Scope

- Cases: `ex280`, `ex281`, `ex282`, `ex283`, `ex284`
- Transform: `prefix_parity_reduce`
- Threshold: `0`
- Order: `best_residual`
- Generator: `student/generators/unknown_anf_layered_davio_search.py`
- Work directory: `student/work/ex280_ex284_frontend_prefix_davio_20260608_2305/`

## Results

- Candidates: `results/candidates.csv`
- Best per case: `results/best.csv`
- Summary: `results/summary.csv`
- Generator evaluate check: `results/evaluate_check.csv`
- Official replay: `results/evaluate_replay.csv`
- Best AIG copies for this run only: `best_aigs/`

All 5 emitted candidates were truth-model exact, synthesized, equivalent, and
officially replayed through `evaluate.py` (`5/5 OK`).  No candidate beat the
current best for any case.

Best ADPs:

- `ex280`: `703/36/25308`
- `ex281`: `812/40/32480`
- `ex282`: `882/42/37044`
- `ex283`: `1049/46/48254`
- `ex284`: `1097/44/48268`

## Conclusion

Prefix Davio is a real low-area signal, but the source form is too deep.  It
should not be repeated as a full residual Davio tree unless paired with a
source-level depth rewrite, selected-bit use, or a different variable schedule.
