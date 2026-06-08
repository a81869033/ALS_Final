#!/usr/bin/env python3
"""Curate verified frontend candidates into backend-start seed bundles.

The backend optimizer should start from small, stable Verilog/AIG bundles rather
than chasing historical work directories.  This script copies the current best
and a few low-ADP verified alternatives for ex200-ex239 into student/seeds/.
"""

import argparse
import csv
import hashlib
import re
import shutil
from datetime import datetime
from pathlib import Path
from typing import Dict, List, Optional, Tuple


ROOT = Path(__file__).resolve().parents[2]
TRUE_VALUES = {"1", "true", "t", "yes", "y", "ok", "pass", "passed"}
FALLBACK_PATH_CACHE = {}

DOMAINS = {
    "bf16": [f"ex{i}" for i in range(200, 220)],
    "fp16": [f"ex{i}" for i in range(220, 240)],
}

RESULT_NAMES = ("best", "candidate", "candidates", "history")
SKIP_NAME_PARTS = ("summary", "metadata", "evaluate", "check", "manifest")

FIELDNAMES = [
    "case",
    "candidate_id",
    "hypothesis/function_guess",
    "variant",
    "verilog_path",
    "aig_path",
    "verified_truth",
    "equivalent",
    "area",
    "delay",
    "adp",
    "reference_adp",
    "adp_ratio_to_reference",
    "within_1p5_reference",
    "beats_reference",
    "classification",
    "tool_chain",
    "selection_reason",
    "source_kind",
    "source_csv",
    "source_verilog_path",
    "source_aig_path",
    "notes",
]


class Candidate:
    def __init__(
        self,
        case,
        domain,
        candidate_id,
        hypothesis,
        variant,
        verilog_path,
        aig_path,
        area,
        delay,
        adp,
        reference_adp,
        classification,
        tool_chain,
        source_kind,
        source_csv,
        notes,
        priority,
        verified_truth=True,
        equivalent=True,
        selection_reason="",
        dest_verilog=None,
        dest_aig=None,
    ):
        self.case = case
        self.domain = domain
        self.candidate_id = candidate_id
        self.hypothesis = hypothesis
        self.variant = variant
        self.verilog_path = verilog_path
        self.aig_path = aig_path
        self.area = area
        self.delay = delay
        self.adp = adp
        self.reference_adp = reference_adp
        self.classification = classification
        self.tool_chain = tool_chain
        self.source_kind = source_kind
        self.source_csv = source_csv
        self.notes = notes
        self.priority = priority
        self.verified_truth = verified_truth
        self.equivalent = equivalent
        self.selection_reason = selection_reason
        self.dest_verilog = dest_verilog
        self.dest_aig = dest_aig

    def sort_key(self):
        return (
            self.adp,
            self.delay,
            self.area,
            self.priority,
            str(self.source_csv),
            self.candidate_id,
        )

    def source_key(self):
        return (
            self.case,
            self.candidate_id,
            self.area,
            self.delay,
            self.adp,
            rel(self.verilog_path),
            rel(self.aig_path),
        )


def parse_args():
    parser = argparse.ArgumentParser(
        description="Create backend-start seed bundles for ex200-ex239."
    )
    parser.add_argument(
        "--timestamp",
        default=datetime.now().strftime("%Y%m%d_%H%M"),
        help="Timestamp suffix for the generated bundle IDs.",
    )
    parser.add_argument(
        "--max-per-case",
        type=int,
        default=5,
        help="Maximum candidates to keep per case in each backend-start bundle.",
    )
    parser.add_argument(
        "--dry-run",
        action="store_true",
        help="Print the planned selection without copying files.",
    )
    return parser.parse_args()


def rel(path: Path) -> str:
    try:
        return str(path.resolve().relative_to(ROOT))
    except ValueError:
        return str(path)


def resolve_path(value: Optional[str]) -> Optional[Path]:
    if not value:
        return None
    path = Path(value)
    if not path.is_absolute():
        path = ROOT / path
    return path


