# Frontend Campaign Index

This directory is a compact index for frontend improvement campaigns.
It should stay lightweight: store summaries, CSV indexes, and paths here;
store large generated Verilog/AIG/log artifacts under `student/work` and official run summaries under `student/runs`.

## Main Files

- `FRONTEND_PROGRESS.md`: first file for new sessions to read.
- `current_frontend_gap.csv`: all cases with current best vs reference.
- `frontend_best_registry.csv`: current best frontend seed per case.
- `attempted_methods.csv`: indexed existing attempts from runs/work/archive.
- `method_judgments.csv`: grouped method outcomes, reuse policies, and evidence paths.
- `manual_judgments.csv`: optional manual overrides for method outcomes.
- `search_state.csv`: per-case current focus, status, agent, and budget.
- `hypothesis_bank.csv`: active/proposed/tested frontend hypotheses.
- `case_index/exNNN.md`: per-case short context.
- `campaigns/`: per-campaign lightweight result summaries.

## Rebuild

Run this after new frontend/backend results are added:

```bash
python3 student/scripts/build_frontend_campaign_index.py
```

The script rebuilds the generated CSV/Markdown indexes from existing artifacts.
