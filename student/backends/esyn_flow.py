"""E-Syn wrapper skeleton for future seed generation."""

from collections import OrderedDict
from pathlib import Path


def _project_root():
    return Path(__file__).resolve().parents[2]


def _existing(path):
    if path.is_file() or path.is_dir():
        return path
    return None


def discover_paths(root=None):
    if root is None:
        root = _project_root()
    else:
        root = Path(root)

    esyn_root = root / "student" / "tools" / "esyn" / "src"
    return OrderedDict(
        [
            ("esyn_root", _existing(esyn_root)),
            ("e_rewriter", _existing(esyn_root / "e-rewriter" / "target" / "release" / "e-rewriter")),
            ("s_converter", _existing(esyn_root / "s-converter" / "target" / "release" / "s-converter")),
            (
                "circuitparser",
                _existing(
                    esyn_root
                    / "alpha_utils"
                    / "circuitparser"
                    / "target"
                    / "release"
                    / "circuitparser"
                ),
            ),
            (
                "infix2lisp",
                _existing(
                    esyn_root
                    / "alpha_utils"
                    / "infix2lisp"
                    / "target"
                    / "release"
                    / "s-converter"
                ),
            ),
            (
                "lisp2infix",
                _existing(
                    esyn_root
                    / "alpha_utils"
                    / "lisp2infix"
                    / "target"
                    / "release"
                    / "s-converter"
                ),
            ),
        ]
    )


def esyn_seed_candidate(case, parent, truth, work_dir, abc, timeout=300, root=None):
    paths = discover_paths(root=root)
    missing = [name for name, path in paths.items() if path is None]
    if missing:
        raise NotImplementedError(
            "E-Syn seed generation needs the staged E-Syn toolchain. Missing: {0}.".format(
                ", ".join(missing)
            )
        )

    raise NotImplementedError(
        "E-Syn tools are staged, but the full AIG -> EQN/expression -> E-Syn "
        "rewrite -> AIG flow is not implemented yet for case {0}. The next "
        "step is to define that conversion contract and then evaluate the "
        "generated AIG with ABC.".format(case)
    )