def existing_or_fallback(path: Optional[Path]) -> Optional[Path]:
    if path is None or path.exists():
        return path
    key = str(path)
    if key in FALLBACK_PATH_CACHE:
        return FALLBACK_PATH_CACHE[key]

    name = path.name
    path_text = str(path)
    case_matches = re.findall(r"ex\d+", path_text)
    case = case_matches[-1] if case_matches else ""
    leaf_dir = path.parent.name
    candidates = []
    for base in (
        ROOT / "student" / "seeds",
        ROOT / "student" / "work",
        ROOT / "student" / "archive",
    ):
        if not base.exists():
            continue
        for found in base.rglob(name):
            if not found.is_file():
                continue
            score = 0
            found_text = str(found)
            if case and case in found_text:
                score -= 4
            if found.parent.name == leaf_dir:
                score -= 2
            if "archive" in found_text:
                score += 1
            candidates.append((score, len(found_text), found))
    if not candidates:
        FALLBACK_PATH_CACHE[key] = None
        return None
    found = sorted(candidates)[0][2]
    FALLBACK_PATH_CACHE[key] = found
    return found


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


def truthy(value) -> bool:
    return str(value or "").strip().lower() in TRUE_VALUES


def safe_name(text: str, fallback: str) -> str:
    raw = text.strip() or fallback
    out = re.sub(r"[^A-Za-z0-9_.-]+", "_", raw).strip("._")
    return out[:180] or fallback


def source_kind(path: Path) -> str:
    try:
        parts = path.relative_to(ROOT).parts
    except ValueError:
        return ""
    if len(parts) >= 2:
        if parts[1] == "seeds":
            return "seed"
        if parts[1] == "runs":
            return "run"
        if parts[1] == "results":
            return "current_best"
    return ""


def source_domain(path: Path) -> str:
    try:
        parts = path.relative_to(ROOT).parts
    except ValueError:
        return ""
    if len(parts) >= 3 and parts[1] in {"runs", "seeds"}:
        return parts[2]
    return ""


def result_priority(path: Path) -> int:
    kind = source_kind(path)
    name = path.name
    if kind == "current_best":
        return -2
    if kind == "seed":
        return -1
    if name == "best.csv":
        return 0
    if name.endswith("_best.csv"):
        return 1
    if "candidate" in name:
        return 2
    return 3


def candidate_csvs() -> List[Path]:
    paths = []
    current_best = ROOT / "student" / "results" / "current_best_by_case.csv"
    if current_best.exists():
        paths.append(current_best)
    for base in (ROOT / "student" / "runs", ROOT / "student" / "seeds"):
        if not base.exists():
            continue
        for path in base.glob("**/results/*.csv"):
            lower = path.name.lower()
            if any(part in lower for part in SKIP_NAME_PARTS):
                continue
            if any(part in lower for part in RESULT_NAMES):
                paths.append(path)
    return sorted(set(paths))


def load_reference() -> Dict[str, int]:
    refs = {}
    path = ROOT / "reference_result.csv"
    if not path.exists():
        return refs
    with path.open(newline="") as fh:
        for row in csv.DictReader(fh):
            case = (row.get("case") or "").strip()
            adp = parse_int(row.get("adp"))
            if case and adp is not None:
                refs[case] = adp
    return refs


def row_verified(row, path: Path) -> bool:
    if path.name == "current_best_by_case.csv":
        return True
    return (
        truthy(row.get("equivalent"))
        or truthy(row.get("verified_truth"))
        or truthy(row.get("verified"))
        or truthy(row.get("status"))
    )


