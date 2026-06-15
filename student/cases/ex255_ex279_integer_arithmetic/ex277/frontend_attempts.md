# ex277 Frontend Attempts

Semantics: integer square root, `isqrt(x)`.

Initial semantic seeds:
- `ex277_isqrt_direct`: 225/55/12375
- `ex277_isqrt_threshold_chain`: 311/55/17105

Current verified frontend best:
- `ex277_isqrt_cofbdd4_reverse_synth_preset`: 237/12/2844, ref ADP 1980, ratio 1.436364.

Notes:
- Exact unsigned floor isqrt over 4096 inputs.
- Best structure is a 4-bit high-prefix split with local reverse-order BDDs and
  a shared word mux.  This beats both plain prefix range and full BDD.
- Additional prefix delta and one-hot/support experiments were exact but did
  not improve.  Current best is within 1.5x reference.

## 2026-06-14 integer-extra-r2 continuation

Run ID: `ex204_ex299_frontend_continuation_20260614_1216`, agent `integer-extra-r2`.

- Official `evaluate.py` OK rows: 32/32.
- Best row: `ex277_isqrt_cofbdd5_reverse_abc_g_aig`, `257/12/3084`; nonwinning versus current frontend `237/12/2844`.
- Failed directions: prefix3/4/5/6 shared trial comparators, support-high/ANF-high classifiers, lowmix BDD variants, range tree, radix-4 wires, and high2/cofbdd depth changes were exact but did not beat the compact cofbdd4 reverse word-mux.
