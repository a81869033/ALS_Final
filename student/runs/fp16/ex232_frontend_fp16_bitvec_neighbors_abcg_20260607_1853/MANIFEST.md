# ex232_frontend_fp16_bitvec_neighbors_abcg_20260607_1853

Purpose: Yosys `abc -g aig` recheck of ex232 selected-bit neighbor sources.

Work directory:
- `student/work/ex232_frontend_fp16_bitvec_neighbors_abcg_20260607_1853/`

Results:
- `student/runs/fp16/ex232_frontend_fp16_bitvec_neighbors_abcg_20260607_1853/results/candidates.csv`
- `student/runs/fp16/ex232_frontend_fp16_bitvec_neighbors_abcg_20260607_1853/results/best.csv`

Summary:
- Closest neighbor was exact but worse than `bits12_9_t32`.
- This run is exclusion evidence; future ex232 work should not keep sweeping
  nearby bitvec combinations without a new structure insight.
