#!/usr/bin/env python3
"""Collect the current verified best result for each benchmark case."""

import argparse
import csv
import re
from pathlib import Path


ROOT = Path(__file__).resolve().parents[2]

RESULT_NAMES = (
    "best",
    "candidate",
    "candidates",
    "history",
)

SKIP_NAME_PARTS = (
    "summary",
    "metadata",
    "evaluate",
    "check",
    "manifest",
)

FIELDNAMES = [
    "case",
    "domain",
    "best_area",
    "best_delay",
    "best_adp",
    "reference_adp",
    "adp_ratio_to_reference",
    "within_1p5_reference",
    "beats_reference",
    "candidate_id",
    "hypothesis",
    "function_guess",
    "variant",
    "tool_chain",
    "classification",
    "verilog_path",
    "aig_path",
    "source_kind",
    "source_csv",
    "notes",
]


TRUE_VALUES = {"1", "true", "t", "yes", "y", "ok", "pass", "passed"}


class Candidate:
    def __init__(
        self,
        case,
        domain,
        area,
        delay,
        adp,
        candidate_id,
        hypothesis,
        function_guess,
        variant,
        tool_chain,
        classification,
        verilog_path,
        aig_path,
        source_kind,
        source_csv,
        notes,
        priority,
    ):
        self.case = case
        self.domain = domain
        self.area = area
        self.delay = delay
        self.adp = adp
        self.candidate_id = candidate_id
        self.hypothesis = hypothesis
        self.function_guess = function_guess
        self.variant = variant
        self.tool_chain = tool_chain
        self.classification = classification
        self.verilog_path = verilog_path
        self.aig_path = aig_path
        self.source_kind = source_kind
        self.source_csv = source_csv
        self.notes = notes
        self.priority = priority

    def sort_key(self):
        # Lower ADP is the primary score in this project.
        return (
            self.adp,
            self.delay,
            self.area,
            self.priority,
            self.source_csv,
            self.candidate_id,
        )


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Write student/results/current_best_by_case.csv."
    )
    parser.add_argument(
        "--output",
        default="student/results/current_best_by_case.csv",
        help="Output CSV path relative to the repository root.",
    )
    return parser.parse_args()


def rel(path: Path) -> str:
    try:
        return str(path.relative_to(ROOT))
    except ValueError:
        return str(path)


def parse_int(value):
    if value is None:
        return None
    text = str(value).strip().replace(",", "")
    if not text:
        return None
    try:
        return int(float(text))
    except ValueError:
        return None


def truthy(value):
    return str(value or "").strip().lower() in TRUE_VALUES


def verified(row):
    return (
        truthy(row.get("equivalent"))
        or truthy(row.get("verified_truth"))
        or truthy(row.get("verified"))
        or truthy(row.get("status"))
    )


def load_reference(path):
    refs = {}
    if not path.exists():
        return refs
    with path.open(newline="") as fh:
        for row in csv.DictReader(fh):
            case = (row.get("case") or "").strip()
            adp = parse_int(row.get("adp"))
            if case and adp is not None:
                refs[case] = adp
    return refs


def source_domain(path: Path) -> str:
    parts = path.relative_to(ROOT).parts
    if len(parts) >= 3 and parts[0] in {"student"} and parts[1] in {"runs", "seeds"}:
        return parts[2]
    return ""


def source_kind(path: Path) -> str:
    parts = path.relative_to(ROOT).parts
    if len(parts) >= 2:
        if parts[1] == "seeds":
            return "seed"
        if parts[1] == "runs":
            return "run"
    return ""


def result_priority(path: Path) -> int:
    name = path.name
    kind = source_kind(path)
    parts = path.relative_to(ROOT).parts
    if kind == "seed" and any(part.endswith("_current") or "_current_" in part for part in parts):
        return -1
    if kind == "seeds" or kind == "seed":
        return 0
    if name == "best.csv":
        return 1
    if name.endswith("_best.csv"):
        return 2
    if "candidate" in name:
        return 3
    return 4


def candidate_csvs():
    paths = []
    for base in (ROOT / "student" / "runs", ROOT / "student" / "seeds"):
        if not base.exists():
            continue
        for path in base.glob("**/results/*.csv"):
            lower = path.name.lower()
            if any(part in lower for part in SKIP_NAME_PARTS):
                continue
            if any(part in lower for part in RESULT_NAMES):
                paths.append(path)
    return sorted(paths)


