#!/usr/bin/env python3
"""Targeted ex246/ex247 frontend probes.

This run intentionally avoids broad replay.  It tests small source-level
decompositions around the best E5M2FN multiply/divide descriptions and records
only official evaluate.py results.
"""

import csv
import json
import re
import shutil
import subprocess
import sys
import time
from pathlib import Path


HERE = Path(__file__).resolve()
ROOT = None
for parent in HERE.parents:
    if (parent / "evaluate.py").is_file():
        ROOT = parent
        break
if ROOT is None:
    raise RuntimeError("could not find project root")
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from student.frontends.yosys_synth import SynthError, run_command  # noqa: E402
from student.generators.fp8_ex240_ex244_frontend import script_default  # noqa: E402
from student.generators.fp8_ex246_ex247_deep_struct import (  # noqa: E402
    FP8,
    REACHABLE_PRODUCTS,
    common_sig_eff,
    div_class,
    low_from_smallpat_function,
    product_class_lines_for_mul,
    product_dc_seed_map,
    small_pattern,
)


RUN_ID = "ex246_ex247_frontend_targeted_probe_20260613_0351"
AGENT_ID = "local-targeted"
DOMAIN = "float_fp8"
CAMPAIGN = ROOT / "student/frontend_campaigns/campaigns" / RUN_ID
SHARD = CAMPAIGN / "agent_shards" / AGENT_ID
RESULTS = CAMPAIGN / "results"
SUMMARY = CAMPAIGN / "agent_summaries" / (AGENT_ID + ".md")
WORK_ROOT = ROOT / "student/work" / RUN_ID / AGENT_ID
RUN_ROOT = ROOT / "student/runs" / DOMAIN / RUN_ID / AGENT_ID
YOSYS = ROOT / "student/tools/conda-env/bin/yosys"

CURRENT_FRONTEND = {"ex246": 7502, "ex247": 8349}
REFERENCE = {"ex246": 2805, "ex247": 2975}

SYNTHS = [
    ("default_and", lambda v, m, o: script_default(v, m, o, "AND", False)),
    ("default_aig", lambda v, m, o: script_default(v, m, o, "aig", False)),
    ("synth_preset_and", lambda v, m, o: script_default(v, m, o, "AND", True)),
    ("synth_preset_aig", lambda v, m, o: script_default(v, m, o, "aig", True)),
]

CANDIDATE_FIELDS = [
    "case",
    "domain",
    "agent_id",
    "candidate_id",
    "hypothesis",
    "variant",
    "method_signature",
    "representation",
    "shared_structure",
    "synth_flow",
    "semantics",
    "output_grouping",
    "verilog_path",
    "aig_path",
    "evaluate_log",
    "verified_truth",
    "equivalent",
    "area",
    "delay",
    "adp",
    "current_frontend_adp",
    "reference_adp",
    "beats_current_frontend",
    "beats_reference",
    "notes",
]

EVAL_FIELDS = [
    "case",
    "domain",
    "agent_id",
    "candidate_id",
    "method_signature",
    "evaluate_status",
    "equivalent",
    "area",
    "delay",
    "adp",
    "verilog_path",
    "aig_path",
    "evaluate_log",
    "notes",
]

FAILED_FIELDS = [
    "case",
    "domain",
    "agent_id",
    "hypothesis",
    "method_signature",
    "status",
    "evidence_path",
    "notes",
]

STRUCT_FIELDS = [
    "case",
    "agent_id",
    "hypothesis",
    "representation",
    "shared_structure",
    "expected_sharing",
    "observed_result",
    "notes",
]

SIM_FIELDS = [
    "case",
    "domain",
    "agent_id",
    "candidate_id",
    "simulation_status",
    "sim_log",
    "notes",
]

BEST_FIELDS = [
    "case",
    "domain",
    "agent_id",
    "candidate_id",
    "old_frontend_adp",
    "new_frontend_adp",
    "area",
    "delay",
    "reference_adp",
    "method_signature",
    "verilog_path",
    "aig_path",
    "evaluate_log",
    "notes",
]


