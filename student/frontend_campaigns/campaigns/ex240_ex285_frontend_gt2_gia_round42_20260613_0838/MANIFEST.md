# ex240_ex285_frontend_gt2_gia_round42_20260613_0838

Run ID: `ex240_ex285_frontend_gt2_gia_round42_20260613_0838`

Purpose: continue frontend search for cases still above 2x reference,
using materially different ABC structural remap flows from current
official frontend best AIGs.

Scope:
- `local-close-gia-r42`: ex240, ex244, ex249, ex285

Verification:
- Every accepted candidate row is checked by repo `evaluate.py`.
- `iverilog` simulation is not used in this AIG-preserving remap round.

Notes:
- No `student/seeds` curation is performed.
