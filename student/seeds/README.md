# Seed Bundles

This directory contains small, git-tracked seed bundles that are worth keeping
available from a fresh clone.

Large generated work directories remain under `student/work/` and may be
ignored by git.  A seed bundle should contain only curated Verilog/AIG files
that are useful as stable starting points or references.

For run history and full candidate CSVs, start from `student/runs/index.md`.

Current bundles:

- `bf16/ex200_ex219_current/`: current best BF16 frontend seeds for
  `ex200`-`ex219`.
- `fp16/ex223_ex224_yosys_synthflow_current/`: current best FP16 `ex223` and
  `ex224` synthflow seeds using Yosys internal `abc -g aig`.
