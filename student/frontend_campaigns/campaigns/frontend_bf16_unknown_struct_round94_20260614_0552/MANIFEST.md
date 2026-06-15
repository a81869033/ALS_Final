# frontend_bf16_unknown_struct_round94_20260614_0552

Run ID: `frontend_bf16_unknown_struct_round94_20260614_0552`

Purpose: frontend-only structural search for all BF16 unary cases `ex200-ex219`
plus `ex286` and `ex287`, using the senior recording, PPT, and
`introduction.md` as method priors while looking for lower-ADP Verilog
representations.

Scope:
- Frontend only: truth/high-level description to Verilog/AIG seed generation.
- Official success requires repo `evaluate.py` equivalent with area, delay,
  ADP, Verilog path, AIG path, and log path.
- No backend portfolio, post-AIG remap, ABC9/MockTurtle/CULS iteration, or
  Cross-AIG structural hashing at AIG level.
- Cross-representation ideas from the recording/PPT may be tried only as
  source-level RTL/output grouping changes before frontend synthesis.

Inputs:
- Truth files: `benchmarks/ex200.truth` through `benchmarks/ex219.truth`,
  `benchmarks/ex286.truth`, `benchmarks/ex287.truth`.
- Frontend registry: `student/frontend_campaigns/frontend_best_registry.csv`.
- Gap/state files: `student/frontend_campaigns/current_frontend_gap.csv`,
  `student/frontend_campaigns/search_state.csv`.
- Prior judgments: `student/frontend_campaigns/method_judgments.csv`,
  `student/frontend_campaigns/manual_judgments.csv`,
  `student/frontend_campaigns/hypothesis_bank.csv`.
- Case indexes: `student/frontend_campaigns/case_index/ex200.md` through
  `ex219.md`, plus `ex286.md`, `ex287.md`.
- Human guidance: `introduction.md`, `ref/IWLS26_presentation.pdf`,
  `ref/新錄音 20.txt`.

Artifacts:
- Campaign directory: `student/frontend_campaigns/campaigns/frontend_bf16_unknown_struct_round94_20260614_0552/`
- Work directory: `student/work/frontend_bf16_unknown_struct_round94_20260614_0552/<agent_id>/<case>/`
- Run summaries: `student/runs/<domain>/frontend_bf16_unknown_struct_round94_20260614_0552/<agent_id>/<case>/`
- Result CSVs: `results/*.csv`

Methods to try:
- BF16 field split with shared special/zero/inf/NaN predicates and smaller
  mantissa/exponent residuals.
- BF16 semantic-shell rewrites that change output grouping, not just hi/lo LUT
  granularity already rejected in prior rounds.
- Trig/hyperbolic BF16 variants using odd symmetry, constant/saturation
  regions, and quarter/range descriptors when they are exact.
- Reciprocal/power BF16 variants using exponent affine transforms, sign/special
  shells, and compact mantissa transforms.
- `ex286`/`ex287` routing/normalizer alternatives using compact hidden-state,
  selected descriptor predicates, decision graph/cofactor subfunctions, or
  source-level hybrid output grouping that materially differs from rejected
  symcof/casemux/BDD replays.

Initial coordinator notes:
- `current_frontend_gap.csv` current best rows for these targets are mostly
  backend-sourced. Workers must compare against `frontend_best_registry.csv`
  frontend best rows for frontend progress.
- Existing current/reference ratios in `current_frontend_gap.csv` understate
  frontend-only gaps for BF16 because backend results are not allowed as
  frontend best.

Results:
- Merged official candidates: `75`.
- Official evaluation rows: `75`, all `equivalent=1` with existing
  Verilog/AIG/evaluate-log paths.
- Best improvements: `1`.
- Failed/blocker hypotheses: `6`.
- Merge sanity: `missing_paths=0`, `duplicate_method_signatures=0`.

Best result:
- `ex219`: `ex219_r94_bf16_reciprocal_cbrt_delta_pair_mant64_hilo3_bits_6_cmp`
  improved frontend ADP from `9345` to `9212` (`658/14`), still above
  reference ADP `5640`.
- No other assigned case improved its existing frontend comparator in this
  round.

Notes:
- Do not promote anything to `student/seeds`.
- Do not write successful candidate rows unless official `evaluate.py` passed.
- `student/scripts/build_frontend_campaign_index.py` was rerun after merge;
  `frontend_best_registry.csv` now points `ex219` at this frontend-only
  candidate.
