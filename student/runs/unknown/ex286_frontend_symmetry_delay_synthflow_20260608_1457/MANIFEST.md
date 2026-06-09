# ex286 Symmetry-BDD Delay-Target Synthflow Run

Run ID: `ex286_frontend_symmetry_delay_synthflow_20260608_1457`

Scope: `ex286` only.

Hypothesis: the symmetry-canonical BDD source for `ex286` had much lower area
than the current structural split seed but lost on delay. Tighter Yosys/ABC
delay targets might reduce the symmetry-BDD depth enough to beat the current
`1860/13/24180` structural synthflow result.

Seed policy: no files were created or updated under `student/seeds`; unknown
seed curation is deferred until the full `ex280-ex299` class converges.

## Inputs And Outputs

- Source run: `student/runs/unknown/ex285_ex289_frontend_symmetry_bdd_20260608_1429/`
- Source Verilog: `f10`, `f00`, and `zero` interleave symmetry-BDD policies for `ex286`
- Work dir: `student/work/ex286_frontend_symmetry_delay_synthflow_20260608_1457/`
- Results dir: `student/runs/unknown/ex286_frontend_symmetry_delay_synthflow_20260608_1457/results/`
- Official replay AIG dir: `student/runs/unknown/ex286_frontend_symmetry_delay_synthflow_20260608_1457/official_replay/`

## Verification

All 30 variants synthesized and passed ABC equivalence against
`benchmarks/ex286.truth`. The per-run best was replayed with
`evaluate.py --case ex286`:

| Case | Status | Area | Delay | ADP |
| --- | --- | ---: | ---: | ---: |
| ex286 | OK | 1435 | 17 | 24395 |

## Outcome

- No new current best.
- Best candidate: `ex286_symbdd_zero_abc_g_aig_d13`, `1435/17/24395`.
- The same result repeats for `zero_abc_g_aig_d13` through
  `zero_abc_g_aig_d17`.
- `f10` with `abc_g_aig_d13` through `abc_g_aig_d17` reached
  `1465/17/24905`.
- `f00` stayed worse at `1457/18/26226` for the `abc_g_aig` delay targets.
- Conclusion: lowering the ABC `-D` target below 18 does not reduce the
  symmetry-BDD source below delay 17. Further `ex286` work needs a different
  source structure, not tighter ABC delay targets on this BDD RTL.
