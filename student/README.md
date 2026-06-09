# Student Workspace Layout

This directory contains the reproducible source code and helper tools for the ALS final project.

## Layout

- `common/`: shared Python helpers for command execution, candidate metadata, CEC, and ADP measurement.
- `frontends/`: shared truth-table parsing, simulation/equivalence, Yosys synthesis, and frontend helper APIs.
- `backends/`: wrappers for ABC, ABC9, MockTurtle, CULS, E-Syn, and hybrid backend flows.
- `generators/`: case-specific candidate generators that emit Verilog/RTL seed sources.
- `scripts/`: command-line entry points for launch, diagnostics, collection, verification, curation, and synthflow.
- `tools/`: third-party tool checkouts or local builds. Do not clean manually unless explicitly requested.
- `results/`: active high-value CSV summaries and candidate metadata, not bulky logs or per-run generated artifacts.
- `runs/`: human-facing run registry and manifests.
- `work/`: generated Verilog/AIG/log artifacts and temporary per-case working directories.
- `seeds/`: curated Verilog/AIG seed bundles that should be available from a fresh clone.
- `archive/`: old intermediate or cleanup artifacts kept for traceability.
- `cases/`: per-case notes, hypotheses, exclusions, and progress summaries.
- `docs/`: workflow notes needed to reproduce tool setup, cleanup policy, and final report details.

Keep `student/abc` at the top level because the provided `evaluate.py` uses it as the default ABC path.
