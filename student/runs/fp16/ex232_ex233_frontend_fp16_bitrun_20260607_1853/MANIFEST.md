# ex232_ex233_frontend_fp16_bitrun_20260607_1853

Purpose: Generate selected-bit vector-cover Verilog sources for ex232 square
and ex233 sqrt.

Work directory:
- `student/work/ex232_ex233_frontend_fp16_bitrun_20260607_1853/`

Results:
- `student/runs/fp16/ex232_ex233_frontend_fp16_bitrun_20260607_1853/results/candidates.csv`
- `student/runs/fp16/ex232_ex233_frontend_fp16_bitrun_20260607_1853/results/best.csv`
- `student/runs/fp16/ex232_ex233_frontend_fp16_bitrun_20260607_1853/results/metadata.csv`

Summary:
- Best sources were `ex232_fp16_square_bitvec_bits12_9_t32.v` and
  `ex233_fp16_sqrt_bitvec_bits14_13_12_9_t32.v`.
- These source rows became the final curated bests after `abc -g aig`.
