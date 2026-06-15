#!/usr/bin/env python3
from pathlib import Path
import sys

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from campaign_round_utils import merge_campaign


if __name__ == "__main__":
    merge_campaign(__file__)
