# ex243 Frontend Attempts

Function hypothesis: E4M3FN FP8 fmod/remainder, low byte % abs(high byte).

Reference row: area/delay/ADP/score = `3131/17/53227/79840.5`.

Current known best:
- Source: `student/results/current_best_by_case.csv` and the run result CSVs.
- Variant: `semantic_fmod_modsig_nested_delta_abc_g_aig`
- QoR: `1790/27/48330`
- Reference ADP: `53227`
- Ratio: `0.907998`
- Classification: `semantic_exact`

## Diagnostics To Run

- Verify width, support, constant bits, bit entropy, and special input classes.
- Infer whether this is conversion or packed fp8 add.
- Reference area is much larger than neighboring conversion-like cases, so
  check for arithmetic-heavy fp8 add behavior, cancellation, and normalization.

## Attempt Log

- Confirmed fmod/remainder semantics.  High byte sign is ignored for divisor
  magnitude; low byte sign is preserved on the result, including signed zero.
  Divisor zero or NaN canonicalizes to `8'h7f`.
- `semantic_fmod_mag_table`: exact full 7-bit divisor/dividend magnitude table;
  best `5866/25/146650`.
- `semantic_fmod_default_exception`: defaults to passthrough when
  `abs(low) < abs(high)` and zero otherwise, then patches 5720 exceptions.
  New best `5746/25/143650`.
- Arithmetic Verilog `%` over decoded magnitudes was exact but synthesized to a
  very deep path (`1855/400/742000`), so it is only a semantic check.
- Direct ABC `read_truth -xf; strash` baseline was exact by construction but
  huge (`20102/39`).
- Shared-BDD variable-order search found a much better structural seed.  The
  best order places paired high-to-low magnitude bits first and sign bits last:
  `6:14:5:13:4:12:3:11:2:10:1:9:0:8:7:15`.  Raw BDD best was
  `4047/24/97128`; limited synthflow improved it to `3977/22/87494`, now
  current best.
- 2026-06-08 semantic fmod rewrite: derive the remainder from significands.
  When `delta = eff_num - eff_den >= 0`,
  `rem_sig = (sig_num << delta) % sig_den`, then normalize by the denominator
  effective exponent; when `delta < 0`, pass through the numerator.  Flat
  residue table improved to `2167/29/62843`; nested delta then residue table
  improved to `1790/27/48330`, which beats the reference ADP.

## Next Maintenance Items

- Current best is now true semantic RTL/table hybrid and beats reference.
  Future work should keep the nested delta residue structure as the primary
  frontend seed; BDD is now only a structural fallback.
