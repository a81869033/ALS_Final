# ex286-ex288 Streaming Prefix Diagnostic

- Run id: `ex286_ex288_frontend_streaming_prefix_diag_20260609_1517`
- Scope: `ex286`, `ex287`, `ex288`
- Work dir: `student/work/ex286_ex288_frontend_streaming_prefix_diag_20260609_1517/`
- Results dir: `student/runs/unknown/ex286_ex288_frontend_streaming_prefix_diag_20260609_1517/results/`
- Hypothesis: the conservative map may be expressible as a small-lookahead streaming/routing transducer where output prefixes are determined by input prefixes plus bounded lookahead.
- Classification: `semantic diagnostic`

## Method

For each case, the diagnostic tested input/output order pairs from:

- `natural`
- `reverse`
- `center`
- `onehot_slot`

For each pair it checked lookahead `0,1,2,3,4,6`.
For every output prefix length `k`, it measured whether that output prefix is determined by the first `k + lookahead` input bits in the chosen order.

## Results

- `ex286`: no order/lookahead determined even the first output prefix exactly. Best majority row was `onehot_slot -> onehot_slot` with lookahead `6`, majority ratio `0.892447`, but still had `2021` worst conflicts.
- `ex287`: no order/lookahead determined even the first output prefix exactly. Best majority row was `onehot_slot -> reverse` with lookahead `6`, majority ratio `0.777745`, with `7298` worst conflicts.
- `ex288`: no order/lookahead determined even the first output prefix exactly. Best majority row was `onehot_slot -> natural` with lookahead `6`, majority ratio `0.673291`; the lowest worst-conflict row still had `15890` conflicts.

## Conclusion

This rejects a small-lookahead streaming prefix/transducer source for `ex286`-`ex288` under the tested natural, reverse, center, and one-hot-slot orders.
No Verilog seed was emitted.
