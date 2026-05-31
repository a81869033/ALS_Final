"""Small ABC helpers used by project pipeline scripts."""

import re
import subprocess
from pathlib import Path


PS_RE = re.compile(r"and\s*=\s*(\d+)\s+(?:lev|level)\s*=\s*(\d+)")


def run_abc(abc, command, timeout=60):
    """Run one ABC command string and return combined stdout/stderr."""
    result = subprocess.run(
        [str(abc), "-c", command],
        stdout=subprocess.PIPE,
        stderr=subprocess.STDOUT,
        universal_newlines=True,
        timeout=timeout,
    )
    error_markers = [
        "** cmd error:",
        "Cannot open input file",
        "Cannot write",
        "Error: Empty network",
    ]
    has_error = any(marker in result.stdout for marker in error_markers)
    if result.returncode != 0 or has_error:
        raise RuntimeError(result.stdout.strip())
    return result.stdout


def is_equivalent(abc, truth, aig, timeout=60):
    command = "read_truth -xf {truth}; st; &get; &cec -t {aig}".format(
        truth=truth,
        aig=aig,
    )
    output = run_abc(abc, command, timeout=timeout)
    return "Networks are equivalent" in output, output.strip()


def measure_adp(abc, aig, timeout=60):
    output = run_abc(abc, "read {aig}; ps".format(aig=aig), timeout=timeout)
    match = PS_RE.search(output)
    if not match:
        raise RuntimeError("Cannot parse ABC statistics:\n{0}".format(output))
    area = int(match.group(1))
    delay = int(match.group(2))
    return area, delay, area * delay


def run_aig_flow(abc, input_aig, output_aig, commands, timeout=60):
    output_aig = Path(output_aig)
    output_aig.parent.mkdir(parents=True, exist_ok=True)
    command = "read {input_aig}; {commands}; write_aiger -s {output_aig}".format(
        input_aig=input_aig,
        commands=commands,
        output_aig=output_aig,
    )
    output = run_abc(abc, command, timeout=timeout)
    if not output_aig.is_file():
        raise RuntimeError("ABC flow did not create expected output: {0}".format(output_aig))
    return output
