# ex285_ex297_ex299_frontend_gt2_round33_20260613_0744

Run ID: `ex285_ex297_ex299_frontend_gt2_round33_20260613_0744`

Purpose: continue frontend search for cases still above 2x reference,
using materially different ABC structural remap flows from current
official frontend best AIGs.

Scope:
- `local-unknown-r33`: ex297, ex299, ex285

Verification:
- Every accepted candidate row is checked by repo `evaluate.py`.
- `iverilog` simulation is not used in this AIG-preserving remap round.

Notes:
- No `student/seeds` curation is performed.
