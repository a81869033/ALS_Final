# ex220-ex224 FP16 Curated Cleanup

Cleanup timestamp: `2026-06-06 20:50 +0800`

Active run:
- `student/runs/fp16/ex220_ex224_frontend_fp16_semantic_20260606_2050/`
- `student/work/ex220_ex224_frontend_fp16_semantic_20260606_2050/`

What was cleaned:
- Moved 132 Verilog/AIG/Yosys-log files that came from an earlier broad
  generator attempt and were not listed in the final curated `candidates.csv`.
- Kept the active work directory limited to the 32 exact candidates in the
  final CSV, per-case `manifest.json` files, and copied best AIGs.

Archive location:
- `student/archive/cleanup_20260606/ex220_ex224_fp16_curated_20260606_2050/extra_unlisted_work/`

Reason:
- Keep active FP16 ex220-ex224 artifacts small and searchable while preserving
  the unlisted intermediate files for traceability.
