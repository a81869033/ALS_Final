#!/usr/bin/env python3
"""BF16 backend portfolio runner, V1.

This runner is intentionally conservative: it starts from curated BF16 seed
bundles, runs a bounded backend portfolio, records every attempt, and keeps
enough checkpoint state to resume without repeating completed tasks.
"""

import argparse
import csv
import hashlib
import json
import os
import queue
import re
import shutil
import subprocess
import sys
import time
import traceback
from collections import OrderedDict, defaultdict
from concurrent.futures import ThreadPoolExecutor, as_completed
from pathlib import Path

if __package__ in (None, ""):
    sys.path.insert(0, str(Path(__file__).resolve().parents[2]))

from student.backends.culs_flow import default_culs_bin
from student.backends.mockturtle_flow import discover_runner, run_mockturtle
from student.common.abc import is_equivalent, measure_adp, run_aig_flow
from student.frontends.yosys_synth import DEFAULT_YOSYS, SynthError, synthesize_verilog


ROOT = Path(__file__).resolve().parents[2]
DEFAULT_ABC = ROOT / "student" / "abc"
DEFAULT_DOMAIN = "bf16"
DEFAULT_CASES = "ex200-ex219"
DEFAULT_CURRENT_BUNDLE = ROOT / "student" / "seeds" / "bf16" / "ex200_ex219_current"
DEFAULT_BACKEND_BUNDLE_GLOB = "ex200_ex219_backend_candidates_*"


HISTORY_FIELDNAMES = [
    "case",
    "candidate_id",
    "family_id",
    "parent_id",
    "parent_hash",
    "source",
    "tool",
    "tool_chain",
    "command",
    "command_expanded",
    "params_json",
    "aig_path",
    "aig_hash",
    "verilog_path",
    "seed_origin",
    "area",
    "delay",
    "adp",
    "parent_area",
    "parent_delay",
    "parent_adp",
    "delta_area",
    "delta_delay",
    "delta_adp",
    "equivalent",
    "round",
    "phase",
    "tier",
    "runtime_sec",
    "is_pareto",
    "is_near_pareto",
    "is_active",
    "is_new_pareto",
    "duplicate_of",
    "notes",
]

PROFILE_FIELDNAMES = [
    "case",
    "family_id",
    "tool",
    "tool_chain",
    "command",
    "params_json",
    "attempts",
    "equivalent_count",
    "new_pareto_count",
    "timeout_count",
    "failure_count",
    "best_delta_adp",
    "best_delta_area",
    "best_delta_delay",
    "recent_attempts",
    "recent_new_pareto_count",
    "recent_success_rate",
]

SUMMARY_FIELDNAMES = [
    "case",
    "best_candidate_id",
    "best_aig_path",
    "best_area",
    "best_delay",
    "best_adp",
    "reference_area",
    "reference_delay",
    "reference_adp",
    "adp_ratio_to_reference",
    "beats_reference",
    "pareto_points",
    "near_pareto_points",
    "history_rows",
]


ABC_TIER0 = OrderedDict(
    [
        ("resyn", "balance; rewrite; rewrite -z; balance; rewrite -z; balance"),
        (
            "resyn2",
            "balance; rewrite; refactor; balance; rewrite; rewrite -z; "
            "balance; refactor -z; rewrite -z; balance",
        ),
        (
            "resyn2a",
            "balance; rewrite; balance; rewrite; rewrite -z; balance; rewrite -z; balance",
        ),
        ("dc2", "strash; dc2; balance"),
        ("dch", "strash; dch; balance"),
        ("bal_rw", "balance; rewrite; rewrite -z; balance"),
    ]
)

ABC_TIER1 = OrderedDict(
    [
        (
            "resyn3",
            "balance; resub; resub -K 6; balance; resub -z; resub -z -K 6; "
            "balance; resub -z -K 5; balance",
        ),
        (
            "compress2",
            "balance -l; rewrite -l; refactor -l; balance -l; rewrite -l; "
            "rewrite -z -l; balance -l; refactor -z -l; rewrite -z -l; balance -l",
        ),
        (
            "resyn2rs",
            "balance; resub -K 6; rewrite; resub -K 6 -N 2; refactor; "
            "resub -K 8; balance; resub -K 8 -N 2; rewrite; resub -K 10; "
            "rewrite -z; resub -K 10 -N 2; balance; resub -K 12; "
            "refactor -z; resub -K 12 -N 2; rewrite -z; balance",
        ),
        (
            "compress2rs",
            "balance -l; resub -K 6 -l; rewrite -l; resub -K 6 -N 2 -l; "
            "refactor -l; resub -K 8 -l; balance -l; resub -K 8 -N 2 -l; "
            "rewrite -l; resub -K 10 -l; rewrite -z -l; resub -K 10 -N 2 -l; "
            "balance -l; resub -K 12 -l; refactor -z -l; resub -K 12 -N 2 -l; "
            "rewrite -z -l; balance -l",
        ),
        ("dc2_dch", "strash; dc2; dch; balance"),
        ("dch_dc2", "strash; dch; dc2; balance"),
        ("dch_bal_rw", "strash; dch; balance; rewrite -z; balance"),
    ]
)

ABC9_COMMANDS = OrderedDict(
    [
        ("abc9_syn2_dc2", "strash; &get; &st; &syn2; &dc2; &put; strash"),
    ]
)

MOCKTURTLE_FLOWS = ("resub", "balance", "resub_balance", "balance_resub")


def rel(path):
    if not path:
        return ""
    path = Path(path)
    try:
        return str(path.resolve().relative_to(ROOT))
    except ValueError:
        return str(path)


def parse_cases(spec):
    cases = []
    for part in str(spec).split(","):
        part = part.strip()
        if not part:
            continue
        if "-" in part:
            left, right = part.split("-", 1)
            left_num = int(left.replace("ex", ""))
            right_num = int(right.replace("ex", ""))
            cases.extend(["ex{0}".format(index) for index in range(left_num, right_num + 1)])
        else:
            cases.append(part if part.startswith("ex") else "ex{0}".format(int(part)))
    return cases


