"""MockTurtle wrapper skeleton.

MockTurtle is available as a C++ library in this workspace, but the project
does not yet have a stable AIG-in/AIG-out executable contract to call here.
"""

import os
from pathlib import Path


RUNNER_ENV = "MOCKTURTLE_AIG_RUNNER"


def _project_root():
    return Path(__file__).resolve().parents[2]


def discover_runner(root=None):
    if root is None:
        root = _project_root()
    else:
        root = Path(root)

    env_runner = os.environ.get(RUNNER_ENV)
    if env_runner:
        env_runner = Path(env_runner)
        if env_runner.is_file():
            return env_runner

    candidates = [
        root / "student" / "tools" / "mockturtle" / "bin" / "mockturtle_aig_runner",
        root / "student" / "tools" / "mockturtle" / "build" / "mockturtle_aig_runner",
        root / "student" / "tools" / "mockturtle" / "build" / "bin" / "mockturtle_aig_runner",
    ]
    for path in candidates:
        if path.is_file():
            return path
    return None


def mockturtle_candidate(case, parent, truth, work_dir, abc, runner=None, timeout=120):
    if runner is None:
        runner = discover_runner()

    if runner is None:
        raise NotImplementedError(
            "MockTurtle needs a project-specific AIG-in/AIG-out runner before "
            "candidate generation can be enabled. Set {0} or add a runner such "
            "as student/tools/mockturtle/bin/mockturtle_aig_runner.".format(RUNNER_ENV)
        )

    raise NotImplementedError(
        "MockTurtle runner was found at {0}, but this wrapper still needs the "
        "runner command-line contract before it can generate and evaluate "
        "candidates for case {1}.".format(runner, case)
    )
