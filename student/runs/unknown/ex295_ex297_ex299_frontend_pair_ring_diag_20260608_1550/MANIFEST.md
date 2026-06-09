# ex295-ex297-ex299 Pair-Ring Diagnostic Run

Run ID: `ex295_ex297_ex299_frontend_pair_ring_diag_20260608_1550`

Scope: `ex295`, `ex297`, `ex299`.

Hypothesis: these cases are exactly equivariant under even rotations, so they
can be viewed as cyclic rings of 2-bit cells. A small-radius local rule over
neighboring cells might replace dynamic rotation canonicalization or duplicated
representative BDDs with low-depth RTL.

Seed policy: no files were created or updated under `student/seeds`; this run
is diagnostic-only and emits no AIG seed.

## Inputs And Outputs

- Truth files: `benchmarks/ex295.truth`, `benchmarks/ex297.truth`, `benchmarks/ex299.truth`
- Work dir: `student/work/ex295_ex297_ex299_frontend_pair_ring_diag_20260608_1550/`
- Results dir: `student/runs/unknown/ex295_ex297_ex299_frontend_pair_ring_diag_20260608_1550/results/`

## Method

- Grouped each input/output word into 2-bit cells.
- Checked whether output cell 0 is determined by cells within cyclic radius
  `0..floor(cell_count/2)`.
- Also computed actual 2-bit cell support for output cell 0.

## Outcome

- No Verilog/AIG seed was emitted.
- `ex295`: output cell 0 depends on all 6 cells; radius 0/1/2 failed, radius 3
  is exact only because it covers the full ring.
- `ex297`: output cell 0 depends on all 7 cells; radius 0/1/2 failed, radius 3
  is exact only because it covers the full ring.
- `ex299`: output cell 0 depends on all 8 cells; radius 0/1/2/3 failed, radius
  4 is exact only because it covers the full ring.
- Do not pursue a simple local 2-bit pair-ring rule for these cases. Future
  rotation work needs a different fixed-phase/canonical-class compression or
  selected correction strategy.
