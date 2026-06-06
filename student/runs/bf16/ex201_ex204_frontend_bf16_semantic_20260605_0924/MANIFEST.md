# ex201_ex204_frontend_bf16_semantic_20260605_0924

- Domain: BF16 ex201-ex204
- Stage: frontend semantic reconstruction only
- Truth convention: `student.frontends.truth.TruthTable` / ABC `read_truth -xf`
- Backend portfolios: not run
- Work directory: `student/work/ex201_ex204_frontend_bf16_semantic_20260605_0924/`
- Results: `student/runs/bf16/ex201_ex204_frontend_bf16_semantic_20260605_0924/results/`
- Official recheck: `evaluate_check.csv`, 25/25 candidates OK

## Semantic Findings

| Case | Function Guess | Best Variant | Area | Delay | ADP |
| --- | --- | --- | ---: | ---: | ---: |
| ex201 | DAZ + 2^x + BF16 RNE + FTZ + canonical NaN | structural_exp_mant_pair_case | 1599 | 15 | 23985 |
| ex202 | DAZ + 10^x + BF16 RNE + FTZ + canonical NaN | semantic_sign_exp_field_defaults | 3702 | 16 | 59232 |
| ex203 | DAZ + ln(x) + BF16 RNE + FTZ + canonical NaN | structural_sign_exp_mant_case | 4546 | 18 | 81828 |
| ex204 | DAZ + log2(x) + BF16 RNE + FTZ + canonical NaN | structural_exp_mant_delta_pair | 1679 | 18 | 30222 |

## Notes

- Candidates were generated case-by-case from the verified semantic model and the local truth table.
- Yosys synthesis to AIG and ABC CEC/ADP measurement were run for each candidate.
- Official `evaluate.py` recheck passed for all equivalent candidates, including the later manual Q18 semantic ex204 candidate.
