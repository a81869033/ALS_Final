# ex200_ex299_frontend_refgap_round9_20260612_1855

Run ID: `ex200_ex299_frontend_refgap_round9_20260612_1855`

Purpose: Continue frontend high-gap search after round8. Focus on cases still far from `reference_result.csv`, especially `ex286`, `ex287`, `ex247`, `ex246`, `ex297`, `ex299`, `ex285`, `ex244`, `ex240`, and selected fp16/bf16/integer high gaps.

Authority: Only official `evaluate.py` equivalence/QoR rows can count as valid candidates or improvements.

Artifacts:
- Campaign: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round9_20260612_1855/`
- Work root: `student/work/ex200_ex299_frontend_refgap_round9_20260612_1855/`
- Run roots: `student/runs/{unknown,float_fp8,fp16,bf16,integer}/ex200_ex299_frontend_refgap_round9_20260612_1855/`

Round9 focus:
- Routing/normalizer: escape ex286/ex287 cofactor delay wall with materially different compact descriptors.
- FP8: continue ex247 source/synth-flow gains and find real sharing improvements for ex240/ex244/ex246.
- State/cyclic unknown: repair round8 synthesis blockers and test compact state/cell descriptor RTL.
- Mixed high-gap: focus on non-repeated fp16/bf16/integer source-sharing ideas.
