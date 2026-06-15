"""Step-wise ABC helpers for backend search.

V3 GA runs one operator at a time so a slow command can timeout without losing
the whole sequence.
"""

from __future__ import print_function

import os
import re
import time

from student.common.abc import run_abc


_PS_IO_RE = re.compile(r"i/o\s*=\s*(\d+)\s*/\s*(\d+)")


def _q(path):
    return str(path)


def run_abc_operator(abc, input_aig, output_aig, command, timeout=60):
    os.makedirs(os.path.dirname(str(output_aig)), exist_ok=True)
    full_command = "read %s; %s; write_aiger -s %s" % (_q(input_aig), command, _q(output_aig))
    start = time.time()
    output = run_abc(abc, full_command, timeout=timeout)
    runtime = time.time() - start
    if not os.path.exists(str(output_aig)) or os.path.getsize(str(output_aig)) == 0:
        raise RuntimeError("ABC operator produced no output AIG")
    return {
        "status": "ok",
        "runtime_sec": runtime,
        "stdout": output,
        "stderr": "",
        "command": full_command,
    }


def parse_ps_io(text):
    match = _PS_IO_RE.search(text or "")
    if not match:
        return None, None
    return int(match.group(1)), int(match.group(2))


def infer_truth_io(abc, truth_path, timeout=60):
    command = "read_truth -xf %s; &get; &ps" % _q(truth_path)
    start = time.time()
    output = run_abc(abc, command, timeout=timeout)
    runtime = time.time() - start
    pi, po = parse_ps_io(output)
    if pi is None or po is None:
        raise RuntimeError("Could not parse PI/PO from ABC &ps output")
    return {
        "pi": pi,
        "po": po,
        "runtime_sec": runtime,
        "stdout": output,
        "stderr": "",
    }


def run_truth_ttopt(abc, truth_path, output_aig, timeout=120, pi=None, po=None):
    os.makedirs(os.path.dirname(str(output_aig)), exist_ok=True)
    infer_log = None
    if pi is None or po is None:
        infer_log = infer_truth_io(abc, truth_path, timeout=min(timeout, 60))
        pi = infer_log["pi"]
        po = infer_log["po"]

    command = (
        "read_truth -xf %s; &get; &ttopt -I %d -O %d; &put; strash; "
        "write_aiger -s %s"
    ) % (_q(truth_path), int(pi), int(po), _q(output_aig))
    start = time.time()
    output = run_abc(abc, command, timeout=timeout)
    runtime = time.time() - start
    if not os.path.exists(str(output_aig)) or os.path.getsize(str(output_aig)) == 0:
        raise RuntimeError("ttopt produced no output AIG")
    return {
        "status": "ok",
        "pi": int(pi),
        "po": int(po),
        "runtime_sec": runtime,
        "stdout": output,
        "stderr": "",
        "infer_log": infer_log,
        "command": command,
    }
