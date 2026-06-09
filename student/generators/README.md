# Case-Specific Generators

Put specialized generators here when their main job is to emit candidate
Verilog/RTL seed sources for recognized benchmark families.  A generator may
also synthesize, verify, and write run CSVs, but candidate source generation is
the ownership boundary.

Do not put pure launchers, diagnostics, result collectors, seed curators,
verification helpers, or Yosys-only resynthesis scripts here; those belong in
`student/scripts/`.

Current benchmark-family groups:

- integer multiplication/division/square/sqrt
- BF16/FP16 unary functions
- float conversion and FP8 add
- unknown-function split, decision-graph, conservative-map, BDD/ANF, and
  candidate-emitting diagnostic/probe methods
