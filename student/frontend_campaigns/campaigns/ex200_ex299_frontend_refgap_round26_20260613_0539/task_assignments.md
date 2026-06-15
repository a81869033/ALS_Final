# Round26 Task Assignments

Run ID: `ex200_ex299_frontend_refgap_round26_20260613_0539`

Coordinator assumptions:
- Case lists are disjoint.
- Agents must write only under their own `<run_id>/<agent_id>/<case>/` paths and shard paths.
- Agents must not edit `prompt_log.md`, `student/seeds`, or global registry/search/gap CSVs.
- Coordinator will merge shards, verify official `evaluate.py` status, update global CSVs, and rebuild the index.

Assignments:

| agent_id | cases | focus |
|---|---|---|
| `unknown-sym-r26` | `ex286`, `ex287`, `ex285`, `ex288` | Worst routing/normalizer gaps; avoid round25 fixed-popcount decision forests, input-delta shared BDDs, output-gray BDDs, and exact symcof/key-BDD replay. |
| `fp8-r26` | `ex247`, `ex246`, `ex244`, `ex240`, `ex245`, `ex241`, `ex242`, `ex249`, `ex248` | FP/BF to FP8 conversions; avoid round25 direct-active, low-attribute, gap-split, and no-equivalent replay; seek clearer rounding/saturation predicate sharing. |
| `unknown-large-r26` | `ex297`, `ex299`, `ex294`, `ex295`, `ex292` | Large unknown transforms; avoid r24/r25 plain cell-basis/symbol-plane replay. For `ex292`, extend mod4 output-plane grouping only with material area-reduction or structural explanation. |
| `mixed-r26` | `ex225`, `ex223`, `ex274`, `ex218`, `ex204`, `ex266`, `ex273`, `ex260` | Mixed FP16/integer/BF16 high gaps; avoid round25 exact integer square half-product/fullrow/hybrid BDD replays and BF16/FP16 nested/residual replay. |
| `coordinator-integer-r26` | `ex276` | Coordinator-local disjoint integer sqrt probe while agents run; per-output prefix4 interval casebits and global high-bit extraction. |

Required per-agent outputs:
- `candidates.csv`
- `evaluation_results.csv`
- `best_improvements.csv`
- `failed_hypotheses.csv`
- `simulation_results.csv`
- `shared_structure_report.csv`
- `case_outcomes.csv`
- `agent_summaries/<agent_id>.md`

Launch prompt logged in `prompt_log.md` at `2026-06-13 05:39:46 +0800`.
