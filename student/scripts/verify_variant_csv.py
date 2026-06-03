#!/usr/bin/env python3
"""Re-run evaluate.py for every equivalent AIG listed in a candidate CSV."""

import argparse
import csv
import re
import shutil
import subprocess
import sys
from pathlib import Path


ROOT = Path(__file__).resolve().parents[2]
ADP_RE = re.compile(r"Total ADP over equivalent cases:\s*(\d+)")


def read_rows(path):
    with Path(path).open() as handle:
        return list(csv.DictReader(handle))


def write_rows(path, fieldnames, rows):
    path = Path(path)
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=fieldnames)
        writer.writeheader()
        writer.writerows(rows)


def candidate_rows(rows):
    return [row for row in rows if row.get("equivalent") == "1" and row.get("aig_path")]


def copy_best(best_rows, best_dir):
    best_dir.mkdir(parents=True, exist_ok=True)
    copied = 0
    for row in best_rows:
        case = row["case"]
        src = ROOT / row["aig_path"]
        if not src.is_file():
            raise RuntimeError("best AIG not found: {0}".format(src))
        shutil.copy2(str(src), str(best_dir / "{0}.aig".format(case)))
        copied += 1
    return copied


def run_evaluate(case, aig_path, tmp_dir, timeout):
    dst = tmp_dir / "{0}.aig".format(case)
    if dst.exists():
        dst.unlink()
    shutil.copy2(str(aig_path), str(dst))
    proc = subprocess.run(
        [
            "python3",
            "evaluate.py",
            "--case",
            case,
            "--output",
            str(tmp_dir),
            "--timeout",
            str(timeout),
        ],
        cwd=str(ROOT),
        universal_newlines=True,
        stdout=subprocess.PIPE,
        stderr=subprocess.STDOUT,
    )
    match = ADP_RE.search(proc.stdout)
    return proc.returncode, match.group(1) if match else "", proc.stdout


def parse_args(argv=None):
    parser = argparse.ArgumentParser(description="Officially re-check candidate AIGs from a CSV.")
    parser.add_argument("--results", type=Path, required=True)
    parser.add_argument("--best-results", type=Path, required=True)
    parser.add_argument("--check-results", type=Path, required=True)
    parser.add_argument("--best-dir", type=Path, required=True)
    parser.add_argument("--tmp-dir", type=Path, required=True)
    parser.add_argument("--timeout", type=int, default=900)
    return parser.parse_args(argv)


def main(argv=None):
    args = parse_args(argv)
    rows = read_rows(args.results)
    best_rows = read_rows(args.best_results)
    args.tmp_dir.mkdir(parents=True, exist_ok=True)
    copied = copy_best(best_rows, args.best_dir)

    out_rows = []
    failures = []
    candidates = candidate_rows(rows)
    for index, row in enumerate(candidates, 1):
        case = row["case"]
        aig_path = ROOT / row["aig_path"]
        if not aig_path.is_file():
            out = dict(row)
            out.update(
                {
                    "evaluate_py_ok": "0",
                    "evaluate_py_adp": "",
                    "evaluate_py_returncode": "",
                    "evaluate_py_notes": "AIG not found: {0}".format(aig_path),
                }
            )
            out_rows.append(out)
            failures.append(out)
            print("{0}/{1} FAIL {2} missing AIG".format(index, len(candidates), case))
            continue
        returncode, eval_adp, output = run_evaluate(case, aig_path, args.tmp_dir, args.timeout)
        ok = returncode == 0 and eval_adp == row.get("adp", "")
        out = dict(row)
        out.update(
            {
                "evaluate_py_ok": "1" if ok else "0",
                "evaluate_py_adp": eval_adp,
                "evaluate_py_returncode": str(returncode),
                "evaluate_py_notes": "" if ok else output[-1000:],
            }
        )
        out_rows.append(out)
        if not ok:
            failures.append(out)
        print(
            "{0}/{1} {2} {3} {4} eval_adp={5} expected={6}".format(
                index,
                len(candidates),
                "OK" if ok else "FAIL",
                case,
                row.get("variant", row.get("candidate_id", "")),
                eval_adp,
                row.get("adp", ""),
            )
        )

    if out_rows:
        fieldnames = list(out_rows[0].keys())
    else:
        fieldnames = list(rows[0].keys()) if rows else []
    write_rows(args.check_results, fieldnames, out_rows)
    print("best_copied={0} best_dir={1}".format(copied, args.best_dir))
    print(
        "official_eval_ok={0}/{1} csv={2}".format(
            len(out_rows) - len(failures), len(out_rows), args.check_results
        )
    )
    return 1 if failures else 0


if __name__ == "__main__":
    raise SystemExit(main())
