# ex282-ex284 Davio/Classonehot Bit Hybrid

Created: 2026-06-08 23:40 +0800

## Hypothesis

The prefix-Davio sources are low-area but delay-heavy, while classonehot
cofactor sources are lower-delay but higher-area.  This run builds exact
bit-level hybrids using classonehot for selected output bit groups and Davio
for the remaining bits, testing whether replacing the delay-critical bits can
lower ADP.

## Scope

- Cases: `ex282`, `ex283`, `ex284`
- Primary source: classonehot prefix-key cofactor Verilog
- Secondary source: current prefix-Davio Verilog
- Variants: selected high-bit, low-bit, and half-output groups per case
- Generator: `student/generators/unknown_bit_hybrid_search.py`
- Work directory: `student/work/ex282_ex284_frontend_davio_classonehot_bithybrid_20260608_2340/`

## Results

- Candidates: `results/candidates.csv`
- Best per case: `results/best.csv`
- Summary: `results/summary.csv`
- Generator evaluate check: `results/evaluate_check.csv`
- Official replay: `results/evaluate_replay.csv`
- Best AIG copies for this run only: `best_aigs/`

All 18 emitted candidates were equivalent and officially replayed through
`evaluate.py` (`18/18 OK`).  No candidate beat current.

Best ADPs:

- `ex282`: `992/32/31744`
- `ex283`: `1171/32/37472`
- `ex284`: `1255/34/42670`

## Conclusion

Replacing selected bits with classonehot can reduce delay, but the duplicated
logic and classonehot area cost outweigh the delay reduction.  The best raw
hybrids are all worse than the active Davio current rows.
