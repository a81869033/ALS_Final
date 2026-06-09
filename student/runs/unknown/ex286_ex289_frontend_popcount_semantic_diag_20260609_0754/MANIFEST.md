# ex286_ex289_frontend_popcount_semantic_diag_20260609_0754

- Scope: ex286-ex289 only.
- Type: frontend semantic diagnostics, no Verilog/AIG seed emitted.
- Work dir: `student/work/ex286_ex289_frontend_popcount_semantic_diag_20260609_0754`
- Results dir: `student/runs/unknown/ex286_ex289_frontend_popcount_semantic_diag_20260609_0754/results`
- Key finding: all four cases are exact Hamming-weight preserving but not bitwise monotone; this points away from pure compare-exchange and toward controlled token-routing/Fredkin-like structures.
- Rejected in this batch: transferred mux-coordinate quadratic degree-2/3, direct weighted sum, quadratic-at-origin residual BDD, elementary CA sample, combinadic rank maps, popcount-layer BDD.
- Seeds: none; `student/seeds` intentionally untouched.