def rel(path):
    return str(Path(path).resolve().relative_to(ROOT))


def write_text(path, text):
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(text)


def write_csv(path, fields, rows):
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=fields)
        writer.writeheader()
        for row in rows:
            writer.writerow({field: row.get(field, "") for field in fields})


def parse_eval(case, text):
    pattern = r"^{0}\s+(\S+)\s+(\S+)\s+(\S+)\s+(\S+)\s*$".format(case)
    match = re.search(pattern, text, re.MULTILINE)
    if not match:
        return "ERROR", "", "", ""
    status, area, delay, adp = match.groups()
    if status != "OK":
        return status, "", "", ""
    return status, area, delay, adp


def run_yosys(script, log_path, timeout=900):
    script_path = log_path.with_suffix(".ys")
    write_text(script_path, script)
    code, log = run_command([str(YOSYS), "-s", str(script_path)], timeout=timeout)
    write_text(log_path, log)
    if code != 0:
        raise SynthError("Yosys failed with exit code {0}".format(code))


def attr_literal(sig_n, sig_d, include_valid):
    zero_hi, sat_lo, offset, mant = div_class(sig_n, sig_d)
    vals = [FP8.div_mag_from_sig_delta(sig_n, sig_d, zero_hi + step) for step in range(1, 4)]
    pat = small_pattern(vals)
    if include_valid:
        return "{1'b1, 7'h%02x, 7'h%02x, 5'd%d, 2'd%d, 2'd%d}" % (
            zero_hi & 0x7F,
            sat_lo & 0x7F,
            offset,
            mant,
            pat,
        )
    return "{7'h%02x, 7'h%02x, 5'd%d, 2'd%d, 2'd%d}" % (
        zero_hi & 0x7F,
        sat_lo & 0x7F,
        offset,
        mant,
        pat,
    )


def render_div_attr_function(width, include_valid, flat):
    if flat:
        rows = []
        for sig_d in range(1, 8):
            for sig_n in range(1, 8):
                rows.append(
                    "        6'b{0:03b}_{1:03b}: bound_attr = {2};".format(
                        sig_d, sig_n, attr_literal(sig_n, sig_d, include_valid)
                    )
                )
        return """  function [{msb}:0] bound_attr;
    input [2:0] sig_n;
    input [2:0] sig_d;
    begin
      case ({{sig_d, sig_n}})
{rows}
        default: bound_attr = {width}'d0;
      endcase
    end
  endfunction
""".format(msb=width - 1, rows="\n".join(rows), width=width)

    den_blocks = []
    for sig_d in range(1, 8):
        num_rows = []
        for sig_n in range(1, 8):
            num_rows.append(
                "          3'd{0}: bound_attr = {1};".format(
                    sig_n, attr_literal(sig_n, sig_d, include_valid)
                )
            )
        den_blocks.append(
            """        3'd{den}: begin
          case (sig_n)
{rows}
            default: bound_attr = {width}'d0;
          endcase
        end""".format(den=sig_d, rows="\n".join(num_rows), width=width)
        )
    return """  function [{msb}:0] bound_attr;
    input [2:0] sig_n;
    input [2:0] sig_d;
    begin
      case (sig_d)
{blocks}
        default: bound_attr = {width}'d0;
      endcase
    end
  endfunction
""".format(msb=width - 1, blocks="\n".join(den_blocks), width=width)


