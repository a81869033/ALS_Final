# new_seeds Validation Report

Checks:
- current bundle exactly one AIG per case
- backend candidates exclude current best hash
- copied Verilog/AIG/metadata paths exist
- source Verilog/AIG paths exist
- manifest area/delay/ADP is internally consistent
- full current-bundle official `evaluate.py` check recorded in `current_all_evaluate.log`
- full current-bundle QoR parse recorded in `current_all_evaluate_report.csv`

Status: `PASS`

Official evaluate.py current check: `100/100` equivalent, `0` QoR mismatches against `selection_summary.csv`.
