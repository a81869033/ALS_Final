# ex286 Frontend Bit-Hybrid Synthflow Run

Run ID: `ex286_frontend_bit_hybrid_synthflow_20260608_1550`

Scope: `ex286`.

Hypothesis: the best raw bit-hybrid source was close enough that a small Yosys
synthflow check might reduce area at delay 13 or 14 and beat the current
`1860/13/24180` structural synthflow result.

Seed policy: no files were created or updated under `student/seeds`; unknown
seed curation is deferred until the full `ex280-ex299` class converges.

## Inputs And Outputs

- Seed CSV: `student/runs/unknown/ex286_frontend_bit_hybrid_20260608_1548/results/best.csv`
- Work dir: `student/work/ex286_frontend_bit_hybrid_synthflow_20260608_1550/`
- Results dir: `student/runs/unknown/ex286_frontend_bit_hybrid_synthflow_20260608_1550/results/`

## Verification

All 5 synthflow rows passed ABC equivalence. The per-run best was replayed with
`evaluate.py`:

| Case | Best variant | Status | Area | Delay | ADP | Current best ADP |
| --- | --- | --- | ---: | ---: | ---: | ---: |
| ex286 | `abc_g_aig` | OK | 1864 | 13 | 24232 | 24180 |

## Outcome

- No new current best.
- `abc_g_aig`, `abc_g_aig_d18`, and `abc_g_gates` all reached `1864/13/24232`,
  only 52 ADP worse than current but still not an improvement.
- `synth_preset` reduced area to 1841 but delay rose to 14.