def render_ex247_novalid(module, flat=False, direct=False):
    attr_func = render_div_attr_function(23, False, flat)
    if direct:
        mag_logic = """  wire [6:0] mag = den_zero ? 7'h7e : (zero_region ? 7'h00 : (sat_region ? 7'h7e : (low_region ? low_mag : linear_mag)));
"""
    else:
        mag_logic = """  reg [6:0] mag;
  always @* begin
    casez ({den_zero, zero_region, sat_region, low_region})
      4'b1???: mag = 7'h7e;
      4'b01??: mag = 7'h00;
      4'b001?: mag = 7'h7e;
      4'b0001: mag = low_mag;
      default: mag = linear_mag;
    endcase
  end
"""
    return """module {module}(in, out);
  input [15:0] in;
  output [7:0] out;
  wire [7:0] den = in[15:8];
  wire [7:0] num = in[7:0];
  wire [6:0] dm = den[6:0];
  wire [6:0] nm = num[6:0];
  wire nan = (dm == 7'h7f) || (nm == 7'h7f);
  wire den_zero = (dm == 7'h00);
  wire num_zero = (nm == 7'h00);
  wire sign = den[7] ^ num[7];
{common}
{low_pat}
{attr_func}
  wire [2:0] sig_n = sig3(nm);
  wire [2:0] sig_d = sig3(dm);
  wire signed [6:0] delta = $signed({{1'b0, eff_exp(nm)}}) - $signed({{1'b0, eff_exp(dm)}});
  wire [22:0] attr = bound_attr(sig_n, sig_d);
  wire signed [6:0] zero_hi = attr[22:16];
  wire signed [6:0] sat_lo = attr[15:9];
  wire [4:0] offset = attr[8:4];
  wire [1:0] mant = attr[3:2];
  wire [1:0] pat = attr[1:0];
  wire active = !num_zero && !den_zero;
  wire signed [6:0] step = delta - zero_hi;
  wire signed [6:0] out_exp_s = delta + $signed({{2'b0, offset}});
  wire zero_region = !active || (delta <= zero_hi);
  wire sat_region = active && (delta >= sat_lo);
  wire low_region = active && !zero_region && !sat_region && (step <= 7'sd3);
  wire [6:0] low_mag = low_from_pat(pat, step[1:0]);
  wire [6:0] linear_mag = {{out_exp_s[4:0], mant}};
{mag_logic}  wire invalid = nan || (den_zero && num_zero);
  assign out = invalid ? 8'h7f : {{sign, mag}};
endmodule
""".format(
        module=module,
        common=common_sig_eff(),
        low_pat=low_from_smallpat_function(),
        attr_func=attr_func,
        mag_logic=mag_logic,
    )


def product_dc_mapping():
    mapping = product_dc_seed_map(12)
    mapping[11] = 10
    return mapping


def effective_product_expr_rows():
    mapping = product_dc_mapping()
    rows = []
    for product in range(1, 50):
        if product in REACHABLE_PRODUCTS:
            effective = product
        else:
            effective = mapping.get(product, 0) or 0
        rows.append("        6'd{0}: effective_product = 6'd{1};".format(product, effective))
    return "\n".join(rows)


def product_mag_reachable_rows():
    rows = []
    for product in sorted(REACHABLE_PRODUCTS):
        lines = ["        6'd{0}: begin".format(product)]
        lines.extend(product_class_lines_for_mul(product, "          "))
        lines.append("        end")
        rows.append("\n".join(lines))
    return "\n".join(rows)


def product_mag_seed12_rows(attr=False):
    mapping = product_dc_mapping()
    rows = []
    for product in range(1, 50):
        if product in REACHABLE_PRODUCTS:
            effective = product
        else:
            effective = mapping.get(product, 0) or 0
        lines = []
        if attr:
            lines.append("        (* parallel_case *)")
        lines.append("        6'd{0}: begin".format(product))
        if effective:
            lines.extend(product_class_lines_for_mul(effective, "          "))
        else:
            lines.append("          product_mag = 7'h00;")
        lines.append("        end")
        rows.append("\n".join(lines))
    return "\n".join(rows)


