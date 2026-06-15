# Task Assignments

| agent_id | cases | scope | status |
|---|---|---|---|
| `sub-fp8-muldiv-r62` | `ex246`, `ex247` | Source-only E5M2 multiply/divide search beyond round60 sigpair predicates and quotient-region split. | completed; best `ex246 371/24/8904`, `ex247 309/30/9270`, no frontend-best improvement |
| `sub-fp8-addhyp-r62` | `ex240`, `ex244`, `ex249` | Source-only FP8 add/hypot search beyond round54/60/61 nonwinning mixed forms. | completed; best `ex240 582/46/26772`, `ex244 311/32/9952`, `ex249 172/28/4816`, no frontend-best improvement |
| `sub-unk285-r62` | `ex285` | Source-only unknown routing/state search beyond twopair selector and countkey residual tables. | completed; best `2953/18/53154`, no frontend-best improvement |
| `sub-unklarge-r62` | `ex297`, `ex299` | Source-only unknown-large nonlocal state basis search beyond symbol-plane and ring-prefix diagnostics. | completed; no official candidate; `ex297` descriptor shrank residual to `3808` but Yosys failed, `ex299` shrank to `30640` but source estimate was too large |
