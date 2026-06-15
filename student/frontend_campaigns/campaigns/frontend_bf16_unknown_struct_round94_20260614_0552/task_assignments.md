# Task Assignments

Run: `frontend_bf16_unknown_struct_round94_20260614_0552`

| agent_id | cases | domain | focus | status |
| --- | --- | --- | --- | --- |
| `sub-bf16-exp-log-r94` (`019ec2fd-70db-7ee1-ac69-b13ee71a0249`) | ex200, ex201, ex202, ex203, ex204, ex205 | bf16 | exp/exp2/exp10/log/log2/log10 source-level semantic shell, field split, compact residuals | completed: 7 official equivalent, no frontend improvement |
| `sub-bf16-trig-hyp-r94` (`019ec2fd-a3b0-7981-9f9d-e920836c2544`) | ex206, ex207, ex208, ex209, ex210 | bf16 | sin/tan/sinh/tanh/sigmoid exact regions, symmetry, range descriptors, constant/saturation sharing | completed: 15 official equivalent, no frontend improvement |
| `sub-bf16-recip-power-r94` (`019ec2fd-d5f5-72f3-abcc-ef31b9f85b65`) | ex211, ex212, ex213, ex214, ex215, ex216, ex217, ex218, ex219 | bf16 | reciprocal/square/sqrt/cube/cbrt exponent-affine and mantissa transform RTL | completed: 27 official equivalent, ex219 frontend improvement |
| `sub-unknown-286287-r94` (`019ec2fe-0c0c-7b53-8895-c291d22846b4`) | ex286, ex287 | unknown | hamming-weight routing/normalizer hidden-state, decision graph, descriptor, source-level hybrid grouping | completed: 26 official equivalent, no frontend improvement |

Coordinator merge rules:
- Each shard writes only under its own `agent_shards/<agent_id>/`, `student/work/<run_id>/<agent_id>/`, and `student/runs/<domain>/<run_id>/<agent_id>/` paths.
- `candidates.csv` and `evaluation_results.csv` contain only official
  `evaluate.py` rows.
- Non-equivalent, synthesis-failed, blocked, or replay-risk methods go to
  `failed_hypotheses.csv`.
- The coordinator will merge with `merge_round94_results.py`, run sanity
  checks for missing paths and duplicate signatures, then rebuild the frontend
  campaign index.
