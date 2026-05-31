"""ABC-backed candidate flows."""

import time
from pathlib import Path

from student.common.abc import is_equivalent, measure_adp, run_aig_flow
from student.common.candidate import Candidate


ABC_RESYN2_COMMANDS = (
    "balance; rewrite; refactor; balance; rewrite; rewrite -z; "
    "balance; refactor -z; rewrite -z; balance"
)


def evaluate_aig(case, candidate_id, parent_id, source, tool_chain, aig_path, truth, abc, notes="", timeout=60):
    start = time.time()
    equivalent, cec_output = is_equivalent(abc, truth, aig_path, timeout=timeout)
    area = None
    delay = None
    adp = None
    final_notes = notes
    if equivalent:
        area, delay, adp = measure_adp(abc, aig_path, timeout=timeout)
    elif not final_notes:
        final_notes = cec_output.splitlines()[-1] if cec_output else "CEC failed"
    runtime_sec = time.time() - start
    return Candidate(
        case=case,
        candidate_id=candidate_id,
        parent_id=parent_id,
        source=source,
        tool_chain=tool_chain,
        aig_path=Path(aig_path),
        area=area,
        delay=delay,
        adp=adp,
        equivalent=equivalent,
        runtime_sec=runtime_sec,
        notes=final_notes,
    )


def baseline_candidate(case, truth, baseline_dir, abc, timeout=60):
    aig_path = Path(baseline_dir) / "{0}.aig".format(case)
    if not aig_path.is_file():
        raise RuntimeError("Baseline AIG not found: {0}".format(aig_path))
    return evaluate_aig(
        case=case,
        candidate_id="{0}_baseline".format(case),
        parent_id="",
        source="baseline",
        tool_chain="baseline",
        aig_path=aig_path,
        truth=truth,
        abc=abc,
        notes="from baseline directory",
        timeout=timeout,
    )


def abc_resyn2_candidate(case, parent, truth, work_dir, abc, timeout=60):
    flow_dir = Path(work_dir) / case / "abc_resyn2"
    output_aig = flow_dir / "{0}_abc_resyn2.aig".format(case)
    start = time.time()
    run_aig_flow(
        abc=abc,
        input_aig=parent.aig_path,
        output_aig=output_aig,
        commands=ABC_RESYN2_COMMANDS,
        timeout=timeout,
    )
    generation_sec = time.time() - start
    candidate = evaluate_aig(
        case=case,
        candidate_id="{0}_abc_resyn2".format(case),
        parent_id=parent.candidate_id,
        source="abc",
        tool_chain="abc_resyn2",
        aig_path=output_aig,
        truth=truth,
        abc=abc,
        notes="expanded abc.rc resyn2 alias",
        timeout=timeout,
    )
    candidate.runtime_sec += generation_sec
    return candidate
