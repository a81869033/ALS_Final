# ex286-ex288 Bucket Top-K Score Diagnostic

- Run id: `ex286_ex288_frontend_bucket_topk_score_diag_20260609_1458`
- Scope: `ex286`, `ex287`, `ex288`
- Work dir: `student/work/ex286_ex288_frontend_bucket_topk_score_diag_20260609_1458/`
- Results dir: `student/runs/unknown/ex286_ex288_frontend_bucket_topk_score_diag_20260609_1458/results/`
- Hypothesis: the exact bucket-count key function may be a conservative top-k routing model where each output slot receives a score from bucket counts/selectors, and the output is the top `popcount(input)` slots.
- Classification: `semantic diagnostic`

## Method

The diagnostic reuses the exact bucket-count decompositions:
- `ex286`: `8` one-hot buckets plus selectors `raw3:raw10:xor6_7`.
- `ex287`: `7` one-hot buckets plus selectors `xor6_7:xor8_9:raw13:raw12`.
- `ex288`: `9` one-hot buckets plus selectors `raw13:raw10:xor6_7`.

It trains deterministic online ranking perceptrons for top-k prediction using:
- `counts`
- `counts_selectors`
- `counts_selectors_quad` smoke on `ex286`

No Verilog seed was emitted because the models were far from exact.

## Results

- `ex286`: best smoke row `counts_selectors_quad` matched only `286/8192` rows.
- `ex287`: best full diagnostic matched only `87/16384` rows.
- `ex288`: best full diagnostic matched only `137/32768` rows.

## Conclusion

The exact bucket-count key is not explained by a simple linear or short quadratic score-and-top-k routing model.
This rejects a plausible comparator/top-k frontend structure for ex286-ex288.
Future work needs a richer nonlinear state or factorization of the bucket-key function, not a score sorting network over counts/selectors.
