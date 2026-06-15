#!/usr/bin/env python3
"""Merge round21 frontend campaign shard CSVs."""

import importlib.util
from pathlib import Path


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[3]
TEMPLATE = ROOT / "student" / "frontend_campaigns" / "campaigns" / "ex200_ex299_frontend_refgap_round20_20260613_0015" / "merge_round20_results.py"
RUN_ID = "ex200_ex299_frontend_refgap_round21_20260613_0040"

spec = importlib.util.spec_from_file_location("round21_merge_base", str(TEMPLATE))
merge = importlib.util.module_from_spec(spec)
spec.loader.exec_module(merge)

merge.RUN_ID = RUN_ID
merge.ROUND_LABEL = "round21"
merge.HERE = HERE
merge.ROOT = ROOT
merge.base.RUN_ID = RUN_ID
merge.base.HERE = HERE
merge.base.ROOT = ROOT
merge.base.SHARDS = HERE / "agent_shards"
merge.base.RESULTS = HERE / "results"
merge.base.FRONTEND = ROOT / "student" / "frontend_campaigns"

merge.run_merge()
