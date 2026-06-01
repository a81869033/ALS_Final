"""ABC-backed candidate flows."""

from collections import OrderedDict
import time
from pathlib import Path

from student.common.abc import is_equivalent, measure_adp, run_aig_flow
from student.common.candidate import Candidate


ABC_FLOW_COMMANDS = OrderedDict(
    [
        (
            "abc_bal_rw",
            "balance; rewrite; rewrite -z; balance",
        ),
        (
            "abc_resyn",
            "balance; rewrite; rewrite -z; balance; rewrite -z; balance",
        ),
        (
            "abc_resyn2",
            "balance; rewrite; refactor; balance; rewrite; rewrite -z; "
            "balance; refactor -z; rewrite -z; balance",
        ),
        (
            "abc_resyn2a",
            "balance; rewrite; balance; rewrite; rewrite -z; balance; rewrite -z; balance",
        ),
        (
            "abc_resyn3",
            "balance; resub; resub -K 6; balance; resub -z; resub -z -K 6; "
            "balance; resub -z -K 5; balance",
        ),
        (
            "abc_compress2",
            "balance -l; rewrite -l; refactor -l; balance -l; rewrite -l; "
            "rewrite -z -l; balance -l; refactor -z -l; rewrite -z -l; balance -l",
        ),
        (
            "abc_resyn2rs",
            "balance; resub -K 6; rewrite; resub -K 6 -N 2; refactor; "
            "resub -K 8; balance; resub -K 8 -N 2; rewrite; resub -K 10; "
            "rewrite -z; resub -K 10 -N 2; balance; resub -K 12; "
            "refactor -z; resub -K 12 -N 2; rewrite -z; balance",
        ),
        (
            "abc_compress2rs",
            "balance -l; resub -K 6 -l; rewrite -l; resub -K 6 -N 2 -l; "
            "refactor -l; resub -K 8 -l; balance -l; resub -K 8 -N 2 -l; "
            "rewrite -l; resub -K 10 -l; rewrite -z -l; resub -K 10 -N 2 -l; "
            "balance -l; resub -K 12 -l; refactor -z -l; resub -K 12 -N 2 -l; "
            "rewrite -z -l; balance -l",
        ),
        (
            "abc_dc2",
            "strash; dc2; balance",
        ),
        (
            "abc_dch",
            "strash; dch; balance",
        ),
        (
            "abc_dc2_dch",
            "strash; dc2; dch; balance",
        ),
        (
            "abc_dch_dc2",
            "strash; dch; dc2; balance",
        ),
        (
            "abc_dc2_rw",
            "strash; dc2; balance; rewrite; rewrite -z; balance",
        ),
        (
            "abc_dch_rw",
            "strash; dch; balance; rewrite; rewrite -z; balance",
        ),
        (
            "abc_src_rw",
            "strash; rewrite -l; rewrite -z -l; rewrite -z -l",
        ),
        (
            "abc_src_rws",
            "strash; rewrite -l; resub -K 6 -N 2 -l; rewrite -z -l; "
            "resub -K 9 -N 2 -l; rewrite -z -l; resub -K 12 -N 2 -l",
        ),
        (
            "abc_delay_try",
            "strash; dc2; if -K 6; strash; balance; rewrite -z; balance",
        ),
    ]
)


ABC_ALL_FLOWS = [
    "abc_resyn",
    "abc_resyn2",
    "abc_resyn2a",
    "abc_resyn3",
    "abc_compress2",
    "abc_resyn2rs",
    "abc_compress2rs",
    "abc_dc2",
    "abc_dch",
    "abc_dc2_dch",
    "abc_dch_dc2",
    "abc_dc2_rw",
    "abc_dch_rw",
    "abc_src_rw",
    "abc_src_rws",
    "abc_delay_try",
]


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


def abc_flow_candidate(case, flow_name, parent, truth, work_dir, abc, timeout=60):
    if flow_name not in ABC_FLOW_COMMANDS:
        raise RuntimeError("Unknown ABC flow: {0}".format(flow_name))
    flow_dir = Path(work_dir) / case / flow_name
    output_aig = flow_dir / "{0}_{1}.aig".format(case, flow_name)
    start = time.time()
    run_aig_flow(
        abc=abc,
        input_aig=parent.aig_path,
        output_aig=output_aig,
        commands=ABC_FLOW_COMMANDS[flow_name],
        timeout=timeout,
    )
    generation_sec = time.time() - start
    candidate = evaluate_aig(
        case=case,
        candidate_id="{0}_{1}".format(case, flow_name),
        parent_id=parent.candidate_id,
        source="abc",
        tool_chain=flow_name,
        aig_path=output_aig,
        truth=truth,
        abc=abc,
        notes="abc portfolio flow",
        timeout=timeout,
    )
    candidate.runtime_sec += generation_sec
    return candidate


def abc_resyn2_candidate(case, parent, truth, work_dir, abc, timeout=60):
    return abc_flow_candidate(
        case=case,
        flow_name="abc_resyn2",
        parent=parent,
        truth=truth,
        work_dir=work_dir,
        abc=abc,
        timeout=timeout,
    )
