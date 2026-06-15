#!/usr/bin/env python3
"""Merge round22 frontend campaign shard CSVs."""

import importlib.util
from pathlib import Path


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[3]
TEMPLATE = ROOT / "student" / "frontend_campaigns" / "campaigns" / "ex200_ex299_frontend_refgap_round20_20260613_0015" / "merge_round20_results.py"
RUN_ID = "ex200_ex299_frontend_refgap_round22_20260613_0218"

spec = importlib.util.spec_from_file_location("round22_merge_base", str(TEMPLATE))
merge = importlib.util.module_from_spec(spec)
spec.loader.exec_module(merge)

merge.RUN_ID = RUN_ID
merge.ROUND_LABEL = "round22"
merge.HERE = HERE
merge.ROOT = ROOT
merge.base.RUN_ID = RUN_ID
merge.base.HERE = HERE
merge.base.ROOT = ROOT
merge.base.SHARDS = HERE / "agent_shards"
merge.base.RESULTS = HERE / "results"
merge.base.FRONTEND = ROOT / "student" / "frontend_campaigns"

_read_rows_round20 = merge.read_rows_round20


def _domain(case):
    try:
        idx = int(case.replace("ex", ""))
    except Exception:
        return ""
    if 200 <= idx <= 219:
        return "bf16"
    if 220 <= idx <= 239:
        return "fp16"
    if 240 <= idx <= 254:
        return "float_fp8"
    if 255 <= idx <= 279:
        return "integer"
    if 280 <= idx <= 299:
        return "unknown"
    return ""


def _path_agent(path):
    return Path(path).parent.name


def read_rows_round22(path):
    rows = _read_rows_round20(path)
    name = Path(path).name
    if name == "failed_hypotheses.csv":
        normalized = []
        for row in rows:
            case = row.get("case", "")
            evidence = (
                row.get("artifact_path")
                or row.get("evidence_path")
                or row.get("log_path")
                or row.get("evaluate_log")
                or row.get("dossier_path")
                or ""
            )
            reason = (
                row.get("reason")
                or row.get("failure_reason")
                or row.get("notes")
                or row.get("outcome")
                or ""
            )
            notes = row.get("notes", "")
            next_action = row.get("next_action", "")
            if next_action:
                notes = (notes + "; " if notes else "") + "next_action=" + next_action
            normalized.append(
                {
                    "case": case,
                    "domain": row.get("domain") or _domain(case),
                    "hypothesis": row.get("hypothesis", ""),
                    "method_signature": row.get("method_signature", ""),
                    "status": row.get("status") or row.get("outcome") or "FAILED",
                    "reason": reason,
                    "artifact_path": evidence,
                    "log_path": row.get("log_path") or evidence,
                    "agent_id": row.get("agent_id") or _path_agent(path),
                    "run_id": row.get("run_id") or RUN_ID,
                    "notes": notes,
                }
            )
        return normalized
    if name == "shared_structure_report.csv":
        normalized = []
        for row in rows:
            case = row.get("case", "")
            shared = row.get("shared_structures") or row.get("shared_structure", "")
            if row.get("observed_invariants"):
                shared = (shared + "; " if shared else "") + row.get("observed_invariants", "")
            normalized.append(
                {
                    "case": case,
                    "domain": row.get("domain") or _domain(case),
                    "candidate_id": row.get("candidate_id") or row.get("method_signature") or row.get("hypothesis", ""),
                    "shared_structures": shared,
                    "sharing_strategy": row.get("sharing_strategy") or row.get("representation_family", ""),
                    "estimated_benefit": row.get("estimated_benefit", ""),
                    "agent_id": row.get("agent_id") or _path_agent(path),
                    "run_id": row.get("run_id") or RUN_ID,
                    "notes": row.get("notes", ""),
                }
            )
        return normalized
    if name in ("candidates.csv", "evaluation_results.csv"):
        normalized = []
        for row in rows:
            case = row.get("case", "")
            if not row.get("domain"):
                row["domain"] = _domain(case)
            if not row.get("agent_id"):
                row["agent_id"] = _path_agent(path)
            if not row.get("run_id"):
                row["run_id"] = RUN_ID
            if not row.get("log_path"):
                row["log_path"] = row.get("evaluate_log") or row.get("eval_log") or row.get("evaluate_py_log_path") or ""
            if not row.get("equivalent") and row.get("verified_truth"):
                row["equivalent"] = row.get("verified_truth", "")
            if name == "evaluation_results.csv":
                cid = row.get("candidate_id", "").lower()
                has_official_shape = bool(row.get("verilog_path") and row.get("aig_path") and row.get("log_path"))
                has_qor = merge.base.as_int(row.get("area")) is not None or merge.base.as_int(row.get("adp")) is not None
                has_equiv = row.get("equivalent") in ("0", "1")
                if ("blocked" in cid or "no_candidate" in cid) and not has_official_shape:
                    continue
                if not (has_equiv or has_qor or has_official_shape):
                    continue
            normalized.append(row)
        return normalized
    return rows


merge.base.read_rows = read_rows_round22

merge.run_merge()
