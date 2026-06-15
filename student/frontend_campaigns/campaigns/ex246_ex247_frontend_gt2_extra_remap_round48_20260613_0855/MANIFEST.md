# ex246_ex247_frontend_gt2_extra_remap_round48_20260613_0855

Run ID: `ex246_ex247_frontend_gt2_extra_remap_round48_20260613_0855`

Purpose: continue frontend search for cases still above 2x reference,
using materially different ABC structural remap flows from current
official frontend best AIGs.

Scope:
- `local-fp8-extra-r48`: ex247, ex246

Verification:
- Every accepted candidate row is checked by repo `evaluate.py`.
- `iverilog` simulation is not used in this AIG-preserving remap round.

Notes:
- No `student/seeds` curation is performed.