def case_sort_key(case):
    match = re.search(r"\d+", str(case))
    if not match:
        return 10**9
    return int(match.group(0))


def safe_id(value, limit=96):
    text = re.sub(r"[^A-Za-z0-9_.-]+", "_", str(value)).strip("_")
    if not text:
        return "candidate"
    return text[:limit]


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
    return str(value).strip().lower() in ("1", "true", "t", "yes", "y", "ok", "pass")


def file_sha256(path):
    digest = hashlib.sha256()
    with Path(path).open("rb") as handle:
        for chunk in iter(lambda: handle.read(1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest()


def read_csv(path):
    path = Path(path)
    if not path.is_file():
        return []
    with path.open(newline="") as handle:
        return list(csv.DictReader(handle))


def write_csv(path, rows, fieldnames):
    path = Path(path)
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=fieldnames)
        writer.writeheader()
        for row in rows:
            writer.writerow({name: row.get(name, "") for name in fieldnames})


def write_json(path, value):
    path = Path(path)
    path.parent.mkdir(parents=True, exist_ok=True)
    tmp = path.with_suffix(path.suffix + ".tmp")
    with tmp.open("w") as handle:
        json.dump(value, handle, indent=2, sort_keys=True)
    tmp.replace(path)


def read_json(path, default):
    path = Path(path)
    if not path.is_file():
        return default
    with path.open() as handle:
        return json.load(handle)


def first_module_name(verilog_path):
    module_re = re.compile(r"\bmodule\s+([A-Za-z_][A-Za-z0-9_$]*)")
    with Path(verilog_path).open() as handle:
        for line in handle:
            match = module_re.search(line)
            if match:
                return match.group(1)
    return "top"


def load_reference(path):
    refs = {}
    for row in read_csv(path):
        case = row.get("case", "")
        if not case:
            continue
        refs[case] = {
            "area": parse_int(row.get("area")),
            "delay": parse_int(row.get("delay")),
            "adp": parse_int(row.get("adp")),
        }
    return refs


def command_library_rows(include_abc9=True, include_mockturtle=True, include_culs=True):
    rows = []
    for name, command in ABC_TIER0.items():
        rows.append(
            {
                "tool": "abc",
                "tool_chain": "abc_{0}".format(name),
                "phase": "abc_abc9",
                "tier": "0",
                "command": name,
                "command_expanded": command,
                "params_json": "{}",
            }
        )
    for name, command in ABC_TIER1.items():
        rows.append(
            {
                "tool": "abc",
                "tool_chain": "abc_{0}".format(name),
                "phase": "abc_abc9",
                "tier": "1",
                "command": name,
                "command_expanded": command,
                "params_json": "{}",
            }
        )
    if include_abc9:
        for name, command in ABC9_COMMANDS.items():
            rows.append(
                {
                    "tool": "abc9",
                    "tool_chain": name,
                    "phase": "abc_abc9",
                    "tier": "0",
                    "command": name,
                    "command_expanded": command,
                    "params_json": "{}",
                }
            )
    if include_mockturtle:
        for flow in MOCKTURTLE_FLOWS:
            rows.append(
                {
                    "tool": "mockturtle",
                    "tool_chain": "mockturtle_{0}".format(flow),
                    "phase": "mockturtle",
                    "tier": "0",
                    "command": flow,
                    "command_expanded": flow,
                    "params_json": json.dumps({"flow": flow}, sort_keys=True),
                }
            )
    if include_culs:
        rows.append(
            {
                "tool": "culs",
                "tool_chain": "culs_resyn2",
                "phase": "culs",
                "tier": "0",
                "command": "resyn2",
                "command_expanded": "read <input>; resyn2; write <output>",
                "params_json": "{}",
            }
        )
    return rows


def commands_for_phase(phase, round_in_phase, args):
    all_rows = command_library_rows(
        include_abc9=not args.skip_abc9,
        include_mockturtle=not args.skip_mockturtle,
        include_culs=not args.skip_culs,
    )
    rows = [row for row in all_rows if row["phase"] == phase]
    if phase == "abc_abc9":
        desired_tier = "0" if round_in_phase == 0 else "1"
        return [row for row in rows if row["tier"] == desired_tier or row["tool"] == "abc9"]
    return rows


def blank_row():
    return {name: "" for name in HISTORY_FIELDNAMES}


def completed_key(parent_hash, command_row):
    return "|".join(
        [
            parent_hash or "",
            command_row["tool"],
            command_row["tool_chain"],
            command_row["command"],
            command_row.get("params_json", "{}"),
        ]
    )


def seed_key(seed):
    return "seed|{0}|{1}|{2}".format(seed["case"], seed["family_id"], rel(seed.get("aig_path") or seed.get("verilog_path")))


def is_valid_candidate(row):
    return truthy(row.get("equivalent")) and parse_int(row.get("area")) is not None and parse_int(row.get("delay")) is not None


def is_pool_candidate(row):
    return is_valid_candidate(row) and not row.get("duplicate_of")


def dominates(left, right):
    left_area = parse_int(left.get("area"))
    left_delay = parse_int(left.get("delay"))
    right_area = parse_int(right.get("area"))
    right_delay = parse_int(right.get("delay"))
    if None in (left_area, left_delay, right_area, right_delay):
        return False
    return (
        left_area <= right_area
        and left_delay <= right_delay
        and (left_area < right_area or left_delay < right_delay)
    )


def pareto_rows(rows):
    valid = [row for row in rows if is_pool_candidate(row) and row.get("aig_hash")]
    result = []
    for row in valid:
        dominated = False
        for other in valid:
            if other is row:
                continue
            if dominates(other, row):
                dominated = True
                break
        if not dominated:
            result.append(row)
    result.sort(key=candidate_sort_key)
    return result


def family_priority(row):
    family = row.get("family_id", "")
    if family == "current":
        return 0
    if family.startswith("alt"):
        return 1
    return 2


def candidate_sort_key(row):
    return (
        case_sort_key(row.get("case", "")),
        parse_int(row.get("adp")) or 10**18,
        parse_int(row.get("area")) or 10**18,
        parse_int(row.get("delay")) or 10**18,
        family_priority(row),
        row.get("aig_hash", ""),
        row.get("candidate_id", ""),
    )


def history_sort_key(row):
    phase_order = {"seed": 0, "abc_abc9": 1, "mockturtle": 2, "culs": 3}
    return (
        case_sort_key(row.get("case", "")),
        parse_int(row.get("round")) if parse_int(row.get("round")) is not None else 10**9,
        phase_order.get(row.get("phase", ""), 99),
        family_priority(row),
        row.get("parent_id", ""),
        row.get("tool", ""),
        row.get("tool_chain", ""),
        row.get("candidate_id", ""),
    )


def profile_sort_key(row):
    return (
        case_sort_key(row.get("case", "")),
        family_priority(row),
        row.get("family_id", ""),
        row.get("tool", ""),
        row.get("tool_chain", ""),
        row.get("command", ""),
        row.get("params_json", ""),
    )


def near_pareto_rows(rows, pareto, limit):
    pareto_hashes = set(row.get("aig_hash") for row in pareto)
    valid = [row for row in rows if is_pool_candidate(row) and row.get("aig_hash") not in pareto_hashes]
    if not valid or limit <= 0:
        return []
    best_adp = min(parse_int(row.get("adp")) for row in pareto) if pareto else min(parse_int(row.get("adp")) for row in valid)
    threshold = int(best_adp * 1.10) if best_adp is not None else None
    near = []
    seen_family = set()
    for row in sorted(valid, key=candidate_sort_key):
        if threshold is not None and parse_int(row.get("adp")) is not None and parse_int(row.get("adp")) <= threshold:
            near.append(row)
        elif row.get("family_id") not in seen_family:
            near.append(row)
            seen_family.add(row.get("family_id"))
        if len(near) >= limit:
            break
    return near


def select_active(pareto, near, max_active):
    selected = []
    seen_hashes = set()

    def add(row):
        if not row.get("aig_hash") or row.get("aig_hash") in seen_hashes:
            return
        selected.append(row)
        seen_hashes.add(row.get("aig_hash"))

    if pareto:
        add(min(pareto, key=candidate_sort_key))
        add(min(pareto, key=lambda row: parse_int(row.get("area")) or 10**18))
        add(min(pareto, key=lambda row: parse_int(row.get("delay")) or 10**18))
    best_by_family = {}
    for row in pareto + near:
        family = row.get("family_id", "")
        if family not in best_by_family or (parse_int(row.get("adp")) or 10**18) < (parse_int(best_by_family[family].get("adp")) or 10**18):
            best_by_family[family] = row
    for row in sorted(best_by_family.values(), key=candidate_sort_key):
        add(row)
    for row in pareto + near:
        add(row)
        if len(selected) >= max_active:
            break
    return selected[:max_active]


def reference_summary_for_case(case, references):
    return references.get(case, {"area": None, "delay": None, "adp": None})


class CaseRunner:
    def __init__(self, case, args, run_id, culs_slots, references):
        self.case = case
        self.args = args
        self.run_id = run_id
        self.culs_slots = culs_slots
        self.references = references
        self.truth = ROOT / "benchmarks" / "{0}.truth".format(case)
        self.case_work = ROOT / "student" / "work" / run_id / case
        self.checkpoint_dir = self.case_work / "checkpoints"
        self.logs_dir = self.case_work / "logs"
        self.artifacts_dir = self.case_work / "artifacts"
        self.seed_work_dir = self.case_work / "seeds"
        self.history_path = self.checkpoint_dir / "history.csv"
        self.pareto_path = self.checkpoint_dir / "pareto.csv"
        self.best_path = self.checkpoint_dir / "best.csv"
        self.profile_path = self.checkpoint_dir / "case_profile.csv"
        self.summary_path = self.checkpoint_dir / "summary.csv"
        self.rows = []
        self.completed_tasks = set()
        self.seen_hashes = set()
        self.hash_to_row = {}
        self.active_pool = []
        self.archive_pool = []
        self.near_pool = []
        self.global_round = 0
        self.start_time = time.time()

    def setup(self):
        for path in (self.checkpoint_dir, self.logs_dir, self.artifacts_dir, self.seed_work_dir):
            path.mkdir(parents=True, exist_ok=True)
        if self.args.resume and self.history_path.is_file():
            self.rows = read_csv(self.history_path)
            self.completed_tasks = set(read_json(self.checkpoint_dir / "completed_tasks.json", []))
            self.seen_hashes = set(read_json(self.checkpoint_dir / "seen_hashes.json", []))
            self.global_round = int(read_json(self.checkpoint_dir / "run_state.json", {}).get("global_round", 0))
            for row in self.rows:
                if row.get("aig_hash"):
                    self.hash_to_row.setdefault(row["aig_hash"], row)
            self.update_pools(mark_flags=False)

    def save_state(self):
        write_csv(self.history_path, self.rows, HISTORY_FIELDNAMES)
        write_csv(self.pareto_path, self.archive_pool, HISTORY_FIELDNAMES)
        best = self.best_row()
        write_csv(self.best_path, [] if best is None else [best], HISTORY_FIELDNAMES)
        write_csv(self.profile_path, self.profile_rows(), PROFILE_FIELDNAMES)
        write_csv(self.summary_path, [self.summary_row()], SUMMARY_FIELDNAMES)
        write_json(self.checkpoint_dir / "seen_hashes.json", sorted(self.seen_hashes))
        write_json(self.checkpoint_dir / "completed_tasks.json", sorted(self.completed_tasks))
        write_json(self.checkpoint_dir / "active_pool.json", [row.get("candidate_id") for row in self.active_pool])
        write_json(self.checkpoint_dir / "archive_pool.json", [row.get("candidate_id") for row in self.archive_pool])
        write_json(self.checkpoint_dir / "case_profile.json", self.profile_rows())
        write_json(self.checkpoint_dir / "run_state.json", {"global_round": self.global_round, "updated_at": time.time()})

    def load_seed_rows(self):
        existing_seed_rows = [row for row in self.rows if row.get("source") == "seed"]
        if existing_seed_rows:
            return existing_seed_rows
        seeds = self.discover_seeds()
        seed_rows = []
        for seed in seeds:
            task_key = seed_key(seed)
            if task_key in self.completed_tasks:
                continue
            row = self.evaluate_seed(seed)
            self.rows.append(row)
            seed_rows.append(row)
            self.completed_tasks.add(task_key)
            if row.get("aig_hash"):
                if row["aig_hash"] in self.seen_hashes:
                    duplicate = self.hash_to_row.get(row["aig_hash"])
                    if duplicate is not None and duplicate.get("candidate_id") != row.get("candidate_id"):
                        row["duplicate_of"] = duplicate.get("candidate_id", "")
                else:
                    self.seen_hashes.add(row["aig_hash"])
                    self.hash_to_row.setdefault(row["aig_hash"], row)
            self.save_state()
        return seed_rows

    def discover_seeds(self):
        seeds = []
        current_csv = self.args.current_bundle / "results" / "best.csv"
        for row in read_csv(current_csv):
            if row.get("case") != self.case:
                continue
            seeds.append(self.seed_from_csv_row(row, "current", current_csv))
        backend_bundles = sorted((ROOT / "student" / "seeds" / self.args.domain).glob(self.args.backend_bundle_glob))
        alternatives = []
        for bundle in backend_bundles:
            candidate_csv = bundle / "results" / "candidates.csv"
            for row in read_csv(candidate_csv):
                if row.get("case") == self.case:
                    alternatives.append((parse_int(row.get("adp")) or 10**18, row, candidate_csv))
        for index, (_adp, row, source_csv) in enumerate(sorted(alternatives, key=lambda item: (item[0], item[1].get("candidate_id", ""))), 1):
            seeds.append(self.seed_from_csv_row(row, "alt{0:02d}".format(index), source_csv))
        return seeds

    def seed_from_csv_row(self, row, family_id, source_csv):
        aig_path = resolve_path(row.get("aig_path") or row.get("source_aig_path"))
        verilog_path = resolve_path(row.get("verilog_path") or row.get("source_verilog_path"))
        return {
            "case": self.case,
            "family_id": family_id,
            "candidate_id": row.get("candidate_id") or "{0}_{1}".format(self.case, family_id),
            "aig_path": aig_path,
            "verilog_path": verilog_path,
            "source_csv": source_csv,
            "source_adp": parse_int(row.get("adp")),
            "notes": row.get("notes", ""),
        }

    def synthesize_missing_aig(self, seed):
        verilog = seed.get("verilog_path")
        if not verilog or not Path(verilog).is_file():
            raise RuntimeError("Seed has no usable AIG or Verilog: {0}".format(seed))
        output = self.seed_work_dir / "synthesized" / "{0}_{1}.aig".format(self.case, safe_id(seed["candidate_id"]))
        script_out = output.with_suffix(".ys")
        log_path = output.with_suffix(".yosys.log")
        module = first_module_name(verilog)
        log = synthesize_verilog(
            verilog=verilog,
            module=module,
            output=output,
            yosys=self.args.yosys,
            timeout=self.args.yosys_timeout,
            script_out=script_out,
        )
        log_path.parent.mkdir(parents=True, exist_ok=True)
        with log_path.open("w") as handle:
            handle.write(log)
        return output

    def evaluate_seed(self, seed):
        row = blank_row()
        row.update(
            {
                "case": self.case,
                "family_id": seed["family_id"],
                "parent_id": "",
                "parent_hash": "",
                "source": "seed",
                "tool": "seed",
                "tool_chain": "seed",
                "command": "seed",
                "command_expanded": "seed",
                "params_json": "{}",
                "verilog_path": rel(seed.get("verilog_path")),
                "seed_origin": rel(seed.get("source_csv")),
                "round": "0",
                "phase": "seed",
                "tier": "seed",
                "notes": seed.get("notes", ""),
            }
        )
        start = time.time()
        try:
            aig = seed.get("aig_path")
            if not aig or not Path(aig).is_file():
                aig = self.synthesize_missing_aig(seed)
                row["notes"] = (row.get("notes", "") + " synthesized missing AIG").strip()
            equivalent, cec_output = is_equivalent(self.args.abc, self.truth, aig, timeout=self.args.abc_timeout)
            row["equivalent"] = "1" if equivalent else "0"
            if equivalent:
                area, delay, adp = measure_adp(self.args.abc, aig, timeout=self.args.abc_timeout)
                row["area"] = str(area)
                row["delay"] = str(delay)
                row["adp"] = str(adp)
                digest = file_sha256(aig)
                row["aig_hash"] = digest
                stable = self.stable_aig_path("seeds", row, digest)
                shutil.copyfile(str(aig), str(stable))
                row["aig_path"] = rel(stable)
                row["candidate_id"] = stable.stem
            else:
                row["aig_path"] = rel(aig)
                row["candidate_id"] = "{0}_seed_{1}_non_equiv".format(self.case, seed["family_id"])
                row["notes"] = (row.get("notes", "") + " " + cec_output[-500:]).strip()
        except Exception as exc:
            row["equivalent"] = "0"
            row["candidate_id"] = "{0}_seed_{1}_failed".format(self.case, seed["family_id"])
            row["notes"] = "seed evaluation failed: {0}: {1}".format(type(exc).__name__, exc)
        row["runtime_sec"] = "{0:.3f}".format(time.time() - start)
        return row

    def stable_aig_path(self, subdir, row, digest):
        area = row.get("area") or "na"
        delay = row.get("delay") or "na"
        adp = row.get("adp") or "na"
        name = "{case}_r{round}_{tool}_{chain}_p{parent}_a{area}_d{delay}_adp{adp}_{hash8}.aig".format(
            case=self.case,
            round=str(row.get("round", "0")).zfill(3),
            tool=safe_id(row.get("tool", "tool"), 24),
            chain=safe_id(row.get("tool_chain", "chain"), 48),
            parent=safe_id(row.get("parent_id") or row.get("family_id") or "root", 24),
            area=area,
            delay=delay,
            adp=adp,
            hash8=digest[:8],
        )
        target = self.case_work / subdir / name
        target.parent.mkdir(parents=True, exist_ok=True)
        return target

    def run(self):
        self.setup()
        self.load_seed_rows()
        self.update_pools(mark_flags=True)
        self.save_state()
        if self.args.seed_only:
            return self.case_result()

        phases = ["abc_abc9"]
        if not self.args.skip_mockturtle:
            phases.append("mockturtle")
        if not self.args.skip_culs:
            phases.append("culs")

        for _cycle in range(self.args.max_cycles):
            for phase in phases:
                no_improve_rounds = 0
                for round_in_phase in range(self.args.max_rounds_per_phase):
                    if self.time_limit_reached():
                        self.save_state()
                        return self.case_result()
                    commands = commands_for_phase(phase, round_in_phase, self.args)
                    if not commands:
                        continue
                    parents = self.select_parents(phase, round_in_phase)
                    if not parents:
                        continue
                    previous_pareto_hashes = set(row.get("aig_hash") for row in pareto_rows(self.rows))
                    round_rows = self.run_round(phase, round_in_phase, parents, commands)
                    self.update_pools(mark_flags=True)
                    new_pareto_hashes = set(row.get("aig_hash") for row in pareto_rows(self.rows)) - previous_pareto_hashes
                    for row in round_rows:
                        if row.get("aig_hash") in new_pareto_hashes:
                            row["is_new_pareto"] = "1"
                    if new_pareto_hashes:
                        no_improve_rounds = 0
                    else:
                        no_improve_rounds += 1
                    self.global_round += 1
                    self.save_state()
                    if no_improve_rounds >= self.args.stagnation_rounds:
                        break
        self.save_best_aig()
        self.save_state()
        return self.case_result()

    def time_limit_reached(self):
        if self.args.per_case_runtime_soft_limit <= 0:
            return False
        return (time.time() - self.start_time) >= self.args.per_case_runtime_soft_limit

    def select_parents(self, phase, round_in_phase):
        if phase == "abc_abc9" and self.global_round == 0 and round_in_phase == 0:
            parents = [row for row in self.rows if row.get("source") == "seed" and is_pool_candidate(row)]
        else:
            parents = [row for row in self.active_pool if is_pool_candidate(row)]
            if not parents:
                parents = [row for row in self.archive_pool if is_pool_candidate(row)]
        parents.sort(key=candidate_sort_key)
        return parents[: self.args.max_parents_per_round]

    def run_round(self, phase, round_in_phase, parents, commands):
        round_rows = []
        for parent_index, parent in enumerate(parents):
            for command_row in commands:
                if len(self.rows) >= self.args.max_history_per_case:
                    return round_rows
                key = completed_key(parent.get("aig_hash"), command_row)
                if key in self.completed_tasks:
                    continue
                row = self.run_command_candidate(phase, round_in_phase, parent_index, parent, command_row)
                self.rows.append(row)
                round_rows.append(row)
                self.completed_tasks.add(key)
                if row.get("aig_hash"):
                    if row["aig_hash"] in self.seen_hashes:
                        duplicate = self.hash_to_row.get(row["aig_hash"])
                        if duplicate is not None and duplicate.get("candidate_id") != row.get("candidate_id"):
                            row["duplicate_of"] = duplicate.get("candidate_id", "")
                    else:
                        self.seen_hashes.add(row["aig_hash"])
                        self.hash_to_row[row["aig_hash"]] = row
                self.save_state()
        return round_rows

    def run_command_candidate(self, phase, round_in_phase, parent_index, parent, command_row):
        row = blank_row()
        row.update(
            {
                "case": self.case,
                "family_id": parent.get("family_id", ""),
                "parent_id": parent.get("candidate_id", ""),
                "parent_hash": parent.get("aig_hash", ""),
                "source": command_row["tool"],
                "tool": command_row["tool"],
                "tool_chain": command_row["tool_chain"],
                "command": command_row["command"],
                "command_expanded": command_row["command_expanded"],
                "params_json": command_row.get("params_json", "{}"),
                "seed_origin": parent.get("seed_origin", ""),
                "parent_area": parent.get("area", ""),
                "parent_delay": parent.get("delay", ""),
                "parent_adp": parent.get("adp", ""),
                "round": str(self.global_round),
                "phase": phase,
                "tier": command_row.get("tier", ""),
            }
        )
        parent_aig = ROOT / parent["aig_path"] if not Path(parent["aig_path"]).is_absolute() else Path(parent["aig_path"])
        output_dir = self.case_work / "round_{0:03d}_{1}".format(self.global_round, phase) / safe_id(command_row["tool_chain"])
        output_aig = output_dir / "{0}_{1}_p{2:03d}.aig".format(self.case, safe_id(command_row["tool_chain"]), parent_index)
        log_path = self.logs_dir / "round_{0:03d}_{1}_{2}_p{3:03d}.log".format(
            self.global_round,
            safe_id(command_row["tool"]),
            safe_id(command_row["tool_chain"]),
            parent_index,
        )
        start = time.time()
        try:
            if command_row["tool"] in ("abc", "abc9"):
                log = run_aig_flow(
                    abc=self.args.abc,
                    input_aig=parent_aig,
                    output_aig=output_aig,
                    commands=command_row["command_expanded"],
                    timeout=self.args.abc_timeout,
                )
            elif command_row["tool"] == "mockturtle":
                log = run_mockturtle(
                    input_aig=parent_aig,
                    output_aig=output_aig,
                    runner=self.args.mockturtle_runner,
                    flow=command_row["command"],
                    timeout=self.args.mockturtle_timeout,
                )
            elif command_row["tool"] == "culs":
                log = self.run_culs(parent_aig, output_aig)
            else:
                raise RuntimeError("Unknown tool: {0}".format(command_row["tool"]))
            log_path.parent.mkdir(parents=True, exist_ok=True)
            with log_path.open("w") as handle:
                handle.write(log or "")
            equivalent, cec_output = is_equivalent(self.args.abc, self.truth, output_aig, timeout=self.args.abc_timeout)
            row["equivalent"] = "1" if equivalent else "0"
            row["aig_path"] = rel(output_aig)
            if equivalent:
                area, delay, adp = measure_adp(self.args.abc, output_aig, timeout=self.args.abc_timeout)
                row["area"] = str(area)
                row["delay"] = str(delay)
                row["adp"] = str(adp)
                row["delta_area"] = int_str_delta(parent.get("area"), area)
                row["delta_delay"] = int_str_delta(parent.get("delay"), delay)
                row["delta_adp"] = int_str_delta(parent.get("adp"), adp)
                digest = file_sha256(output_aig)
                row["aig_hash"] = digest
                stable = self.stable_aig_path("artifacts", row, digest)
                shutil.copyfile(str(output_aig), str(stable))
                row["aig_path"] = rel(stable)
                row["candidate_id"] = stable.stem
            else:
                row["candidate_id"] = "{0}_r{1:03d}_{2}_non_equiv".format(
                    self.case,
                    self.global_round,
                    safe_id(command_row["tool_chain"]),
                )
                row["notes"] = cec_output[-1000:] if cec_output else "CEC failed"
        except subprocess.TimeoutExpired as exc:
            row["equivalent"] = "0"
            row["candidate_id"] = "{0}_r{1:03d}_{2}_timeout".format(self.case, self.global_round, safe_id(command_row["tool_chain"]))
            row["notes"] = "timeout after {0}s".format(getattr(exc, "timeout", "unknown"))
        except Exception as exc:
            row["equivalent"] = "0"
            row["candidate_id"] = "{0}_r{1:03d}_{2}_failed".format(self.case, self.global_round, safe_id(command_row["tool_chain"]))
            row["notes"] = "{0}: {1}".format(type(exc).__name__, exc)
        row["runtime_sec"] = "{0:.3f}".format(time.time() - start)
        return row

    def run_culs(self, input_aig, output_aig):
        culs_bin = Path(self.args.culs_bin)
        if not culs_bin.is_file():
            raise RuntimeError("CULS gpuls executable not found: {0}".format(culs_bin))
        slot = self.culs_slots.get()
        try:
            env = os.environ.copy()
            if slot is not None:
                env["CUDA_VISIBLE_DEVICES"] = str(slot)
            output_aig = Path(output_aig)
            output_aig.parent.mkdir(parents=True, exist_ok=True)
            if output_aig.exists():
                output_aig.unlink()
            script = "read {0}; resyn2; write {1}".format(input_aig, output_aig)
            result = subprocess.run(
                [str(culs_bin), "-c", script],
                stdout=subprocess.PIPE,
                stderr=subprocess.STDOUT,
                universal_newlines=True,
                timeout=self.args.culs_timeout,
                env=env,
            )
            if result.returncode != 0:
                raise RuntimeError("CULS failed with return code {0}: {1}".format(result.returncode, result.stdout[-2000:]))
            if not output_aig.is_file() or output_aig.stat().st_size == 0:
                raise RuntimeError("CULS did not create a non-empty output: {0}".format(output_aig))
            return result.stdout
        finally:
            self.culs_slots.put(slot)

    def update_pools(self, mark_flags=True):
        pareto = pareto_rows(self.rows)
        near = near_pareto_rows(self.rows, pareto, self.args.max_near_pareto_points)
        active = select_active(pareto, near, self.args.max_active_search_points)
        archive = (pareto + near)[: self.args.max_archive_pareto_points]
        self.active_pool = active
        self.archive_pool = archive
        self.near_pool = near
        if mark_flags:
            pareto_ids = set(row.get("candidate_id") for row in pareto)
            near_ids = set(row.get("candidate_id") for row in near)
            active_ids = set(row.get("candidate_id") for row in active)
            for row in self.rows:
                row["is_pareto"] = "1" if row.get("candidate_id") in pareto_ids else "0"
                row["is_near_pareto"] = "1" if row.get("candidate_id") in near_ids else "0"
                row["is_active"] = "1" if row.get("candidate_id") in active_ids else "0"

    def best_row(self):
        valid = [row for row in self.rows if is_pool_candidate(row)]
        if not valid:
            return None
        return min(valid, key=candidate_sort_key)

    def save_best_aig(self):
        best = self.best_row()
        if best is None or not best.get("aig_path"):
            return
        source = ROOT / best["aig_path"] if not Path(best["aig_path"]).is_absolute() else Path(best["aig_path"])
        target = ROOT / "student" / "work" / "best" / "{0}_{1}.aig".format(self.run_id, self.case)
        target.parent.mkdir(parents=True, exist_ok=True)
        if source.is_file():
            shutil.copyfile(str(source), str(target))

    def profile_rows(self):
        grouped = OrderedDict()
        for row in self.rows:
            key = (
                row.get("case", ""),
                row.get("family_id", ""),
                row.get("tool", ""),
                row.get("tool_chain", ""),
                row.get("command", ""),
                row.get("params_json", "{}"),
            )
            if key not in grouped:
                grouped[key] = []
            grouped[key].append(row)
        profile = []
        for key, rows in grouped.items():
            recent = rows[-self.args.recent_window :]
            equivalent_count = sum(1 for row in rows if truthy(row.get("equivalent")))
            new_pareto_count = sum(1 for row in rows if truthy(row.get("is_new_pareto")))
            timeout_count = sum(1 for row in rows if "timeout" in row.get("notes", "").lower() or row.get("candidate_id", "").endswith("_timeout"))
            failure_count = sum(1 for row in rows if not truthy(row.get("equivalent")))
            profile.append(
                {
                    "case": key[0],
                    "family_id": key[1],
                    "tool": key[2],
                    "tool_chain": key[3],
                    "command": key[4],
                    "params_json": key[5],
                    "attempts": str(len(rows)),
                    "equivalent_count": str(equivalent_count),
                    "new_pareto_count": str(new_pareto_count),
                    "timeout_count": str(timeout_count),
                    "failure_count": str(failure_count),
                    "best_delta_adp": min_numeric(rows, "delta_adp"),
                    "best_delta_area": min_numeric(rows, "delta_area"),
                    "best_delta_delay": min_numeric(rows, "delta_delay"),
                    "recent_attempts": str(len(recent)),
                    "recent_new_pareto_count": str(sum(1 for row in recent if truthy(row.get("is_new_pareto")))),
                    "recent_success_rate": "{0:.3f}".format(
                        float(sum(1 for row in recent if truthy(row.get("is_new_pareto")))) / float(len(recent))
                        if recent
                        else 0.0
                    ),
                }
            )
        return profile

    def summary_row(self):
        best = self.best_row()
        ref = reference_summary_for_case(self.case, self.references)
        best_adp = parse_int(best.get("adp")) if best else None
        ref_adp = ref.get("adp")
        ratio = ""
        if best_adp is not None and ref_adp:
            ratio = "{0:.6f}".format(float(best_adp) / float(ref_adp))
        return {
            "case": self.case,
            "best_candidate_id": "" if best is None else best.get("candidate_id", ""),
            "best_aig_path": "" if best is None else best.get("aig_path", ""),
            "best_area": "" if best is None else best.get("area", ""),
            "best_delay": "" if best is None else best.get("delay", ""),
            "best_adp": "" if best is None else best.get("adp", ""),
            "reference_area": "" if ref.get("area") is None else str(ref.get("area")),
            "reference_delay": "" if ref.get("delay") is None else str(ref.get("delay")),
            "reference_adp": "" if ref.get("adp") is None else str(ref.get("adp")),
            "adp_ratio_to_reference": ratio,
            "beats_reference": "1" if best_adp is not None and ref_adp is not None and best_adp < ref_adp else "0",
            "pareto_points": str(len(pareto_rows(self.rows))),
            "near_pareto_points": str(len(self.near_pool)),
            "history_rows": str(len(self.rows)),
        }

    def case_result(self):
        return {
            "case": self.case,
            "history": self.history_path,
            "pareto": self.pareto_path,
            "best": self.best_path,
            "profile": self.profile_path,
            "summary": self.summary_path,
            "rows": len(self.rows),
        }


def int_str_delta(parent_value, child_value):
    parent = parse_int(parent_value)
    child = parse_int(child_value)
    if parent is None or child is None:
        return ""
    return str(child - parent)


def min_numeric(rows, field):
    values = [parse_int(row.get(field)) for row in rows if parse_int(row.get(field)) is not None]
    if not values:
        return ""
    return str(min(values))


def resolve_path(value):
    if not value:
        return None
    path = Path(value)
    if not path.is_absolute():
        path = ROOT / path
    return path


def merge_case_outputs(run_id, results):
    run_dir = ROOT / "student" / "runs" / DEFAULT_DOMAIN / run_id
    results_dir = run_dir / "results"
    results_dir.mkdir(parents=True, exist_ok=True)

    history = []
    pareto = []
    best = []
    profiles = []
    summary = []
    failures = []
    for result in results:
        if "error" in result:
            failures.append(result)
            continue
        history.extend(read_csv(result["history"]))
        pareto.extend(read_csv(result["pareto"]))
        best.extend(read_csv(result["best"]))
        profiles.extend(read_csv(result["profile"]))
        summary.extend(read_csv(result["summary"]))

    history.sort(key=history_sort_key)
    pareto.sort(key=candidate_sort_key)
    best.sort(key=candidate_sort_key)
    profiles.sort(key=profile_sort_key)
    summary.sort(key=lambda row: case_sort_key(row.get("case", "")))

    write_csv(results_dir / "history.csv", history, HISTORY_FIELDNAMES)
    write_csv(results_dir / "pareto.csv", pareto, HISTORY_FIELDNAMES)
    write_csv(results_dir / "best.csv", best, HISTORY_FIELDNAMES)
    write_csv(results_dir / "case_profile.csv", profiles, PROFILE_FIELDNAMES)
    write_csv(results_dir / "summary.csv", summary, SUMMARY_FIELDNAMES)
    if failures:
        write_csv(results_dir / "case_failures.csv", failures, ["case", "error", "traceback"])
    write_manifest(run_id, run_dir, history, summary, failures)


def write_manifest(run_id, run_dir, history, summary, failures):
    text = [
        "# {0}".format(run_id),
        "",
        "Run ID: `{0}`".format(run_id),
        "",
        "Purpose: BF16 backend portfolio V1 over ex200-ex219 seeds.",
        "",
        "Inputs:",
        "- Current seeds: `student/seeds/bf16/ex200_ex219_current/`",
        "- Backend candidate seeds: `student/seeds/bf16/ex200_ex219_backend_candidates_*`",
        "- Truth files: `benchmarks/exNNN.truth`",
        "- Reference: `reference_result.csv`",
        "",
        "Artifacts:",
        "- Work directory: `student/work/{0}/`".format(run_id),
        "- History CSV: `results/history.csv`",
        "- Pareto CSV: `results/pareto.csv`",
        "- Best CSV: `results/best.csv`",
        "- Summary CSV: `results/summary.csv`",
        "- Case profile CSV: `results/case_profile.csv`",
        "",
        "Methods tried:",
        "- ABC Tier 0/Tier 1 expanded macro flows",
        "- ABC9 `&syn2; &dc2` flow",
        "- MockTurtle basic flows",
        "- CULS `resyn2` flow when enabled",
        "",
        "Result counts:",
        "- History rows: {0}".format(len(history)),
        "- Summary rows: {0}".format(len(summary)),
        "- Case failures: {0}".format(len(failures)),
        "",
    ]
    path = run_dir / "MANIFEST.md"
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w") as handle:
        handle.write("\n".join(text))


def create_run_layout(run_id, args):
    work_root = ROOT / "student" / "work" / run_id
    run_root = ROOT / "student" / "runs" / args.domain / run_id
    work_root.mkdir(parents=True, exist_ok=True)
    (run_root / "results").mkdir(parents=True, exist_ok=True)
    write_json(
        work_root / "command_library.json",
        command_library_rows(
            include_abc9=not args.skip_abc9,
            include_mockturtle=not args.skip_mockturtle,
            include_culs=not args.skip_culs,
        ),
    )
    write_json(
        work_root / "run_state.json",
        {
            "run_id": run_id,
            "domain": args.domain,
            "cases": args.cases,
            "created_at": time.strftime("%Y-%m-%d %H:%M:%S %z"),
        },
    )


def run_case_worker(case, args, run_id, culs_slots, references):
    runner = CaseRunner(case, args, run_id, culs_slots, references)
    try:
        return runner.run()
    except Exception as exc:
        trace = traceback.format_exc()
        failure_dir = ROOT / "student" / "work" / run_id / case / "checkpoints"
        failure_dir.mkdir(parents=True, exist_ok=True)
        with (failure_dir / "case_failure.txt").open("w") as handle:
            handle.write(trace)
        return {"case": case, "error": "{0}: {1}".format(type(exc).__name__, exc), "traceback": trace}


def parse_args(argv=None):
    parser = argparse.ArgumentParser(description="Run BF16 backend portfolio V1.")
    parser.add_argument("--domain", default=DEFAULT_DOMAIN)
    parser.add_argument("--cases", default=DEFAULT_CASES)
    parser.add_argument("--run-id", default=None)
    parser.add_argument("--current-bundle", type=Path, default=DEFAULT_CURRENT_BUNDLE)
    parser.add_argument("--backend-bundle-glob", default=DEFAULT_BACKEND_BUNDLE_GLOB)
    parser.add_argument("--abc", type=Path, default=DEFAULT_ABC)
    parser.add_argument("--yosys", type=Path, default=DEFAULT_YOSYS)
    parser.add_argument("--mockturtle-runner", type=Path, default=None)
    parser.add_argument("--culs-bin", type=Path, default=default_culs_bin())
    parser.add_argument("--jobs", type=int, default=8)
    parser.add_argument("--culs-jobs", type=int, default=4)
    parser.add_argument("--max-cycles", type=int, default=1)
    parser.add_argument("--max-history-per-case", type=int, default=3000)
    parser.add_argument("--max-active-search-points", type=int, default=64)
    parser.add_argument("--max-archive-pareto-points", type=int, default=512)
    parser.add_argument("--max-near-pareto-points", type=int, default=64)
    parser.add_argument("--max-parents-per-round", type=int, default=16)
    parser.add_argument("--max-rounds-per-phase", type=int, default=3)
    parser.add_argument("--stagnation-rounds", type=int, default=2)
    parser.add_argument("--abc-timeout", type=int, default=60)
    parser.add_argument("--mockturtle-timeout", type=int, default=120)
    parser.add_argument("--culs-timeout", type=int, default=180)
    parser.add_argument("--yosys-timeout", type=int, default=120)
    parser.add_argument("--per-case-runtime-soft-limit", type=int, default=3600)
    parser.add_argument("--recent-window", type=int, default=50)
    parser.add_argument("--resume", action="store_true", default=True)
    parser.add_argument("--no-resume", action="store_false", dest="resume")
    parser.add_argument("--seed-only", action="store_true", help="Evaluate seeds and write initial outputs only.")
    parser.add_argument("--skip-abc9", action="store_true")
    parser.add_argument("--skip-mockturtle", action="store_true")
    parser.add_argument("--skip-culs", action="store_true")
    return parser.parse_args(argv)


def main(argv=None):
    args = parse_args(argv)
    if args.domain != "bf16":
        raise SystemExit("V1 only supports --domain bf16")
    cases = parse_cases(args.cases)
    run_id = args.run_id or "ex200_ex219_backend_portfolio_v1_{0}".format(time.strftime("%Y%m%d_%H%M"))
    if args.mockturtle_runner is None:
        discovered = discover_runner()
        args.mockturtle_runner = discovered
    create_run_layout(run_id, args)
    references = load_reference(ROOT / "reference_result.csv")
    culs_slots = queue.Queue()
    for index in range(max(1, args.culs_jobs)):
        culs_slots.put(index)

    results = []
    with ThreadPoolExecutor(max_workers=max(1, args.jobs)) as executor:
        future_to_case = {
            executor.submit(run_case_worker, case, args, run_id, culs_slots, references): case for case in cases
        }
        for future in as_completed(future_to_case):
            result = future.result()
            results.append(result)
            if "error" in result:
                print("{0}: failed: {1}".format(result["case"], result["error"]), flush=True)
            else:
                print("{0}: rows={1}".format(result["case"], result["rows"]), flush=True)
    merge_case_outputs(run_id, results)
    print("run_id: {0}".format(run_id))
    print("results: {0}".format(ROOT / "student" / "runs" / args.domain / run_id / "results"))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
