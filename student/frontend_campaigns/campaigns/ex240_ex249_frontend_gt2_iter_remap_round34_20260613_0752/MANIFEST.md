# ex240_ex249_frontend_gt2_iter_remap_round34_20260613_0752

Run ID: `ex240_ex249_frontend_gt2_iter_remap_round34_20260613_0752`

Purpose: continue frontend search for cases still above 2x reference,
using materially different ABC structural remap flows from current
official frontend best AIGs.

Scope:
- `local-fp8-iter-r34`: ex247, ex246, ex240, ex244, ex249, ex245

Verification:
- Every accepted candidate row is checked by repo `evaluate.py`.
- `iverilog` simulation is not used in this AIG-preserving remap round.

Notes:
- No `student/seeds` curation is performed.