def render_ex246_eff_product(module, parallel=False):
    case_attr = "(* parallel_case *) " if parallel else ""
    return """module {module}(in, out);
  input [15:0] in;
  output [7:0] out;
  wire [7:0] a = in[15:8];
  wire [7:0] b = in[7:0];
  wire [6:0] am = a[6:0];
  wire [6:0] bm = b[6:0];
  wire nan = (am == 7'h7f) || (bm == 7'h7f);
  wire sign = a[7] ^ b[7];
{common}
  function [5:0] effective_product;
    input [5:0] product;
    begin
      {case_attr}case (product)
{eff_rows}
        default: effective_product = 6'd0;
      endcase
    end
  endfunction

  function [6:0] product_mag;
    input [5:0] exp_sum;
    input [5:0] product;
    begin
      {case_attr}case (product)
{mag_rows}
        default: product_mag = 7'h00;
      endcase
    end
  endfunction

  wire [5:0] raw_product = sig3(am) * sig3(bm);
  wire [5:0] product = effective_product(raw_product);
  wire [5:0] exp_sum = eff_exp(am) + eff_exp(bm);
  assign out = nan ? 8'h7f : {{sign, product_mag(exp_sum, product)}};
endmodule
""".format(
        module=module,
        common=common_sig_eff(),
        case_attr=case_attr,
        eff_rows=effective_product_expr_rows(),
        mag_rows=product_mag_reachable_rows(),
    )


def render_ex246_parallel_case(module):
    return """module {module}(in, out);
  input [15:0] in;
  output [7:0] out;
  wire [7:0] a = in[15:8];
  wire [7:0] b = in[7:0];
  wire [6:0] am = a[6:0];
  wire [6:0] bm = b[6:0];
  wire nan = (am == 7'h7f) || (bm == 7'h7f);
  wire sign = a[7] ^ b[7];
{common}
  function [6:0] product_mag;
    input [5:0] exp_sum;
    input [5:0] product;
    begin
      (* parallel_case *) case (product)
{rows}
        default: product_mag = 7'h00;
      endcase
    end
  endfunction

  wire [5:0] product = sig3(am) * sig3(bm);
  wire [5:0] exp_sum = eff_exp(am) + eff_exp(bm);
  assign out = nan ? 8'h7f : {{sign, product_mag(exp_sum, product)}};
endmodule
""".format(module=module, common=common_sig_eff(), rows=product_mag_seed12_rows(attr=False))


