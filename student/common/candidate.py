"""Candidate records and CSV history helpers."""

import csv
from pathlib import Path


FIELDNAMES = [
    "case",
    "candidate_id",
    "parent_id",
    "source",
    "tool_chain",
    "aig_path",
    "area",
    "delay",
    "adp",
    "equivalent",
    "runtime_sec",
    "notes",
]


class Candidate:
    def __init__(
        self,
        case,
        candidate_id,
        parent_id,
        source,
        tool_chain,
        aig_path,
        area=None,
        delay=None,
        adp=None,
        equivalent=False,
        runtime_sec=0.0,
        notes="",
    ):
        self.case = case
        self.candidate_id = candidate_id
        self.parent_id = parent_id
        self.source = source
        self.tool_chain = tool_chain
        self.aig_path = Path(aig_path)
        self.area = area
        self.delay = delay
        self.adp = adp
        self.equivalent = equivalent
        self.runtime_sec = runtime_sec
        self.notes = notes

    def to_row(self):
        return {
            "case": self.case,
            "candidate_id": self.candidate_id,
            "parent_id": self.parent_id,
            "source": self.source,
            "tool_chain": self.tool_chain,
            "aig_path": str(self.aig_path),
            "area": "" if self.area is None else str(self.area),
            "delay": "" if self.delay is None else str(self.delay),
            "adp": "" if self.adp is None else str(self.adp),
            "equivalent": "1" if self.equivalent else "0",
            "runtime_sec": "{0:.3f}".format(self.runtime_sec),
            "notes": self.notes,
        }


def append_candidates(csv_path, candidates):
    csv_path = Path(csv_path)
    csv_path.parent.mkdir(parents=True, exist_ok=True)
    write_header = not csv_path.exists()
    with csv_path.open("a", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=FIELDNAMES)
        if write_header:
            writer.writeheader()
        for candidate in candidates:
            writer.writerow(candidate.to_row())
