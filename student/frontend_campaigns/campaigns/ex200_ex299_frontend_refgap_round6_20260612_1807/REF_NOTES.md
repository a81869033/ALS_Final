# Reference Notes For Round6

Sources:
- `ref/IWLS26_presentation.pdf`
- Do not use `ref/E-syn.pdf` for this campaign; the user clarified it is not the relevant reference.

Usable clues:
- The senior flow separates frontend AIG generation from post optimization. For this campaign, focus on better frontend descriptions and Verilog representations, not backend-only portfolio work.
- The presentation explicitly values AI reverse engineering from truth tables, then high-level Verilog rewriting into diverse equivalent representations. Different RTL descriptions of the same high-level function can land on very different area/delay Pareto points.
- The benchmark grouping in the slides matches current case clusters: BF16/FP16 unary, FP8 conversion/arithmetic, integer arithmetic, GF(2) event filters, lossy routing/normalizer, and state/rot2 families.
- Cross-AIG structural hashing suggests a frontend analogue: generate representations that expose reusable subfunctions, shared predicates, shared roots, and equivalent cones, rather than isolated output ROMs.
- For frontend candidates, still try representation families that change sharing/depth tradeoffs: factored predicates, cofactored BDD roots, product/root pools, arithmetic compressor arrangements, and output grouping. Treat this as a general campaign tactic, not as guidance from `E-syn.pdf`.

Guardrails:
- `IWLS26_presentation.pdf` is a clue only. Do not repeat PPT wording as a method unless it becomes a concrete high-level hypothesis and Verilog representation.
- Ignore `ref/E-syn.pdf`; it is not the focus for this frontend search.
- Official acceptance still requires repo `evaluate.py` equivalence and complete area/delay/ADP/path/log rows.
