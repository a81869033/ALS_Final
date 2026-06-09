# ex286 Frontend Bit-Hybrid All-Rows Synthflow Run

Run ID: `ex286_frontend_bit_hybrid_allrows_synthflow_20260608_1552`

Scope: `ex286`.

Hypothesis: a non-best raw bit-hybrid row might map better under `abc_g_aig`
than the raw ADP ordering suggested.

Seed policy: no files were created or updated under `student/seeds`; unknown
seed curation is deferred until the full `ex280-ex299` class converges.

## Inputs And Outputs

- Seed CSV: `student/runs/unknown/ex286_frontend_bit_hybrid_20260608_1548/results/candidates.csv`
- Work dir: `student/work/ex286_frontend_bit_hybrid_allrows_synthflow_20260608_1552/`
- Results dir: `student/runs/unknown/ex286_frontend_bit_hybrid_allrows_synthflow_20260608_1552/results/`

## Verification

All 6 `abc_g_aig` rows passed ABC equivalence. The per-run best was replayed
with `evaluate.py`:

| Case | Best variant | Status | Area | Delay | ADP | Current best ADP |
| --- | --- | --- | ---: | ---: | ---: | ---: |
| ex286 | `primary_7_abc_g_aig` | OK | 1864 | 13 | 24232 | 24180 |

## Outcome

- No new current best.
- Other bit sets either kept delay 13 with area above current or reduced area
  only at delay 14.
- Do not repeat this exact structural/symmetry bit-hybrid family unless a new
  per-bit source is introduced.