def read_candidates(path):
    out = []
    domain = source_domain(path)
    kind = source_kind(path)
    priority = result_priority(path)
    try:
        fh = path.open(newline="")
    except OSError:
        return out
    with fh:
        reader = csv.DictReader(fh)
        for row in reader:
            case = (row.get("case") or "").strip()
            if not re.fullmatch(r"ex\d+", case):
                continue
            if not verified(row):
                continue
            area = parse_int(row.get("area") or row.get("best_area"))
            delay = parse_int(row.get("delay") or row.get("best_delay"))
            adp = parse_int(row.get("adp") or row.get("best_adp"))
            if area is None or delay is None or adp is None:
                continue
            hypothesis = (
                row.get("hypothesis")
                or row.get("hypothesis/function_guess")
                or row.get("function_guess")
                or ""
            ).strip()
            function_guess = (row.get("function_guess") or hypothesis).strip()
            tool_chain = (row.get("tool_chain") or "").strip()
            variant = (row.get("variant") or tool_chain or row.get("source") or "").strip()
            classification = (
                row.get("classification") or row.get("source") or kind
            ).strip()
            out.append(
                Candidate(
                    case=case,
                    domain=domain,
                    area=area,
                    delay=delay,
                    adp=adp,
                    candidate_id=(row.get("candidate_id") or "").strip(),
                    hypothesis=hypothesis,
                    function_guess=function_guess,
                    variant=variant,
                    tool_chain=tool_chain,
                    classification=classification,
                    verilog_path=(row.get("verilog_path") or "").strip(),
                    aig_path=(row.get("aig_path") or "").strip(),
                    source_kind=kind,
                    source_csv=rel(path),
                    notes=(row.get("notes") or "").strip(),
                    priority=priority,
                )
            )
    return out


def case_key(case):
    match = re.fullmatch(r"ex(\d+)", case)
    if match:
        return (int(match.group(1)), case)
    return (10**9, case)


def row_for(candidate, refs):
    ref = refs.get(candidate.case)
    ratio = ""
    within = ""
    beats = ""
    if ref:
        ratio_value = candidate.adp / ref
        ratio = f"{ratio_value:.6f}"
        within = "1" if ratio_value <= 1.5 else "0"
        beats = "1" if candidate.adp < ref else "0"
    return {
        "case": candidate.case,
        "domain": candidate.domain,
        "best_area": str(candidate.area),
        "best_delay": str(candidate.delay),
        "best_adp": str(candidate.adp),
        "reference_adp": str(ref or ""),
        "adp_ratio_to_reference": ratio,
        "within_1p5_reference": within,
        "beats_reference": beats,
        "candidate_id": candidate.candidate_id,
        "hypothesis": candidate.hypothesis,
        "function_guess": candidate.function_guess,
        "variant": candidate.variant,
        "tool_chain": candidate.tool_chain,
        "classification": candidate.classification,
        "verilog_path": candidate.verilog_path,
        "aig_path": candidate.aig_path,
        "source_kind": candidate.source_kind,
        "source_csv": candidate.source_csv,
        "notes": candidate.notes,
    }


def main() -> int:
    args = parse_args()
    refs = load_reference(ROOT / "reference_result.csv")
    best = {}
    scanned = 0
    accepted = 0

    for path in candidate_csvs():
        scanned += 1
        for candidate in read_candidates(path):
            accepted += 1
            old = best.get(candidate.case)
            if old is None or candidate.sort_key() < old.sort_key():
                best[candidate.case] = candidate

    output = ROOT / args.output
    output.parent.mkdir(parents=True, exist_ok=True)
    with output.open("w", newline="") as fh:
        writer = csv.DictWriter(fh, fieldnames=FIELDNAMES, lineterminator="\n")
        writer.writeheader()
        for case in sorted(best, key=case_key):
            writer.writerow(row_for(best[case], refs))

    print(f"scanned_csvs={scanned}")
    print(f"accepted_candidates={accepted}")
    print(f"cases={len(best)}")
    print(f"output={rel(output)}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
