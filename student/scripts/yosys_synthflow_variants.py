#!/usr/bin/env python3
"""Try small Yosys synthesis-flow variants for verified Verilog seeds."""

import argparse
import csv
import json
import subprocess
import sys
import time
from pathlib import Path


ROOT = Path(__file__).resolve().parents[2]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from student.backends.abc_flow import evaluate_aig
from student.frontends.yosys_synth import SynthError, run_command, yosys_quote
from student.generators.fp16_semantic_search import (
    BEST_FIELDNAMES,
    RESULT_FIELDNAMES,
    add_reference_columns,
    load_reference,
    rel_path,
    write_csv,
    write_text,
)


SEEDS = {
    "ex223": {
        "label": "fp16_log",
        "module": "ex223_fp16_log_casez_sign",
        "variant": "casez_sign",
        "verilog": ROOT
        / "student/work/ex223_ex224_frontend_fp16_bitlogic3_20260606_2344/ex223/verilog/ex223_fp16_log_casez_sign.v",
    },
    "ex224": {
        "label": "fp16_log2",
        "module": "ex224_fp16_log2_casez_sign_bits11_12_t8",
        "variant": "casez_sign_bits11_12_t8",
        "verilog": ROOT
        / "student/work/ex223_ex224_frontend_fp16_bitlogic4_20260606_2354/ex224/verilog/ex224_fp16_log2_casez_sign_bits11_12_t8.v",
    },
}


def script_default(verilog, module, output):
    return "\n".join(
        [
            "read_verilog {0}".format(yosys_quote(verilog)),
            "hierarchy -check -top {0}".format(module),
            "proc",
            "flatten",
            "tribuf -logic",
            "deminout",
            "opt",
            "memory",
            "opt",
            "techmap",
            "opt",
            "abc -g AND",
            "opt",
            "aigmap",
            "opt",
            "clean",
            "write_aiger -symbols {0}".format(yosys_quote(output)),
        ]
    ) + "\n"


def script_no_internal_abc(verilog, module, output):
    return "\n".join(
        [
            "read_verilog {0}".format(yosys_quote(verilog)),
            "hierarchy -check -top {0}".format(module),
            "proc",
            "flatten",
            "tribuf -logic",
            "deminout",
            "opt",
            "memory",
            "opt",
            "techmap",
            "opt",
            "aigmap",
            "opt",
            "clean",
            "write_aiger -symbols {0}".format(yosys_quote(output)),
        ]
    ) + "\n"


def script_abc_gate(verilog, module, output, gate):
    return script_default(verilog, module, output).replace("abc -g AND", "abc -g {0}".format(gate))


def script_abc_d(verilog, module, output, target):
    return script_default(verilog, module, output).replace("abc -g AND", "abc -g AND -D {0}".format(target))


def script_extra_opt(verilog, module, output):
    return "\n".join(
        [
            "read_verilog {0}".format(yosys_quote(verilog)),
            "hierarchy -check -top {0}".format(module),
            "proc",
            "flatten",
            "tribuf -logic",
            "deminout",
            "opt",
            "opt_expr",
            "opt_reduce",
            "opt_muxtree",
            "wreduce",
            "memory",
            "opt",
            "share",
            "opt",
            "techmap",
            "opt",
            "abc -g AND",
            "opt",
            "aigmap",
            "opt",
            "clean",
            "write_aiger -symbols {0}".format(yosys_quote(output)),
        ]
    ) + "\n"


def script_late_flatten(verilog, module, output):
    return "\n".join(
        [
            "read_verilog {0}".format(yosys_quote(verilog)),
            "hierarchy -check -top {0}".format(module),
            "proc",
            "tribuf -logic",
            "deminout",
            "opt",
            "memory",
            "opt",
            "techmap",
            "opt",
            "flatten",
            "opt",
            "abc -g AND",
            "opt",
            "aigmap",
            "opt",
            "clean",
            "write_aiger -symbols {0}".format(yosys_quote(output)),
        ]
    ) + "\n"


def script_synth_preset(verilog, module, output, noabc=False):
    synth = "synth -top {0} -flatten".format(module)
    if noabc:
        synth += " -noabc"
    lines = [
        "read_verilog {0}".format(yosys_quote(verilog)),
        synth,
    ]
    if noabc:
        lines.extend(["aigmap", "opt", "clean"])
    else:
        lines.extend(["abc -g AND", "aigmap", "opt", "clean"])
    lines.append("write_aiger -symbols {0}".format(yosys_quote(output)))
    return "\n".join(lines) + "\n"


