# Student Workspace Layout

This directory contains the reproducible source code and helper tools for the ALS final project.

## Layout

- `common/`: shared Python helpers for command execution, candidate metadata, CEC, and ADP measurement.
- `frontends/`: seed generators, including AI-reconstructed Verilog/Yosys flows and truth-table analysis.
- `backends/`: wrappers for ABC, ABC9, MockTurtle, CULS, E-Syn, and hybrid backend flows.
- `generators/`: case-specific Verilog/AIG/EQN generators.
- `scripts/`: command-line entry points for running experiments and full pipelines.
- `tools/`: third-party tool checkouts or local builds.
- `results/`: generated experiment tables and candidate metadata.
- `work/`: temporary per-case working directories.
- `docs/`: notes needed to reproduce tool setup and final report details.

Keep `student/abc` at the top level because the provided `evaluate.py` uses it as the default ABC path.