def candidate_defs():
    return [
        {
            "case": "ex247",
            "base_id": "ex247_r24_bound_novalid_nested",
            "hypothesis": "E5M2FN division low-over-high with boundary attr valid bit removed",
            "variant": "bound_novalid_nested",
            "method_signature": "ex247|E5M2FN packed low-over-high division|validless nested boundary-region mux|shared sign exponent significand decode and denominator-nested validless boundary attrs|multi_yosys_official_evaluate|exact_e5m2fn_div_low_over_high|region_grouped_magnitude_validless",
            "representation": "denominator-nested attr table without valid bit feeding zero/sat/low/linear mux",
            "shared_structure": "shared special-case decode, effective exponent/significand decode, delta, boundary attrs, low-pattern decoder",
            "semantics": "exact_e5m2fn_div_low_over_high",
            "output_grouping": "region-grouped magnitude output",
            "renderer": lambda module: render_ex247_novalid(module, flat=False, direct=False),
        },
        {
            "case": "ex247",
            "base_id": "ex247_r24_bound_novalid_flat",
            "hypothesis": "E5M2FN division low-over-high with flat pair boundary attrs",
            "variant": "bound_novalid_flat",
            "method_signature": "ex247|E5M2FN packed low-over-high division|validless flat pair boundary attrs|shared sign exponent significand decode and flat sigpair boundary attrs|multi_yosys_official_evaluate|exact_e5m2fn_div_low_over_high|flat_pair_region_magnitude",
            "representation": "flat {sig_d,sig_n} attr table without valid bit feeding region mux",
            "shared_structure": "shared special-case decode, effective exponent/significand decode, delta, flat pair attrs, low-pattern decoder",
            "semantics": "exact_e5m2fn_div_low_over_high",
            "output_grouping": "flat-pair region-grouped magnitude output",
            "renderer": lambda module: render_ex247_novalid(module, flat=True, direct=False),
        },
        {
            "case": "ex247",
            "base_id": "ex247_r24_bound_novalid_direct",
            "hypothesis": "E5M2FN division low-over-high with direct region assignment",
            "variant": "bound_novalid_direct",
            "method_signature": "ex247|E5M2FN packed low-over-high division|validless direct assignment region mux|shared sign exponent significand decode boundary attrs and direct priority expression|multi_yosys_official_evaluate|exact_e5m2fn_div_low_over_high|direct_region_magnitude",
            "representation": "validless nested attr table with direct ternary priority magnitude assignment",
            "shared_structure": "shared special-case decode, effective exponent/significand decode, delta, boundary attrs, low-pattern decoder",
            "semantics": "exact_e5m2fn_div_low_over_high",
            "output_grouping": "direct-priority region magnitude output",
            "renderer": lambda module: render_ex247_novalid(module, flat=False, direct=True),
        },
        {
            "case": "ex246",
            "base_id": "ex246_r24_product_effmap_seed12",
            "hypothesis": "E5M2FN multiply with unreachable product effective-map",
            "variant": "product_effmap_seed12",
            "method_signature": "ex246|E5M2FN packed multiply|seed12 unreachable product effective-map before reachable product-class decode|shared sign exponent significand product effective-map and product-class magnitude|multi_yosys_official_evaluate|exact_e5m2fn_mul_high_times_low|effective_product_class_magnitude",
            "representation": "raw product mapped through seed12 don't-care effective-product function then decoded by reachable product classes",
            "shared_structure": "shared NaN/sign decode, effective exponent/significand decode, raw product, effective product map, reachable product-class magnitude",
            "semantics": "exact_e5m2fn_mul_high_times_low",
            "output_grouping": "effective-product class magnitude output",
            "renderer": lambda module: render_ex246_eff_product(module, parallel=False),
        },
        {
            "case": "ex246",
            "base_id": "ex246_r24_product_effmap_parallel",
            "hypothesis": "E5M2FN multiply with parallel-case effective product map",
            "variant": "product_effmap_parallel",
            "method_signature": "ex246|E5M2FN packed multiply|parallel-case effective product map before reachable product-class decode|shared sign exponent significand product effective-map and product-class magnitude|multi_yosys_official_evaluate|exact_e5m2fn_mul_high_times_low|parallel_effective_product_class_magnitude",
            "representation": "parallel-case raw product map plus reachable product-class magnitude decode",
            "shared_structure": "shared NaN/sign decode, effective exponent/significand decode, raw product, parallel effective product map, reachable product-class magnitude",
            "semantics": "exact_e5m2fn_mul_high_times_low",
            "output_grouping": "parallel effective-product class magnitude output",
            "renderer": lambda module: render_ex246_eff_product(module, parallel=True),
        },
        {
            "case": "ex246",
            "base_id": "ex246_r24_product_parallel_seed12",
            "hypothesis": "E5M2FN multiply with parallel-case seed12 product-class table",
            "variant": "product_parallel_seed12",
            "method_signature": "ex246|E5M2FN packed multiply|parallel-case seed12 product-class magnitude table|shared sign exponent significand product and parallel product-class magnitude decode|multi_yosys_official_evaluate|exact_e5m2fn_mul_high_times_low|parallel_product_class_magnitude",
            "representation": "seed12 product-class table with Yosys-visible parallel-case product selection",
            "shared_structure": "shared NaN/sign decode, effective exponent/significand decode, product, parallel product-class magnitude",
            "semantics": "exact_e5m2fn_mul_high_times_low",
            "output_grouping": "parallel product-class magnitude output",
            "renderer": render_ex246_parallel_case,
        },
    ]


