# ex285-ex299 Frontend Quadratic Compressor Transfer

- Run ID: `ex285_ex299_frontend_quadratic_compressor_transfer_20260609_0546`
- Scope: `ex285-ex299`
- Work dir: `student/work/ex285_ex299_frontend_quadratic_compressor_transfer_20260609_0546/`
- Results dir: `student/runs/unknown/ex285_ex299_frontend_quadratic_compressor_transfer_20260609_0546/results/`
- Generator: `student/generators/unknown_quadratic_compressor_search.py`
- Hypothesis: transfer the `ex280-ex284` full-clamp mux-coordinate degree-2 shared compressor directly to `ex285-ex299`.

## Results

- Rows: 60.
- Official equivalent rows: 0.
- Best cases: 0/15.
- Outcome: full-function degree-2 coordinate solve failed for every tested `prefix_parity_reduce`/`prefix_parity` and `full_clamp`/`full_clamp_simplified` basic row.

## Conclusion

The `ex280-ex284` compressor does not transfer as a whole-function replacement to `ex285-ex299`. The transferable idea is source-level cofactor/class predicate factoring, not the exact mux-coordinate map.

