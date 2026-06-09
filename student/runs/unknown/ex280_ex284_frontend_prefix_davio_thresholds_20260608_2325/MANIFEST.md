# ex280-ex284 Prefix-Key Davio Threshold Splits

Created: 2026-06-08 23:25 +0800

## Hypothesis

The full prefix-key Davio source may be too deep because every ANF term is
inside the Davio residual.  This run moves low-degree ANF terms out into direct
shared product/XOR logic (`threshold=1,2,3`) and leaves only the higher-degree
residual in Davio form, testing whether a simple area-for-delay tradeoff can
beat the full Davio source.

## Scope

- Cases: `ex280`, `ex281`, `ex282`, `ex283`, `ex284`
- Transform: `prefix_parity_reduce`
- Thresholds: `1`, `2`, `3`
- Orders: `endpoint`, `endpoint_rev`
- Generator: `student/generators/unknown_anf_layered_davio_search.py`
- Work directory: `student/work/ex280_ex284_frontend_prefix_davio_thresholds_20260608_2325/`

## Results

- Candidates: `results/candidates.csv`
- Best per case: `results/best.csv`
- Summary: `results/summary.csv`
- Generator evaluate check: `results/evaluate_check.csv`
- Official replay: `results/evaluate_replay.csv`
- Best AIG copies for this run only: `best_aigs/`

All 30 emitted candidates were equivalent and officially replayed through
`evaluate.py` (`30/30 OK`).  No raw threshold split beat current.

Best ADPs:

- `ex280`: `742/31/23002`
- `ex281`: `807/33/26631`
- `ex282`: `927/35/32445`
- `ex283`: `1043/39/40677`
- `ex284`: `1142/39/44538`

## Conclusion

Pulling low-degree terms out of the residual is not enough by itself.  Degree-1
endpoint-reversed is the best threshold split for every case; higher thresholds
reduce delay slightly but increase area much faster.  This motivated the
separate narrow synthflow check on the degree-1 rows.