def run_candidate(defn, synth_name, synth_renderer):
    case = defn["case"]
    module = "{0}_{1}".format(defn["base_id"], synth_name)
    candidate_id = module
    case_work = WORK_ROOT / case
    verilog_path = case_work / "verilog" / (candidate_id + ".v")
    aig_path = case_work / "aigs" / (candidate_id + ".aig")
    yosys_log = case_work / "logs" / (candidate_id + ".yosys.log")
    eval_dir = case_work / "eval_outputs" / candidate_id
    eval_aig = eval_dir / (case + ".aig")
    eval_log = case_work / "logs" / (candidate_id + ".evaluate.py.log")
    notes_dir = case_work / "notes"
    notes_path = notes_dir / (candidate_id + ".md")
    case_run = RUN_ROOT / case / "results"

    aig_path.parent.mkdir(parents=True, exist_ok=True)
    write_text(verilog_path, defn["renderer"](module))
    start = time.time()
    status = "ERROR"
    area = delay = adp = ""
    equivalent = "0"
    note = ""
    try:
        run_yosys(synth_renderer(verilog_path, module, aig_path), yosys_log)
        eval_dir.mkdir(parents=True, exist_ok=True)
        shutil.copyfile(str(aig_path), str(eval_aig))
        result = subprocess.run(
            [
                sys.executable,
                str(ROOT / "evaluate.py"),
                "--case",
                case,
                "--output",
                str(eval_dir),
                "--timeout",
                "180",
            ],
            cwd=str(ROOT),
            stdout=subprocess.PIPE,
            stderr=subprocess.STDOUT,
            universal_newlines=True,
            timeout=240,
        )
        write_text(eval_log, result.stdout)
        status, area, delay, adp = parse_eval(case, result.stdout)
        equivalent = "1" if status == "OK" else "0"
        note = "official evaluate.py status {0}; synth={1}".format(status, synth_name)
    except Exception as exc:
        write_text(eval_log, str(exc) + "\n")
        note = str(exc).splitlines()[0][:240]
    runtime = time.time() - start

    write_text(
        notes_path,
        "# {0}\n\nmethod_signature: `{1}`\n\nsynth: `{2}`\n\nstatus: `{3}`\n\nruntime_sec: `{4:.3f}`\n\nverilog: `{5}`\n\naig: `{6}`\n\nevaluate_log: `{7}`\n".format(
            candidate_id,
            defn["method_signature"],
            synth_name,
            status,
            runtime,
            rel(verilog_path),
            rel(aig_path) if aig_path.is_file() else "",
            rel(eval_log),
        ),
    )

    candidate_row = {
        "case": case,
        "domain": DOMAIN,
        "agent_id": AGENT_ID,
        "candidate_id": candidate_id,
        "hypothesis": defn["hypothesis"],
        "variant": defn["variant"] + "_" + synth_name,
        "method_signature": defn["method_signature"] + "|" + synth_name,
        "representation": defn["representation"],
        "shared_structure": defn["shared_structure"],
        "synth_flow": "yosys_script_default_variant_{0}_official_evaluate.py".format(synth_name),
        "semantics": defn["semantics"],
        "output_grouping": defn["output_grouping"],
        "verilog_path": rel(verilog_path),
        "aig_path": rel(aig_path) if aig_path.is_file() else "",
        "evaluate_log": rel(eval_log),
        "verified_truth": equivalent,
        "equivalent": equivalent,
        "area": area,
        "delay": delay,
        "adp": adp,
        "current_frontend_adp": str(CURRENT_FRONTEND[case]),
        "reference_adp": str(REFERENCE[case]),
        "beats_current_frontend": "1" if adp and int(adp) < CURRENT_FRONTEND[case] else "0",
        "beats_reference": "1" if adp and int(adp) < REFERENCE[case] else "0",
        "notes": note,
    }
    eval_row = {
        "case": case,
        "domain": DOMAIN,
        "agent_id": AGENT_ID,
        "candidate_id": candidate_id,
        "method_signature": candidate_row["method_signature"],
        "evaluate_status": status,
        "equivalent": equivalent,
        "area": area,
        "delay": delay,
        "adp": adp,
        "verilog_path": rel(verilog_path),
        "aig_path": rel(aig_path) if aig_path.is_file() else "",
        "evaluate_log": rel(eval_log),
        "notes": note,
    }
    failed_row = None
    if equivalent != "1" or not adp or int(adp) >= CURRENT_FRONTEND[case]:
        failed_row = {
            "case": case,
            "domain": DOMAIN,
            "agent_id": AGENT_ID,
            "hypothesis": defn["hypothesis"],
            "method_signature": candidate_row["method_signature"],
            "status": "EQUIVALENT_BUT_NO_FRONTEND_IMPROVEMENT" if equivalent == "1" else status,
            "evidence_path": rel(notes_path),
            "notes": note,
        }
    best_row = None
    if adp and int(adp) < CURRENT_FRONTEND[case]:
        best_row = {
            "case": case,
            "domain": DOMAIN,
            "agent_id": AGENT_ID,
            "candidate_id": candidate_id,
            "old_frontend_adp": str(CURRENT_FRONTEND[case]),
            "new_frontend_adp": adp,
            "area": area,
            "delay": delay,
            "reference_adp": str(REFERENCE[case]),
            "method_signature": candidate_row["method_signature"],
            "verilog_path": rel(verilog_path),
            "aig_path": rel(aig_path),
            "evaluate_log": rel(eval_log),
            "notes": note,
        }

    write_csv(case_run / (candidate_id + ".csv"), CANDIDATE_FIELDS, [candidate_row])
    print(
        "{0} {1} status={2} area={3} delay={4} adp={5}".format(
            case, candidate_id, status, area or "-", delay or "-", adp or "-"
        )
    )
    sys.stdout.flush()
    return candidate_row, eval_row, failed_row, best_row


