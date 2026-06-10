# ex200-ex219 BF16 Current Seed Bundle

Purpose: git-tracked copies of the current best BF16 frontend seeds for
`ex200`-`ex219`.

Source registry:

- `student/runs/bf16/ex200_ex219_current/`

Contents:

- One Verilog seed per case under `exNNN/verilog/`.
- One synthesized AIG per case under `exNNN/aigs/`.
- `results/best.csv` and `results/candidates.csv`: the 20 current-best rows
  copied into this best-only seed bundle.
- `results/evaluate_check.csv`: copied verification records for the current
  best seed files.
- `results/summary.csv`: one-row-per-case best-seed summary.
- Total seed files: 40.
- This bundle tracks only current best seeds.  The larger 255-row curated
  candidate pool remains in `student/runs/bf16/ex200_ex219_current/results/`
  and points mostly to local `student/work/` artifacts.

Verification:

- These files are copies of already verified current-best rows.
- `student/runs/bf16/ex200_ex219_current/results/best.csv` points to this
  bundle.
- Every best row has `verified_truth=1` and `equivalent=1`.

Notes:

- Do not add entire `student/work/` run trees here.
- If a future run improves a BF16 case, update only the affected case seed and
  the current BF16 registry CSVs.
