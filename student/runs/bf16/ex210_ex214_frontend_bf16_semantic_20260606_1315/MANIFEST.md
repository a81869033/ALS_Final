# ex210_ex214_frontend_bf16_semantic_20260606_1315

Run ID: `ex210_ex214_frontend_bf16_semantic_20260606_1315`

Purpose: frontend-only BF16 semantic/structural reverse engineering for ex210-ex214.

Scope:
- Cases: `ex210`, `ex211`, `ex212`, `ex213`, `ex214`.
- Backend portfolios were not run.
- Yosys AIG synthesis and ABC CEC/ADP measurement were used for frontend seed verification.

Artifacts:
- Work directory: `student/work/ex210_ex214_frontend_bf16_semantic_20260606_1315/`
- Results directory: `student/runs/bf16/ex210_ex214_frontend_bf16_semantic_20260606_1315/results/`
- Archived low-value intermediates: `student/archive/cleanup_20260606/ex210_ex214_frontend_bf16_semantic_20260606_1315_low_value_intermediates/`
- Official best recheck: `results/evaluate_official_best.csv`

Semantic checks:
- `ex210`: DAZ sigmoid BF16 RNE/canonical-NaN model exact over 65536 inputs
- `ex211`: semantic model exact over 65536 inputs
- `ex212`: semantic model exact over 65536 inputs
- `ex213`: semantic model exact over 65536 inputs
- `ex214`: semantic model exact over 65536 inputs

Methods:
- Semantic arithmetic RTL for reciprocal, square, sqrt, and reciprocal-square.
- Sigmoid saturation/default constants with local exception LUTs.
- Positive-domain sign-flip tables for reciprocal.
- Positive-domain sign-insensitive tables for square and reciprocal-square.
- Sqrt positive-domain table plus explicit negative zero/NaN handling.
- Mantissa hi/lo LUTs, separated fields, and selected structural baselines.
- Hand-written reciprocal sign/magnitude RTL with 128-entry mantissa LUT.
- Selected output-bit overrides for square, sqrt, and reciprocal-square.

Best result:
- ex210 sigmoid: `const_default_3f80_h3`, `2232/15/33480`, reference ratio `1.237571`.
- ex211 reciprocal: `hand_recip_formula_signmag_lut`, `273/11/3003`, reference ratio `1.405899`.
- ex212 square: `delta_pair_mode_hilo4_bits_15_bh1`, `281/11/3091`, reference ratio `1.341580`.
- ex213 sqrt: `sep_fields_e2_m3_s3_bits_1_bh1`, `346/11/3806`, reference ratio `1.312414`.
- ex214 reciprocal-square: `legacy_default_expr_exception_case_bits_13_cmp_fix`, `337/11/3707`, reference ratio `1.529290`.
- See `results/best.csv` and `results/summary.csv`.

Curated active seeds:
- 25 active candidates retained, five per case.
- Full 226-row pre-curation history and low-value generated files are archived in the cleanup folder.

Stopping notes:
- ex210: saturation-default h3 was best; other default split widths and positive-symmetry/source field variants raised area or delay.
- ex211: hand reciprocal sign/magnitude LUT slightly beat the previous field-symmetry seed; arithmetic, full-word tables, and large default-exception tables were worse.
- ex212: delta-pair mode hi-lo h4 plus constant sign-bit override was best; other hi splits and selected-bit overrides lost sharing or raised delay.
- ex213: separate-field base plus bit1 override was the only tested source form that reached 11 delay; multi-bit and comparator variants were worse.
- ex214: selected bit13 on the default/exception base reduced delay to 11; direct arithmetic, positive-domain tables, and other selected bits were worse.