def write_manifest(candidate_rows, failed_rows, best_rows):
    CAMPAIGN.mkdir(parents=True, exist_ok=True)
    write_text(
        CAMPAIGN / "MANIFEST.md",
        "# {0}\n\nRun ID: `{0}`\n\nPurpose: targeted frontend source probes for high-gap `ex246` and `ex247`.\n\nInputs:\n- Case indexes: `student/frontend_campaigns/case_index/ex246.md`, `student/frontend_campaigns/case_index/ex247.md`\n- Current best RTL sources from prior frontend runs.\n- Official checker: `evaluate.py`\n\nArtifacts:\n- Work directory: `{1}`\n- Run directory: `{2}`\n- Results: `{3}`\n\nMethods tried:\n- `ex247`: validless nested/flat/direct boundary-region muxes.\n- `ex246`: seed12 product effective-map and parallel-case product-class variants.\n\nNo `student/seeds` curation is performed.\n".format(
            RUN_ID, rel(WORK_ROOT), rel(RUN_ROOT), rel(RESULTS)
        ),
    )
    write_text(
        CAMPAIGN / "task_assignments.md",
        "# Task Assignments\n\n| agent_id | cases | status | notes |\n|---|---|---|---|\n| `{0}` | `ex246`, `ex247` | completed | local targeted source probes with official evaluate.py |\n".format(
            AGENT_ID
        ),
    )
    summary_lines = [
        "# {0}".format(AGENT_ID),
        "",
        "Run ID: `{0}`".format(RUN_ID),
        "",
        "Official equivalent candidates: `{0}`.".format(sum(1 for row in candidate_rows if row["equivalent"] == "1")),
        "Frontend improvements: `{0}`.".format(len(best_rows)),
        "Failed/no-improvement rows: `{0}`.".format(len(failed_rows)),
        "",
        "Best observed by case:",
    ]
    for case in ["ex246", "ex247"]:
        eq_rows = [row for row in candidate_rows if row["case"] == case and row["equivalent"] == "1" and row["adp"]]
        if eq_rows:
            best = min(eq_rows, key=lambda row: int(row["adp"]))
            summary_lines.append(
                "- `{0}`: `{1}` `{2}/{3}/{4}` vs frontend `{5}` and reference `{6}`.".format(
                    case,
                    best["candidate_id"],
                    best["area"],
                    best["delay"],
                    best["adp"],
                    CURRENT_FRONTEND[case],
                    REFERENCE[case],
                )
            )
        else:
            summary_lines.append("- `{0}`: no equivalent candidate.".format(case))
    summary_lines.append("")
    summary_lines.append("Global registry/search_state were not updated unless a row appears in `best_improvements.csv` and is applied by the coordinator.")
    write_text(SUMMARY, "\n".join(summary_lines) + "\n")


