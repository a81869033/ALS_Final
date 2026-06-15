# Round94 Hints From Recording, PPT, And introduction.md

Frontend-only interpretation:
- The recording/PPT split the search into high-level reverse engineering first,
  then diverse Verilog representations. This round must not just tune the
  current best source; it should write down a simpler high-level description or
  explain why the existing one is already the simplest.
- Diverse RTL forms matter because different Verilog structures produce
  different initial AIG Pareto points. For this frontend-only run, "cross-AIG"
  ideas are translated into source-level output grouping, shared subfunction
  reuse, or selected source overlays before synthesis.
- BF16 has only 7 mantissa bits. Prefer explicit BF16 sign/exponent/mantissa
  shells, shared special-case predicates, and exact small mantissa transforms
  over full truth-table expansion.
- For BF16 trig/tan variants, the recording calls out quarter-wave/range
  factoring, odd symmetry, dictionary/tail factoring, passthrough front regions,
  and flat nonlinear tails as materially different RTL families. Only use them
  if they are exact against the benchmark truth.
- For unknown family `ex285-ex289`, PPT/introduction describe
  hamming-weight-preserving lossy routing/normalizer. Prior attempts show
  symcof/BDD/class mux forms are often equivalent but high-delay. New work
  should look for compact hidden state, descriptor predicates, small selected
  output repairs, or a materially different decision graph basis.

Do not do:
- No backend portfolio or post-AIG optimization.
- No repeated BF16 hi/lo granularity sweep unless the representation, sharing,
  or semantics materially change.
- No repeated `ex286`/`ex287` symcof/casemux/inner-BDD replay unless the
  method signature demonstrates a new high-level basis.
