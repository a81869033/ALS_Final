#!/usr/bin/env python3
"""Merge round9 results using the round8 coordinator merge implementation."""

from pathlib import Path


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[3]
TEMPLATE = ROOT / "student" / "frontend_campaigns" / "campaigns" / "ex200_ex299_frontend_refgap_round8_20260612_1826" / "merge_round8_results.py"
RUN_ID = "ex200_ex299_frontend_refgap_round9_20260612_1855"

namespace = {"__name__": "round9_merge_from_round8", "__file__": str(TEMPLATE)}
exec(compile(TEMPLATE.read_text(), str(TEMPLATE), "exec"), namespace)

namespace["RUN_ID"] = RUN_ID
namespace["HERE"] = HERE
namespace["ROOT"] = ROOT
namespace["SHARDS"] = HERE / "agent_shards"
namespace["RESULTS"] = HERE / "results"
namespace["FRONTEND"] = ROOT / "student" / "frontend_campaigns"
namespace["main"]()