VARIANTS = [
    ("default_recheck", lambda v, m, o: script_default(v, m, o), "current project Yosys script sanity recheck"),
    ("no_internal_abc", lambda v, m, o: script_no_internal_abc(v, m, o), "skip Yosys internal abc pass"),
    ("abc_fast", lambda v, m, o: script_default(v, m, o).replace("abc -g AND", "abc -fast -g AND"), "Yosys abc fast script"),
    ("abc_d20", lambda v, m, o: script_abc_d(v, m, o, 20), "Yosys abc delay target 20"),
    ("abc_d21", lambda v, m, o: script_abc_d(v, m, o, 21), "Yosys abc delay target 21"),
    ("abc_d22", lambda v, m, o: script_abc_d(v, m, o, 22), "Yosys abc delay target 22"),
    ("abc_d24", lambda v, m, o: script_abc_d(v, m, o, 24), "Yosys abc delay target 24"),
    ("abc_g_aig", lambda v, m, o: script_abc_gate(v, m, o, "aig"), "Yosys abc gate set aig"),
    ("abc_g_simple", lambda v, m, o: script_abc_gate(v, m, o, "simple"), "Yosys abc gate set simple"),
    ("abc_g_and_mux", lambda v, m, o: script_abc_gate(v, m, o, "AND,MUX"), "Yosys abc gate set AND,MUX"),
    ("extra_opt_share", lambda v, m, o: script_extra_opt(v, m, o), "extra opt_reduce/opt_muxtree/wreduce/share before techmap"),
    ("late_flatten", lambda v, m, o: script_late_flatten(v, m, o), "move flatten after techmap"),
    ("synth_preset", lambda v, m, o: script_synth_preset(v, m, o, noabc=False), "Yosys synth preset with flatten"),
    ("synth_preset_noabc", lambda v, m, o: script_synth_preset(v, m, o, noabc=True), "Yosys synth preset without abc"),
    ("abc_g_aig_d14", lambda v, m, o: script_default(v, m, o).replace("abc -g AND", "abc -g aig -D 14"), "Yosys abc gate set aig delay target 14"),
    ("abc_g_aig_d15", lambda v, m, o: script_default(v, m, o).replace("abc -g AND", "abc -g aig -D 15"), "Yosys abc gate set aig delay target 15"),
    ("abc_g_aig_d16", lambda v, m, o: script_default(v, m, o).replace("abc -g AND", "abc -g aig -D 16"), "Yosys abc gate set aig delay target 16"),
    ("abc_g_aig_d17", lambda v, m, o: script_default(v, m, o).replace("abc -g AND", "abc -g aig -D 17"), "Yosys abc gate set aig delay target 17"),
    ("abc_g_aig_d18", lambda v, m, o: script_default(v, m, o).replace("abc -g AND", "abc -g aig -D 18"), "Yosys abc gate set aig delay target 18"),
    ("abc_g_aig_d19", lambda v, m, o: script_default(v, m, o).replace("abc -g AND", "abc -g aig -D 19"), "Yosys abc gate set aig delay target 19"),
    ("abc_g_aig_d20", lambda v, m, o: script_default(v, m, o).replace("abc -g AND", "abc -g aig -D 20"), "Yosys abc gate set aig delay target 20"),
    ("abc_g_aig_d21", lambda v, m, o: script_default(v, m, o).replace("abc -g AND", "abc -g aig -D 21"), "Yosys abc gate set aig delay target 21"),
    ("abc_g_gates", lambda v, m, o: script_abc_gate(v, m, o, "gates"), "Yosys abc gate set gates"),
    ("abc_g_cmos2", lambda v, m, o: script_abc_gate(v, m, o, "cmos2"), "Yosys abc gate set cmos2"),
]


def empty_row(case, candidate_id, seed, variant, verilog_path, aig_path):
    return {
        "case": case,
        "candidate_id": candidate_id,
        "hypothesis/function_guess": seed["label"],
        "variant": variant,
        "verilog_path": rel_path(verilog_path),
        "aig_path": rel_path(aig_path),
        "verified_truth": "1",
        "synthesized": "0",
        "equivalent": "0",
        "area": "",
        "delay": "",
        "adp": "",
        "reference_adp": "",
        "adp_ratio_to_reference": "",
        "within_1p5_reference": "",
        "beats_reference": "",
        "runtime_sec": "0.000",
        "items": "",
        "classification": "synthflow_exact",
        "notes": "",
    }


def synthesize_with_script(script, yosys, timeout, log_path):
    log_path.parent.mkdir(parents=True, exist_ok=True)
    script_path = log_path.with_suffix(".ys")
    write_text(script_path, script)
    code, log = run_command([str(yosys), "-s", str(script_path)], timeout=timeout)
    write_text(log_path, log)
    if code != 0:
        raise SynthError("Yosys failed with exit code {0}".format(code))


