# Scripts

Command-line entry points for experiments, diagnostics, result collection,
curation, verification, and synthflow.

Do not put primary candidate Verilog emitters here.  If a Python program's
main purpose is to generate benchmark-specific RTL candidates, place it under
`student/generators/`.  Keep it here when the program launches runs, diagnoses
truth structure, collects CSVs, curates seed bundles, verifies candidates, or
resynthesizes existing Verilog/AIG seeds.

Keep script names explicit:

```text
run_<domain>_<stage>_<method>.sh
<case_or_domain>_<stage>_<method>.py
collect_<domain>_<artifact>.py
summarize_<domain>_<artifact>.py
verify_<domain>_<artifact>.py
```

Current groups:

- `run_unknown_*`: tmux/search launchers for ex280-ex299 unknown functions.
- `run_bf16_*`: tmux/search launchers for ex200-ex219 BF16 functions.
- `ex280_*_search.py`: single-case ex280 backend search helpers.
- `diagnose_*` / remaining `unknown_*_diag.py`: truth-structure diagnostics
  and probes that do not primarily emit candidate Verilog.
- `curate_*`: copy verified high-value candidates into stable seed bundles.
- `yosys_synthflow_*`: synthesize or resynthesize existing verified seeds.
- `collect_*` / `summarize_*`: result aggregation helpers.
- `verify_variant_csv.py`: equivalence/QoR checking for candidate CSV files.

Each long run should write outputs under a matching `student/work/<run_id>/`
directory and register the run in `student/runs/<domain>/<run_id>/`.
