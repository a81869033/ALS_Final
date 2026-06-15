# ex200_ex299_frontend_refgap_round8_20260612_1826

Run ID: `ex200_ex299_frontend_refgap_round8_20260612_1826`

Purpose: Continue frontend seed search on the largest remaining frontend/reference gaps after round5, round6, and the local ex286 bitset probe. This round uses disjoint worker shards plus coordinator-side ex286 follow-up.

Required authority: official `evaluate.py` equivalence/QoR only.

Artifacts:
- Campaign directory: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round8_20260612_1826/`
- Work root: `student/work/ex200_ex299_frontend_refgap_round8_20260612_1826/`
- Run roots: `student/runs/{unknown,float_fp8,fp16,bf16,integer}/ex200_ex299_frontend_refgap_round8_20260612_1826/`

Methods:
- unknown routing descriptors for `ex285`, `ex287`, `ex288`
- unknown global/cyclic state descriptors for `ex292`, `ex294`, `ex295`, `ex297`, `ex299`
- FP8 conversion shared decode/round/saturation variants for `ex240`, `ex244`, `ex246`, `ex247`
- mixed high-gap fp16/bf16/integer hypotheses for `ex223`, `ex225`, `ex200`, `ex204`, `ex205`, `ex260`, `ex266`, `ex270`
- coordinator ex286 explicit outer-bitset neighborhood follow-up
