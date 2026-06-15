# ex240_ex299_frontend_gt2_round32_20260613_0738

Run ID: `ex240_ex299_frontend_gt2_round32_20260613_0738`

Purpose: continue frontend search for cases still above 2x reference,
using materially different ABC structural remap flows from current
official frontend best AIGs.

Scope:
- `local-diverse-r32`: ex247, ex246, ex240, ex244, ex249, ex242, ex245

Verification:
- Every accepted candidate row is checked by repo `evaluate.py`.
- `iverilog` simulation is not used in this AIG-preserving remap round.

Notes:
- No `student/seeds` curation is performed.
