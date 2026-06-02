"""CULS-backed candidate flows."""

import subprocess
import time
from pathlib import Path

from student.backends.abc_flow import evaluate_aig


def _format_failure_output(output):
    if not output:
        return ""
    return "\n{0}".format(output.strip())


def run_culs_resyn2(culs_bin, input_aig, output_aig, timeout=120):
    culs_bin = Path(culs_bin)
    input_aig = Path(input_aig)
    output_aig = Path(output_aig)

    if not culs_bin.is_file():
        raise RuntimeError("CULS gpuls executable not found: {0}".format(culs_bin))
    if not input_aig.is_file():
        raise RuntimeError("Input AIG not found: {0}".format(input_aig))

    output_aig.parent.mkdir(parents=True, exist_ok=True)
    script = "read {0}; resyn2; write {1}".format(input_aig, output_aig)

    try:
        result = subprocess.run(
            [str(culs_bin), "-c", script],
            stdout=subprocess.PIPE,
            stderr=subprocess.STDOUT,
            universal_newlines=True,
            timeout=timeout,
        )
    except subprocess.TimeoutExpired as exc:
        raise RuntimeError(
            "CULS gpuls timed out after {0}s. CUDA/GPU runtime may be unavailable "
            "or the optimization hung.{1}".format(timeout, _format_failure_output(exc.output))
        )

    if result.returncode != 0:
        if result.returncode < 0:
            hint = (
                " gpuls terminated by signal {0}; CUDA/GPU runtime may be "
                "unavailable in this environment.".format(-result.returncode)
            )
        elif result.returncode == 139:
            hint = (
                " gpuls segfaulted; CUDA/GPU runtime may be unavailable in this "
                "environment."
            )
        else:
            hint = ""
        raise RuntimeError(
            "CULS gpuls failed with return code {0}.{1}{2}".format(
                result.returncode,
                hint,
                _format_failure_output(result.stdout),
            )
        )

    if not output_aig.is_file():
        raise RuntimeError(
            "CULS gpuls did not create expected output: {0}{1}".format(
                output_aig,
                _format_failure_output(result.stdout),
            )
        )
    return result.stdout


def culs_resyn2_candidate(case, parent, truth, work_dir, culs_bin, abc, timeout=120):
    flow_name = "culs_resyn2"
    flow_dir = Path(work_dir) / case / flow_name
    output_aig = flow_dir / "{0}_{1}.aig".format(case, flow_name)

    start = time.time()
    run_culs_resyn2(
        culs_bin=culs_bin,
        input_aig=parent.aig_path,
        output_aig=output_aig,
        timeout=timeout,
    )
    generation_sec = time.time() - start

    candidate = evaluate_aig(
        case=case,
        candidate_id="{0}_{1}".format(case, flow_name),
        parent_id=parent.candidate_id,
        source="culs",
        tool_chain=flow_name,
        aig_path=output_aig,
        truth=truth,
        abc=abc,
        notes='CULS gpuls: read input; resyn2; write output',
        timeout=timeout,
    )
    candidate.runtime_sec += generation_sec
    return candidate