def normalize_row(row, path: Path, refs: Dict[str, int]) -> Optional[Candidate]:
    case = (row.get("case") or "").strip()
    if not re.fullmatch(r"ex\d+", case):
        return None
    case_num = int(case[2:])
    if not 200 <= case_num <= 239:
        return None
    domain = "bf16" if case_num < 220 else "fp16"
    if not row_verified(row, path):
        return None

    area = parse_int(row.get("area") or row.get("best_area"))
    delay = parse_int(row.get("delay") or row.get("best_delay"))
    adp = parse_int(row.get("adp") or row.get("best_adp"))
    if area is None or delay is None or adp is None:
        return None

    verilog_path = resolve_path(row.get("verilog_path"))
    aig_path = resolve_path(row.get("aig_path"))
    if path.name == "current_best_by_case.csv":
        verilog_path = existing_or_fallback(verilog_path)
        aig_path = existing_or_fallback(aig_path)
    if not verilog_path or not aig_path or not verilog_path.exists() or not aig_path.exists():
        return None

    candidate_id = (
        row.get("candidate_id")
        or row.get("candidate")
        or verilog_path.stem
        or f"{case}_candidate"
    ).strip()
    hypothesis = (
        row.get("hypothesis/function_guess")
        or row.get("hypothesis")
        or row.get("function_guess")
        or ""
    ).strip()
    if row.get("function_guess") and row.get("hypothesis"):
        hypothesis = f"{row.get('hypothesis')} / {row.get('function_guess')}"

    reference_adp = parse_int(row.get("reference_adp")) or refs.get(case)
    return Candidate(
        case=case,
        domain=domain,
        candidate_id=candidate_id,
        hypothesis=hypothesis,
        variant=(row.get("variant") or "").strip(),
        verilog_path=verilog_path,
        aig_path=aig_path,
        area=area,
        delay=delay,
        adp=adp,
        reference_adp=reference_adp,
        classification=(row.get("classification") or "").strip(),
        tool_chain=(row.get("tool_chain") or "").strip(),
        source_kind=source_kind(path),
        source_csv=path,
        notes=(row.get("notes") or "").strip(),
        priority=result_priority(path),
        verified_truth=True,
        equivalent=True,
    )


def load_candidates() -> Tuple[Dict[str, List[Candidate]], Dict[str, Candidate]]:
    refs = load_reference()
    by_case = {case: [] for cases in DOMAINS.values() for case in cases}
    current_best = {}
    seen = set()
    for csv_path in candidate_csvs():
        try:
            fh = csv_path.open(newline="")
        except OSError:
            continue
        with fh:
            for row in csv.DictReader(fh):
                cand = normalize_row(row, csv_path, refs)
                if cand is None:
                    continue
                key = cand.source_key()
                if key in seen:
                    continue
                seen.add(key)
                by_case.setdefault(cand.case, []).append(cand)
                if csv_path.name == "current_best_by_case.csv":
                    current_best[cand.case] = cand
    return by_case, current_best


def diversity_key(cand: Candidate) -> str:
    text = " ".join(
        [
            cand.classification,
            cand.variant,
            cand.candidate_id,
            cand.hypothesis,
        ]
    ).lower()
    for token in (
        "nested",
        "core_boundary",
        "direct_special",
        "semantic",
        "selected",
        "bitrun",
        "casez",
        "field",
        "hilo",
        "delta",
        "default",
        "formula",
        "synthflow",
        "abc_g_aig",
        "positive",
        "odd",
    ):
        if token in text:
            return token
    return "other"


def select_candidates(
    by_case: Dict[str, List[Candidate]],
    current_best: Dict[str, Candidate],
    max_per_case: int,
) -> Dict[str, List[Candidate]]:
    selected = {}
    for case, candidates in by_case.items():
        chosen = []
        used_fingerprints = set()

        def add(cand: Candidate, reason: str) -> bool:
            fingerprint = (cand.candidate_id, cand.area, cand.delay, cand.adp)
            path_fingerprint = (rel(cand.verilog_path), rel(cand.aig_path))
            if fingerprint in used_fingerprints or path_fingerprint in used_fingerprints:
                return False
            copy = Candidate(**{**cand.__dict__})
            copy.selection_reason = reason
            chosen.append(copy)
            used_fingerprints.add(fingerprint)
            used_fingerprints.add(path_fingerprint)
            return True

        if case in current_best:
            add(current_best[case], "current_best")

        sorted_candidates = sorted(candidates, key=lambda c: c.sort_key())
        used_diversity = {diversity_key(c) for c in chosen}

        # First pass: preserve structural diversity among near-top rows.
        for cand in sorted_candidates:
            if len(chosen) >= max_per_case:
                break
            key = diversity_key(cand)
            if key in used_diversity and len(chosen) >= 2:
                continue
            if add(cand, f"diverse_{key}"):
                used_diversity.add(key)

        # Second pass: fill remaining slots with pure low-ADP rows.
        for cand in sorted_candidates:
            if len(chosen) >= max_per_case:
                break
            add(cand, "top_adp")

        selected[case] = sorted(chosen, key=lambda c: c.sort_key())
    return selected


