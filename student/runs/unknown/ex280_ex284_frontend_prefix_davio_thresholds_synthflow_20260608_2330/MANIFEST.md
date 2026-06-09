# ex280-ex284 Prefix-Key Davio Threshold Synthflow

Created: 2026-06-08 23:30 +0800

## Hypothesis

The degree-1 prefix-Davio split lowers delay for some cases but is area-heavy
under the default Verilog-to-AIG script.  This run applies the same narrow
frontend synthflow used for full Davio to the best threshold-split row for each
case.

## Scope

- Cases: `ex280`, `ex281`, `ex282`, `ex283`, `ex284`
- Input rows: `student/runs/unknown/ex280_ex284_frontend_prefix_davio_thresholds_20260608_2325/results/best.csv`
- Flows: `abc_g_aig`, `synth_preset`, `extra_opt_share`, `abc_g_aig_d24`, `abc_g_aig_d28`
- Wrapper: `student/work/ex280_ex284_frontend_prefix_davio_synthflow_20260608_2315/scripts/synthflow_from_best_csv.py`
- Work directory: `student/work/ex280_ex284_frontend_prefix_davio_thresholds_synthflow_20260608_2330/`

## Results

- Candidates: `results/candidates.csv`
- Best per case: `results/best.csv`
- Summary: `results/summary.csv`
- Generator evaluate check: `results/evaluate_check.csv`
- Official replay: `results/evaluate_replay.csv`
- Best AIG copies for this run only: `best_aigs/`

All 25 emitted AIGs were equivalent and officially replayed through
`evaluate.py` (`25/25 OK`).

Best ADPs:

- `ex280`: `622/31/19282`, not better than current
- `ex281`: `700/33/23100`, not better than current
- `ex282`: `761/35/26635`, tied current full-Davio synthflow
- `ex283`: `872/39/34008`, worse than current
- `ex284`: `969/39/37791`, new current best

## Conclusion

Degree-1 split is only useful for `ex284`, where the delay drop from `42` to
`39` outweighs the area increase.  For `ex282`, it ties the full-Davio
`abc_g_aig` result; for the other cases it regresses.  Future Davio work should
use case-specific depth rewrites rather than a uniform low-degree split.
