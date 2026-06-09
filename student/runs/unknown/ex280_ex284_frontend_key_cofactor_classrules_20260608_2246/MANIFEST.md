# ex280-ex284 Prefix-Key Class-Rule Canonicalization

Created: 2026-06-08 22:46 +0800

## Hypothesis

The top6 prefix-key cofactor partition has the same `64 -> 50` class merge
pattern for `ex280-ex284`.  Instead of emitting a full class `case`, per-bit
SOP, or classonehot selector tree, the class map can be expressed with four
small canonicalization predicates:

- clear class bit 2 for the `5 -> 1` and `7 -> 3` family
- clear class bit 1 for the bit-1/bit-3 even-state merge family
- clear class bit 3 for the high-state merge family
- set class bit 1 for the `41 -> 35` and `57 -> 51` family

This tests whether the regular class merge semantics can lower selector delay
or area versus previously tested class mux forms.

## Scope

- Cases: `ex280`, `ex281`, `ex282`, `ex283`, `ex284`
- Transform: `prefix_parity_reduce`
- Partition: `top6`
- Encoding: `first`
- Mux styles: `classrulescase`, `classrulesonehot`
- Inner orders: `endpoint`, `endpoint_rev`
- Generator: `student/generators/unknown_key_canonical_cofactor_search.py`
- Work directory: `student/work/ex280_ex284_frontend_key_cofactor_classrules_20260608_2246/`

## Results

- Candidates: `results/candidates.csv`
- Best per case: `results/best.csv`
- Summary: `results/summary.csv`
- Generator evaluate check: `results/evaluate_check.csv`
- Official replay: `results/evaluate_replay.csv`
- Cofactor relation diagnostic: `results/cofactor_relation_diag.csv`
- Width embedding diagnostic: `results/width_embedding_diag.csv`
- Best AIG copies for this run only: `best_aigs/`

All 20 emitted candidates were truth-model exact, synthesized, equivalent, and
officially replayed through `evaluate.py` (`20/20 OK`).  No candidate beat the
current best for any case.

Best ADPs:

- `ex280`: `780/25/19500`
- `ex281`: `910/30/27300`
- `ex282`: `1020/32/32640`
- `ex283`: `1128/37/41736`
- `ex284`: `1261/37/46657`

## Additional Diagnostic

The 50 unique class cofactor functions were compared for simple sharing
relations:

- output xor-constant
- output rotate/reverse plus xor-constant
- inner-key `id`/`reverse`/`endpoint` permutations combined with output
  rotate/reverse plus xor-constant

No relations were found for any case.  The class merge pattern is real and
regular, but the remaining 50 cofactor functions do not collapse into a simple
transform orbit under these tested relations.

The width embedding diagnostic tested whether fixing one input bit in
`ex(n+1)` and removing one output bit exactly recovers `ex(n)`.  No exact
embedding was found for `ex280->ex281`, `ex281->ex282`, `ex282->ex283`, or
`ex283->ex284`; the best matches still left many mismatches and the inserted
output bit was variable.

## Conclusion

Predicate canonicalization is exact, but it does not expose the missing
reference-scale structure.  The selector map becomes compact, yet the
canonical key path and the 50 cofactor functions still dominate delay/area.
Simple cofactor transform orbits and simple width embeddings were not present.
Do not repeat this class-rule source form unless paired with a materially new
cofactor-sharing or semantic recurrence model.