def copy_candidate(cand: Candidate, bundle_root: Path, used_names) -> Candidate:
    case_root = bundle_root / cand.case
    verilog_dir = case_root / "verilog"
    aig_dir = case_root / "aigs"
    verilog_dir.mkdir(parents=True, exist_ok=True)
    aig_dir.mkdir(parents=True, exist_ok=True)

    base = safe_name(cand.candidate_id, cand.verilog_path.stem)
    digest = hashlib.sha1(f"{rel(cand.verilog_path)}|{rel(cand.aig_path)}".encode()).hexdigest()[:8]
    name = base
    if name in used_names:
        name = f"{base}_{digest}"
    used_names.add(name)

    dest_verilog = verilog_dir / f"{name}.v"
    dest_aig = aig_dir / f"{name}.aig"
    if cand.verilog_path.resolve() != dest_verilog.resolve():
        shutil.copy2(cand.verilog_path, dest_verilog)
    if cand.aig_path.resolve() != dest_aig.resolve():
        shutil.copy2(cand.aig_path, dest_aig)
    cand.dest_verilog = dest_verilog
    cand.dest_aig = dest_aig
    return cand


def candidate_to_row(cand: Candidate) -> Dict[str, str]:
    ref = cand.reference_adp
    ratio = ""
    within_1p5 = ""
    beats_ref = ""
    if ref:
        ratio_value = cand.adp / ref
        ratio = f"{ratio_value:.6f}"
        within_1p5 = "1" if ratio_value <= 1.5 else "0"
        beats_ref = "1" if cand.adp < ref else "0"
    return {
        "case": cand.case,
        "candidate_id": cand.candidate_id,
        "hypothesis/function_guess": cand.hypothesis,
        "variant": cand.variant,
        "verilog_path": rel(cand.dest_verilog or cand.verilog_path),
        "aig_path": rel(cand.dest_aig or cand.aig_path),
        "verified_truth": "1" if cand.verified_truth else "0",
        "equivalent": "1" if cand.equivalent else "0",
        "area": str(cand.area),
        "delay": str(cand.delay),
        "adp": str(cand.adp),
        "reference_adp": str(ref or ""),
        "adp_ratio_to_reference": ratio,
        "within_1p5_reference": within_1p5,
        "beats_reference": beats_ref,
        "classification": cand.classification,
        "tool_chain": cand.tool_chain,
        "selection_reason": cand.selection_reason,
        "source_kind": cand.source_kind,
        "source_csv": rel(cand.source_csv),
        "source_verilog_path": rel(cand.verilog_path),
        "source_aig_path": rel(cand.aig_path),
        "notes": cand.notes,
    }


def write_csv(path: Path, rows, fieldnames=FIELDNAMES) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", newline="") as fh:
        writer = csv.DictWriter(
            fh, fieldnames=fieldnames, extrasaction="ignore", lineterminator="\n"
        )
        writer.writeheader()
        writer.writerows(rows)


def write_manifest(bundle_root: Path, bundle_id: str, cases, selected) -> None:
    lines = [
        f"# {bundle_id}",
        "",
        "Curated backend-start seeds for verified frontend candidates.",
        "",
        "Scope:",
        f"- Cases: `{cases[0]}`-`{cases[-1]}`",
        "- Contents: copied Verilog/AIG files only; no backend optimization was run by this curation step.",
        "- Selection: current best plus a small number of low-ADP/diverse verified alternatives per case.",
        "",
        "Files:",
        "- `results/candidates.csv`: all copied seed candidates.",
        "- `results/best.csv`: best copied seed per case.",
        "- `results/summary.csv`: per-case candidate counts and reference ratios.",
        "- `results/evaluate_check.csv`: optional official recheck records for best seeds.",
        "",
        "| Case | Seeds | Best candidate | Area | Delay | ADP |",
        "| --- | ---: | --- | ---: | ---: | ---: |",
    ]
    for case in cases:
        rows = selected.get(case, [])
        if not rows:
            lines.append(f"| {case} | 0 | MISSING |  |  |  |")
            continue
        best = min(rows, key=lambda c: c.sort_key())
        lines.append(
            f"| {case} | {len(rows)} | `{best.candidate_id}` | {best.area} | {best.delay} | {best.adp} |"
        )
    lines.append("")
    (bundle_root / "MANIFEST.md").write_text("\n".join(lines), encoding="utf-8")


