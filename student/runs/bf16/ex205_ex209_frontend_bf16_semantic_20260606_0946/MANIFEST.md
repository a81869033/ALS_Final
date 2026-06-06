# ex205_ex209_frontend_bf16_semantic_20260606_0946

Run ID: `ex205_ex209_frontend_bf16_semantic_20260606_0946`

Purpose: frontend-only BF16 semantic/structural reverse engineering for ex205-ex209.

Scope:
- Cases: `ex205`.
- Backend portfolios were not run.
- Yosys AIG synthesis and ABC CEC/ADP measurement were used for frontend seed verification.

Artifacts:
- Work directory: `student/work/ex205_ex209_frontend_bf16_semantic_20260606_0946/`
- Results directory: `student/runs/bf16/ex205_ex209_frontend_bf16_semantic_20260606_0946/results/`
- Archived low-value intermediates: `student/archive/cleanup_20260606/ex205_ex209_frontend_bf16_semantic_20260606_0946_low_value_intermediates/`
- Archived orphan intermediates from the interrupted first batch: `student/archive/cleanup_20260606/ex205_ex209_frontend_bf16_semantic_20260606_0946_orphan_intermediates/`
- Official best recheck: `results/evaluate_official_best.csv`

Methods:
- Semantic hypotheses were checked against BF16 DAZ/FTZ/RNE/canonical-NaN models.
- Mantissa hi/lo LUTs, separated output fields, delta/base structures, selected-bit overrides.
- Odd-symmetry positive-domain tables for sin/tan/sinh/tanh.
- Passthrough or saturation default expressions with local exception LUTs.
- Hand-derived selected-bit formulas for log10/sinh/tanh sign behavior.
- Limited bitplane and full-output BDD experiments for ex205's low-area/high-delay gap.
- Follow-up targeted ex205 positive-domain range encoding and ex207 mixed/odd sign-flip rewrites.

Best result:
- ex205 log10: `sep_fields_e3_m3_s0_bits_15_bh1`, `4463/17/75871`, reference ratio `1.609892`.
- ex206 sin: `odd_pos_fullword_h4`, `26872/21/564312`, reference ratio `1.046866`.
- ex207 tan: `odd_pos_fullword_expflip_h4`, `29873/21/627333`, reference ratio `0.999229`; this beats the reference ADP `627817`.
- ex208 sinh: `default_in_const_excepts_h4`, `2167/15/32505`, reference ratio `1.326464`.
- ex209 tanh: `sign_exp_default_expr_casez`, `756/13/9828`, reference ratio `1.342623`.
- See `results/best.csv` and `results/summary.csv`.

Curated active seeds:
- ex205: 4 retained variants; best plus close structural/bitplane/legacy baselines.
- ex206: 4 retained variants; odd positive-domain h4 best plus split-sign h4/h3 baselines.
- ex207: 6 retained variants; odd expflip h4 best plus split-sign mixed/h5 and odd h4/h5/h6 baselines.
- ex208: 4 retained variants; default-in constant exception best plus legacy/delta baselines.
- ex209: 5 retained variants; compressed sign-exp default-expression best plus low-area/default/delta baselines.

Stopping notes:
- ex205: semantic log10 confirmed. Exp-base delta, manual sign formula, bitplanes, full BDD, positive-domain range casez/tree, comparator chain, and output-exp range plus mantissa table were worse or timed out. A better result likely needs a new log10-specific arithmetic decomposition.
- ex206: semantic sin confirmed. Positive-domain full-word odd h4 remains best; split-sign mixed and exp!=255 flip variants were worse.
- ex207: semantic tan confirmed. Positive-domain full-word h4 with `flip_sign = sign & (exp != 8'hff)` reached `627333`, slightly beating reference. h5/h6, first-base, mixed split, and exp=255 mux shortcuts were worse.
- ex208: semantic sinh confirmed. Input-default constant exception h4 beat legacy split-sign; signed-inf default and manual sign-bit formulas were worse.
- ex209: semantic tanh confirmed. Range-compressed sign-exp default-expression beat legacy by a small margin; lower-area manual sign/default variants increased delay.
