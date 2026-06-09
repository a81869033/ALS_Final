# ex286 Frontend Bit-Hybrid Run

Run ID: `ex286_frontend_bit_hybrid_20260608_1548`

Scope: `ex286`.

Hypothesis: the symmetry-canonical BDD source has low area but delay 17, while
the structural split source has delay 13 but higher area. BDD root-depth
diagnostics showed bits 5, 6, and 7 were shallower, so using BDD only for those
bits and structural RTL for the deeper bits might preserve delay while reducing
area.

Seed policy: no files were created or updated under `student/seeds`; unknown
seed curation is deferred until the full `ex280-ex299` class converges.

## Inputs And Outputs

- Generator: `student/generators/unknown_bit_hybrid_search.py`
- Primary source: `student/work/ex285_ex289_frontend_symmetry_bdd_20260608_1429/ex286/verilog/ex286_unknown_symbdd_interleave_zero.v`
- Secondary source: `student/work/reverse_unknown_20260603_1812/ex286/verilog/ex286_unknown_13x13_rotate_low_split_default.v`
- Work dir: `student/work/ex286_frontend_bit_hybrid_20260608_1548/`
- Results dir: `student/runs/unknown/ex286_frontend_bit_hybrid_20260608_1548/results/`

## Verification

All 6 bit-hybrid candidates passed ABC equivalence. The per-run best was
replayed with `evaluate.py`:

| Case | Best variant | Status | Area | Delay | ADP | Current best ADP |
| --- | --- | --- | ---: | ---: | ---: | ---: |
| ex286 | `primary_7` | OK | 1867 | 14 | 26138 | 24180 |

## Outcome

- No new current best.
- Raw bit-hybrid reduced neither area nor delay enough. Best raw row was
  `primary_7`, `1867/14/26138`.
- The source was kept for limited synthflow follow-up.