def run_case(args, refs, case, seed):
    rows = []
    truth_path = args.benchmarks / "{0}.truth".format(case)
    case_dir = args.work_dir / case
    variants = VARIANTS
    if args.variant_names:
        variants = [item for item in VARIANTS if item[0] in args.variant_names]
    for variant, renderer, note in variants:
        candidate_id = "{0}_{1}_{2}_{3}".format(case, seed["label"], seed["variant"], variant)
        aig_path = case_dir / "aigs" / "{0}.aig".format(candidate_id)
        log_path = case_dir / "logs" / "{0}.yosys.log".format(candidate_id)
        row = empty_row(case, candidate_id, seed, variant, seed["verilog"], aig_path)
        row["items"] = note
        start = time.time()
        try:
            aig_path.parent.mkdir(parents=True, exist_ok=True)
            script = renderer(seed["verilog"], seed["module"], aig_path)
            synthesize_with_script(script, args.yosys, args.timeout, log_path)
            row["synthesized"] = "1"
            evaluated = evaluate_aig(
                case=case,
                candidate_id=candidate_id,
                parent_id=seed["variant"],
                source="yosys_synthflow",
                tool_chain="yosys_synthflow_{0}".format(variant),
                aig_path=aig_path,
                truth=truth_path,
                abc=args.abc,
                notes=note,
                timeout=args.timeout,
            )
            row["equivalent"] = "1" if evaluated.equivalent else "0"
            row["area"] = "" if evaluated.area is None else str(evaluated.area)
            row["delay"] = "" if evaluated.delay is None else str(evaluated.delay)
            row["adp"] = "" if evaluated.adp is None else str(evaluated.adp)
            row["notes"] = evaluated.notes
        except (RuntimeError, SynthError, OSError, subprocess.TimeoutExpired) as exc:
            row["notes"] = "{0}: {1}".format(type(exc).__name__, exc)[:1000]
        row["runtime_sec"] = "{0:.3f}".format(time.time() - start)
        add_reference_columns(row, refs)
        rows.append(row)
        print("{0} {1} eq={2} area={3} delay={4} adp={5}".format(case, variant, row["equivalent"], row["area"], row["delay"], row["adp"]))
        sys.stdout.flush()
    return rows


def best_rows(rows):
    out = []
    for case in sorted({row["case"] for row in rows}):
        valid = [row for row in rows if row["case"] == case and row["equivalent"] == "1" and row["adp"]]
        if valid:
            best = min(valid, key=lambda row: int(row["adp"]))
            out.append({name: best.get(name, "") for name in BEST_FIELDNAMES})
    return out


def parse_args(argv=None):
    parser = argparse.ArgumentParser(description="Try Yosys synthesis-flow variants for existing FP16 seeds.")
    parser.add_argument("--work-dir", type=Path, required=True)
    parser.add_argument("--results", type=Path, required=True)
    parser.add_argument("--best-results", type=Path, required=True)
    parser.add_argument("--benchmarks", type=Path, default=ROOT / "benchmarks")
    parser.add_argument("--reference", type=Path, default=ROOT / "reference_result.csv")
    parser.add_argument("--yosys", type=Path, default=ROOT / "student/tools/conda-env/bin/yosys")
    parser.add_argument("--abc", type=Path, default=ROOT / "student/abc")
    parser.add_argument("--timeout", type=int, default=900)
    parser.add_argument("--cases", default="ex223,ex224")
    parser.add_argument("--variants", default="", help="Comma-separated synthesis-flow variant names.")
    parser.add_argument("--seed-json", type=Path, help="Optional case-to-seed JSON overriding built-in seeds.")
    return parser.parse_args(argv)


def main(argv=None):
    args = parse_args(argv)
    args.variant_names = {item.strip() for item in args.variants.split(",") if item.strip()}
    refs = load_reference(args.reference)
    seeds = SEEDS
    if args.seed_json:
        seeds = json.loads(args.seed_json.read_text())
        for seed in seeds.values():
            seed["verilog"] = Path(seed["verilog"])
    rows = []
    for case in [item.strip() for item in args.cases.split(",") if item.strip()]:
        rows.extend(run_case(args, refs, case, seeds[case]))
    write_csv(args.results, RESULT_FIELDNAMES, rows)
    write_csv(args.best_results, BEST_FIELDNAMES, best_rows(rows))
    manifest = {
        "cases": [row["case"] for row in rows],
        "variants": [name for name, _, _ in VARIANTS],
        "rows": rows,
    }
    write_text(args.work_dir / "manifest.json", json.dumps(manifest, indent=2) + "\n")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
