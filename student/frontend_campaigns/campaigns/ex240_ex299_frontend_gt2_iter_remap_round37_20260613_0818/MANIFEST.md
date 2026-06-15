# ex240_ex299_frontend_gt2_iter_remap_round37_20260613_0818

Run ID: `ex240_ex299_frontend_gt2_iter_remap_round37_20260613_0818`

Purpose: continue frontend search for cases still above 2x reference,
using materially different ABC structural remap flows from current
official frontend best AIGs.

Scope:
- `local-close-iter-r37`: ex240, ex244, ex285, ex249

Verification:
- Every accepted candidate row is checked by repo `evaluate.py`.
- `iverilog` simulation is not used in this AIG-preserving remap round.

Notes:
- No `student/seeds` curation is performed.
