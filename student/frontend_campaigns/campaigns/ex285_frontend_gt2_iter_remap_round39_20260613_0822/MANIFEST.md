# ex285_frontend_gt2_iter_remap_round39_20260613_0822

Run ID: `ex285_frontend_gt2_iter_remap_round39_20260613_0822`

Purpose: continue frontend search for cases still above 2x reference,
using materially different ABC structural remap flows from current
official frontend best AIGs.

Scope:
- `local-ex285-iter-r39`: ex285

Verification:
- Every accepted candidate row is checked by repo `evaluate.py`.
- `iverilog` simulation is not used in this AIG-preserving remap round.

Notes:
- No `student/seeds` curation is performed.
