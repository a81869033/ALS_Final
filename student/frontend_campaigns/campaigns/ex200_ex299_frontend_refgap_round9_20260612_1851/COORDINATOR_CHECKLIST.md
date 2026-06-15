# Round9 Coordinator Checklist

Before accepting this run:

- Every assigned case has `student/work/ex200_ex299_frontend_refgap_round9_20260612_1851/<agent>/<case>/high_level_dossier.md`.
- Every assigned `frontend_attempts.md` has a new dated Round9 entry.
- Candidate and evaluation rows have unique `(case, method_signature)` pairs.
- Successful candidates are official `evaluate.py` equivalent and include existing Verilog, AIG, and evaluate-log paths.
- Non-equivalent, synth-failed, or blocked directions are recorded in `failed_hypotheses.csv`.
- Any frontend improvement is copied to `best_improvements.csv` and then merged by the coordinator.
- `python3 student/scripts/build_frontend_campaign_index.py` is run after merge.
