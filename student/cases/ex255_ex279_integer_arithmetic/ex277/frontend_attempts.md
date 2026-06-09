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
