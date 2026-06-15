#!/usr/bin/env python3
from pathlib import Path
import sys

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from campaign_round_utils import append_bookkeeping


if __name__ == "__main__":
    append_bookkeeping(__file__, "frontend_source_parallel_round75_20260613_1507", "2026-06-13", "coordinator-round75-1507")
