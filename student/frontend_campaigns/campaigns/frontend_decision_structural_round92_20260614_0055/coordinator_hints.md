# Round92 Coordinator Hints

These hints summarize the case-index evidence read by the coordinator after
spawning the workers. They are not success claims.

## FP8 Top: ex247/ex246/ex244/ex249

The repeated losing pattern is not just poor synthflow. Many BDD, nested mux,
small-pattern, DC-special, and source-boundary variants are already marked
equivalent-but-bad-QoR. The next useful direction is to extract compact shared
boundary predicates from the current best source and represent them once:

- shared sign/exponent/mantissa region predicates;
- shared saturation/FTZ/DAZ and rounding predicates;
- output groups driven from a common decision-node bus;
- only small residual tables, never broad table-sized descriptors.

For `ex244`, prior delta/maxeff/hypot forms reached around 10k ADP but are still
too large. A new candidate should change predicate sharing or output grouping,
not replay delta-BDD or maxeff synthflow.

## FP8 Arithmetic: ex240/ex241/ex245

`ex241` still points to "product exponent formula with whole-magnitude
exception overlay" as the next representation, but prior product/nested tables
were too large. Try shared product/magnitude/rounding predicates first, then
use residual tables only after grouping by the shared class.

For `ex240` and `ex245`, favor structural residual compression around the
current best semantic core rather than nanmask/cone variants.

## FP16/Integer: ex223/ex225/ex260/ex266

`ex223` improved only slightly with a single-bit truthroot. The next distinct
attempt needs multi-bit shared positive-normal log roots or a revised log/log10
description with shared dense predicates. Full-output MTBDD and single-bit
truthroot as-is are low-value.

`ex225` has many correction/predecode/BDD variants marked bad. The next useful
attempt should be a shallow exponent-base residual normalizer or selected-bit
predecode with lower delay, not another dense residual table.

`ex260` has many Baugh/Booth/Wallace/Dadda/HCLA variants already tried. A new
structural candidate should materially change compressor/prefix sharing or use
truth-guided selected-output correction over an arithmetic baseline.

`ex266` current best wordmux is marked do-not-repeat as-is. A new candidate
should expose shared quotient/trial-subtract/selector predicates, not another
per-output BDD or generic wordmux replay.

## Unknown: ex285/ex288/ex297/ex299

`ex285`: local-rule screens preserved Hamming weight but conflicted or became
table-sized. Work from current decision-tree/source structure with shared
swap/layer predicates.

`ex288`: selected key-BDD is the frontend best but many key/symcof/multipair
forms are marked bad. Try smaller selected symmetry descriptors with shared
root predicates before adding new BDD tables.

`ex297`/`ex299`: broad rot2/rotation/BBD representations are bad as-is. The
more promising direction is current-best symbol-plane cube/default factoring or
selected output-cluster overlays with shared local identity/selector predicates.

## Recording

Only official `evaluate.py` equivalent candidates with existing paths belong in
`candidates.csv` or `evaluation_results.csv`. Blocked, table-sized, or planned
ideas belong in `failed_hypotheses.csv` or `active_methods.csv`.