def materialize_domain(
    domain: str,
    cases,
    selected,
    timestamp: str,
    dry_run: bool,
) -> Tuple[str, List[Dict[str, str]], List[Dict[str, str]], List[Dict[str, str]]]:
    case_range = f"{cases[0]}_{cases[-1]}"
    bundle_id = f"{case_range}_backend_start_{timestamp}"
    bundle_root = ROOT / "student" / "seeds" / domain / bundle_id
    candidate_rows = []
    best_rows = []
    summary_rows = []

    if not dry_run:
        (bundle_root / "results").mkdir(parents=True, exist_ok=True)

    for case in cases:
        used_names = set()
        copied = []
        for cand in selected.get(case, []):
            if dry_run:
                copied.append(cand)
            else:
                copied.append(copy_candidate(cand, bundle_root, used_names))
        copied = sorted(copied, key=lambda c: c.sort_key())
        for cand in copied:
            candidate_rows.append(candidate_to_row(cand))
        if copied:
            best = copied[0]
            best_rows.append(candidate_to_row(best))
            ratio = ""
            if best.reference_adp:
                ratio = f"{best.adp / best.reference_adp:.6f}"
            summary_rows.append(
                {
                    "case": case,
                    "selected_count": str(len(copied)),
                    "best_candidate_id": best.candidate_id,
                    "best_area": str(best.area),
                    "best_delay": str(best.delay),
                    "best_adp": str(best.adp),
                    "reference_adp": str(best.reference_adp or ""),
                    "adp_ratio_to_reference": ratio,
                    "candidate_ids": ";".join(c.candidate_id for c in copied),
                }
            )
        else:
            summary_rows.append(
                {
                    "case": case,
                    "selected_count": "0",
                    "best_candidate_id": "",
                    "best_area": "",
                    "best_delay": "",
                    "best_adp": "",
                    "reference_adp": "",
                    "adp_ratio_to_reference": "",
                    "candidate_ids": "",
                }
            )

    if not dry_run:
        write_csv(bundle_root / "results" / "candidates.csv", candidate_rows)
        write_csv(bundle_root / "results" / "best.csv", best_rows)
        write_csv(
            bundle_root / "results" / "summary.csv",
            summary_rows,
            [
                "case",
                "selected_count",
                "best_candidate_id",
                "best_area",
                "best_delay",
                "best_adp",
                "reference_adp",
                "adp_ratio_to_reference",
                "candidate_ids",
            ],
        )
        write_manifest(bundle_root, bundle_id, cases, selected)
    return bundle_id, candidate_rows, best_rows, summary_rows


def main() -> int:
    args = parse_args()
    by_case, current_best = load_candidates()
    selected = select_candidates(by_case, current_best, args.max_per_case)

    missing = [case for cases in DOMAINS.values() for case in cases if not selected.get(case)]
    if missing:
        print("Missing verified candidates:", ", ".join(missing))
        return 1

    for domain, cases in DOMAINS.items():
        bundle_id, candidate_rows, best_rows, summary_rows = materialize_domain(
            domain, cases, selected, args.timestamp, args.dry_run
        )
        counts = [int(row["selected_count"]) for row in summary_rows]
        print(
            f"{domain}: {bundle_id} cases={len(best_rows)} "
            f"candidates={len(candidate_rows)} min_per_case={min(counts)} max_per_case={max(counts)}"
        )
        if args.dry_run:
            for row in summary_rows:
                print(
                    f"  {row['case']}: {row['selected_count']} "
                    f"best={row['best_candidate_id']} adp={row['best_adp']}"
                )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
