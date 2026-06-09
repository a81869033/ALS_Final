# ex280-ex284 Prefix-Key Davio Synthflow

Created: 2026-06-08 23:15 +0800

## Hypothesis

The full prefix-key Davio source has attractive area but poor delay under the
default Verilog-to-AIG script.  This run performs a narrow frontend synthflow
check on the best endpoint-order Davio rows to see whether Yosys/ABC AIG
mapping can preserve the low area and improve ADP.

## Scope

- Cases: `ex280`, `ex281`, `ex282`, `ex283`, `ex284`
- Input rows: `student/runs/unknown/ex280_ex284_frontend_prefix_davio_orders_20260608_2306/results/best.csv`
- Flows: `abc_g_aig`, `synth_preset`, `extra_opt_share`, `abc_g_aig_d24`, `abc_g_aig_d28`
- Wrapper: `student/work/ex280_ex284_frontend_prefix_davio_synthflow_20260608_2315/scripts/synthflow_from_best_csv.py`
- Work directory: `student/work/ex280_ex284_frontend_prefix_davio_synthflow_20260608_2315/`

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

- `ex280`: `602/31/18662` (`abc_g_aig`), not better than current `17220`
- `ex281`: `683/33/22539` (`abc_g_aig`), not better than current `20592`
- `ex282`: `761/35/26635` (`abc_g_aig`), new current best
- `ex283`: `851/35/29785` (`abc_g_aig`), new current best
- `ex284`: `921/42/38682` (`abc_g_aig`), new current best

## Conclusion

`abc_g_aig` is the useful mapping for this Davio source.  Delay did not improve
from endpoint-order Davio, but area dropped enough to make `ex282`, `ex283`,
and `ex284` new verified frontend bests.  This reverses the earlier conclusion:
full prefix-key Davio is not a final answer for `ex280/ex281`, but it is now an
active low-area source for wider cases and a promising base for selected-bit or
depth-focused rewrites.