def main():
    for path in [RESULTS, SHARD, SUMMARY.parent, WORK_ROOT, RUN_ROOT]:
        path.mkdir(parents=True, exist_ok=True)

    candidate_rows = []
    eval_rows = []
    failed_rows = []
    best_rows = []
    struct_rows = []
    sim_rows = []

    for defn in candidate_defs():
        struct_rows.append(
            {
                "case": defn["case"],
                "agent_id": AGENT_ID,
                "hypothesis": defn["hypothesis"],
                "representation": defn["representation"],
                "shared_structure": defn["shared_structure"],
                "expected_sharing": "reduce table control or expose source-level shared predicates while preserving exact E5M2FN semantics",
                "observed_result": "pending",
                "notes": defn["method_signature"],
            }
        )
        for synth_name, synth_renderer in SYNTHS:
            cand, ev, failed, best = run_candidate(defn, synth_name, synth_renderer)
            candidate_rows.append(cand)
            eval_rows.append(ev)
            if failed:
                failed_rows.append(failed)
            if best:
                best_rows.append(best)
            sim_rows.append(
                {
                    "case": defn["case"],
                    "domain": DOMAIN,
                    "agent_id": AGENT_ID,
                    "candidate_id": cand["candidate_id"],
                    "simulation_status": "not_run_debug_only",
                    "sim_log": "",
                    "notes": "official evaluate.py was run; iverilog was not needed for this source-level probe",
                }
            )

    for row in struct_rows:
        rows = [cand for cand in candidate_rows if cand["case"] == row["case"] and cand["hypothesis"] == row["hypothesis"] and cand["equivalent"] == "1" and cand["adp"]]
        if rows:
            best = min(rows, key=lambda cand: int(cand["adp"]))
            row["observed_result"] = "{0}/{1}/{2}".format(best["area"], best["delay"], best["adp"])
        else:
            row["observed_result"] = "no equivalent official candidate"

    write_csv(RESULTS / "candidates.csv", CANDIDATE_FIELDS, candidate_rows)
    write_csv(RESULTS / "evaluation_results.csv", EVAL_FIELDS, eval_rows)
    write_csv(RESULTS / "failed_hypotheses.csv", FAILED_FIELDS, failed_rows)
    write_csv(RESULTS / "best_improvements.csv", BEST_FIELDS, best_rows)
    write_csv(RESULTS / "simulation_results.csv", SIM_FIELDS, sim_rows)
    write_csv(RESULTS / "shared_structure_report.csv", STRUCT_FIELDS, struct_rows)
    write_csv(SHARD / "candidates.csv", CANDIDATE_FIELDS, candidate_rows)
    write_csv(SHARD / "evaluation_results.csv", EVAL_FIELDS, eval_rows)
    write_csv(SHARD / "failed_hypotheses.csv", FAILED_FIELDS, failed_rows)
    write_csv(SHARD / "best_improvements.csv", BEST_FIELDS, best_rows)
    write_csv(SHARD / "simulation_results.csv", SIM_FIELDS, sim_rows)
    write_csv(SHARD / "shared_structure_report.csv", STRUCT_FIELDS, struct_rows)

    write_manifest(candidate_rows, failed_rows, best_rows)
    write_text(
        WORK_ROOT / "manifest.json",
        json.dumps(
            {
                "run_id": RUN_ID,
                "agent_id": AGENT_ID,
                "cases": ["ex246", "ex247"],
                "candidate_rows": len(candidate_rows),
                "equivalent_rows": sum(1 for row in candidate_rows if row["equivalent"] == "1"),
                "best_improvements": len(best_rows),
            },
            indent=2,
            sort_keys=True,
        )
        + "\n",
    )
    print("wrote {0}".format(rel(RESULTS / "candidates.csv")))
    print("equivalent {0}/{1}".format(sum(1 for row in candidate_rows if row["equivalent"] == "1"), len(candidate_rows)))
    print("best_improvements {0}".format(len(best_rows)))


if __name__ == "__main__":
    main()
