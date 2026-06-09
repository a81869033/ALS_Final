# ex286_frontend_exact_bit_smoke_20260609_1610

Run ID: `ex286_frontend_exact_bit_smoke_20260609_1610`

Purpose: Attempt a bounded exact-synthesis smoke on a single ex286 output bit before considering any broader exact-synthesis direction.

Inputs:
- Truth file: `benchmarks/ex286.truth`
- ABC: `student/abc`

Artifacts:
- Work directory: `student/work/ex286_frontend_exact_bit_smoke_20260609_1610/`
- Results directory: `student/runs/unknown/ex286_frontend_exact_bit_smoke_20260609_1610/results/`
- Empty frontend CSVs only; no candidate was emitted.

Methods tried:
- Tried to extract a single-output cone from `read_truth -xf benchmarks/ex286.truth` using ABC `cone -O 0` and `write_truth`.
- Extracted output bit 0 as a single-line truth file and asked ABC to write the corresponding hex truth.
- Ran a strict ABC `exact -D 12 -C 10000 -a` smoke on bit 0.
- Ran direct multi-output `read_truth -xf; bdd; sop; fx; strash; dc2; ps` as a small truth-level extraction smoke.

Best result:
- No candidate emitted.
- ABC `exact` aborted because this command only supports `2..8` variables, while ex286 output bits have `13` inputs.
- Direct multi-output truth-level extraction reached `2560/15`, worse than current `1447/15`.

Notes:
- ABC's built-in `exact` command is not applicable directly to full-width ex286 bits. Any exact-synthesis retry would need decomposition/windowing rather than feeding a 13-input bit truth to `exact`.
