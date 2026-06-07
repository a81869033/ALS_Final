"""ABC9-backed candidate flows."""

from collections import OrderedDict
import time

from pathlib import Path

from student.backends.abc_flow import evaluate_aig
from student.common.abc import run_aig_flow


ABC9_DEEPSYN_FLOW = "abc9_deepsyn"
ABC9_DEEPSYN_NODE_LIMIT = 10000
ABC9_DEEPSYN_TIMEOUT = 3000

ABC9_FLOW_COMMANDS = OrderedDict(
    [
        (
            "abc9_syn2_dc2",
            "strash; &get; &st; &syn2; &dc2; &put; strash",
        ),
        (
            ABC9_DEEPSYN_FLOW,
            "strash; &get; &st; &deepsyn; &put; strash",
        ),
    ]
)


def abc9_flow_candidate(case, flow_name, parent, truth, work_dir, abc, timeout=60):
    if flow_name not in ABC9_FLOW_COMMANDS:
        raise RuntimeError("Unknown ABC9 flow: {0}".format(flow_name))

    flow_dir = Path(work_dir) / case / flow_name
    output_aig = flow_dir / "{0}_{1}.aig".format(case, flow_name)
    start = time.time()
    run_aig_flow(
        abc=abc,
        input_aig=parent.aig_path,
        output_aig=output_aig,
        commands=ABC9_FLOW_COMMANDS[flow_name],
        timeout=timeout,
    )
    generation_sec = time.time() - start

    candidate = evaluate_aig(
        case=case,
        candidate_id="{0}_{1}".format(case, flow_name),
        parent_id=parent.candidate_id,
        source="abc9",
        tool_chain=flow_name,
        aig_path=output_aig,
        truth=truth,
        abc=abc,
        notes="ABC9 GIA syn2/dc2 flow",
        timeout=timeout,
    )
    candidate.runtime_sec += generation_sec
    return candidate


def abc9_candidate(case, parent, truth, work_dir, abc, timeout=60):
    return abc9_flow_candidate(
        case=case,
        flow_name="abc9_syn2_dc2",
        parent=parent,
        truth=truth,
        work_dir=work_dir,
        abc=abc,
        timeout=timeout,
    )
