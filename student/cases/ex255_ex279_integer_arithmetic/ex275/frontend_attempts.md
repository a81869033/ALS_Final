# ex275 Frontend Attempts

Semantics: integer square root, `isqrt(x)`.

Initial semantic seeds:
- `ex275_isqrt_threshold_chain`: 50/11/550
- `ex275_isqrt_direct`: 42/15/630

Current verified frontend best:
- `ex275_isqrt_prefix5_ge_tree_lsb_arith_wreduce_aig`: 43/7/301, ref ADP 204, ratio 1.475490.

Notes:
- Exact unsigned floor isqrt over 256 inputs.
- Best area alternative before this run was full `bdd_outside+synth_preset` at
  42/8/336, but the new prefix5 shared-ge tree keeps delay 7 while dropping
  area from the old 48 to 43.
- The key new structure is a shared-boundary, shared-word-selector classifier:
  split by 5 high bits, build local ge/thermometer boundary wires, and select
  the entire output word with an LSB-first mux tree instead of independent
  per-bit cases.
- Exact but losing directions: direct/trial loop, threshold chain/XOR,
  bit-interval OR, full-case table, prefix range, support-reduced formulas,
  one-hot prefix decode, high-bit formula plus low BDD, BDD order search,
  QM/SOP cover, thermometer popcount, prefix delta, radix/restoring variants,
  and limited Yosys gate/synthflow checks.
- Follow-up shared-ge, tree-selector, and gateflow checks put ex275 within
  1.5x reference.  Further gains likely require a smaller hand-minimized
  multi-output classifier, not broader prefix/template sweeps.
