#!/usr/bin/env python3
"""Exhaustively verify a combinational Verilog module against a truth source."""

import argparse
import importlib
import importlib.util
import inspect
import json
import os
import re
import subprocess
import sys
import tempfile
from pathlib import Path


ROOT = Path(__file__).resolve().parents[2]
FRONTENDS = ROOT / "student" / "frontends"
DEFAULT_YOSYS = ROOT / "student" / "tools" / "conda-env" / "bin" / "yosys"
DEFAULT_BENCHMARKS = ROOT / "benchmarks"
VALID_BIT_ORDERS = ("lsb_first", "msb_first")
VALID_INPUT_ORDERS = ("abc_xf", "raw")
MITER_MODULE = "__als_truth_miter"

if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))
if str(FRONTENDS) not in sys.path:
    sys.path.insert(0, str(FRONTENDS))


class VerifyError(Exception):
    pass


class TruthData(object):
    def __init__(self, case, input_width, output_width, values, source):
        self.case = case
        self.input_width = input_width
        self.output_width = output_width
        self.values = values
        self.source = source

    @property
    def num_inputs(self):
        return len(self.values)


def parse_int(value):
    try:
        return int(value, 0)
    except ValueError:
        raise argparse.ArgumentTypeError("invalid integer: {0}".format(value))


def is_power_of_two(value):
    return value > 0 and (value & (value - 1)) == 0


def log2_power_of_two(value):
    if not is_power_of_two(value):
        raise VerifyError("truth table entry count must be a power of two, got {0}".format(value))
    return value.bit_length() - 1


def validate_identifier(name, label):
    if not name:
        raise VerifyError("{0} must be non-empty".format(label))
    if name[0] != "_" and not name[0].isalpha():
        raise VerifyError("{0} is not a simple Verilog identifier: {1}".format(label, name))
    for char in name[1:]:
        if char != "_" and not char.isalnum():
            raise VerifyError("{0} is not a simple Verilog identifier: {1}".format(label, name))


def yosys_quote(value):
    text = str(value)
    return '"' + text.replace("\\", "\\\\").replace('"', '\\"') + '"'


def verilog_const(width, value):
    digits = (width + 3) // 4
    if digits < 1:
        digits = 1
    mask = (1 << width) - 1
    return "{0}'h{1:0{2}x}".format(width, value & mask, digits)


def width_range(width):
    if width <= 0:
        raise VerifyError("width must be positive")
    if width == 1:
        return ""
    return "[{0}:0] ".format(width - 1)


def run_command(command, timeout):
    try:
        result = subprocess.run(
            command,
            stdout=subprocess.PIPE,
            stderr=subprocess.STDOUT,
            universal_newlines=True,
            timeout=timeout,
        )
    except OSError as error:
        raise VerifyError("failed to execute {0}: {1}".format(command[0], error))
    except subprocess.TimeoutExpired:
        raise VerifyError("command timed out after {0}s: {1}".format(timeout, " ".join(command)))
    return result.returncode, result.stdout


def import_first(module_names):
    for module_name in module_names:
        try:
            return importlib.import_module(module_name), module_name
        except ImportError as error:
            if getattr(error, "name", None) != module_name:
                raise
    return None, None


def normalise_bitplanes(case, planes, bit_order, input_order, source):
    if bit_order not in VALID_BIT_ORDERS:
        raise VerifyError("unknown bit order: {0}".format(bit_order))
    if input_order not in VALID_INPUT_ORDERS:
        raise VerifyError("unknown input order: {0}".format(input_order))
    if not planes:
        raise VerifyError("empty truth table from {0}".format(source))

    first_len = len(planes[0])
    if first_len == 0:
        raise VerifyError("empty first truth bit-plane from {0}".format(source))
    if not is_power_of_two(first_len):
        raise VerifyError("truth bit-plane length must be a power of two, got {0}".format(first_len))

    output_width = len(planes)
    input_mask = first_len - 1
    values = [0] * first_len
    for line_index, raw_plane in enumerate(planes):
        if len(raw_plane) != first_len:
            raise VerifyError("truth bit-plane {0} has inconsistent length".format(line_index))
        if isinstance(raw_plane, bytes):
            plane = raw_plane
            one = ord("1")
            zero = ord("0")
        else:
            plane = raw_plane
            one = "1"
            zero = "0"
        if bit_order == "lsb_first":
            bit_index = line_index
        else:
            bit_index = output_width - 1 - line_index
        bit_value = 1 << bit_index
        for raw_index, char in enumerate(plane):
            if char == one:
                if input_order == "raw":
                    index = raw_index
                else:
                    index = input_mask ^ raw_index
                values[index] |= bit_value
            elif char != zero:
                raise VerifyError("truth bit-plane {0} contains non-binary data".format(line_index))

    return TruthData(case, log2_power_of_two(first_len), output_width, values, source)


def normalise_value_sequence(case, values, input_width, output_width, source):
    if input_width is None:
        input_width = log2_power_of_two(len(values))
    if output_width is None:
        max_value = max(values) if values else 0
        output_width = max(1, max_value.bit_length())

    expected_len = 1 << input_width
    if len(values) != expected_len:
        raise VerifyError(
            "truth source has {0} entries, expected {1} for input_width={2}".format(
                len(values), expected_len, input_width
            )
        )

    mask = (1 << output_width) - 1
    normalised = []
    for index, value in enumerate(values):
        try:
            value = int(value)
        except (TypeError, ValueError):
            raise VerifyError("truth value at index {0} is not an integer".format(index))
        if value < 0:
            raise VerifyError("truth value at index {0} is negative".format(index))
        if value & ~mask:
            raise VerifyError("truth value at index {0} exceeds output_width={1}".format(index, output_width))
        normalised.append(value)
    return TruthData(case, input_width, output_width, normalised, source)


def truth_from_table_object(case, table, source):
    input_width = getattr(table, "input_width", None)
    output_width = getattr(table, "output_width", None)
    num_inputs = getattr(table, "num_inputs", None)
    if num_inputs is None and input_width is not None:
        num_inputs = 1 << input_width
    if input_width is None and num_inputs is not None:
        input_width = log2_power_of_two(num_inputs)

    if hasattr(table, "iter_outputs"):
        values = list(table.iter_outputs())
    elif hasattr(table, "get_output") and num_inputs is not None:
        values = [table.get_output(index) for index in range(num_inputs)]
    else:
        return None
    return normalise_value_sequence(case, values, input_width, output_width, source)


def truth_from_generic_result(case, result, source, bit_order, input_order):
    if result is None:
        return None

    table = truth_from_table_object(case, result, source)
    if table is not None:
        return table

    input_width = getattr(result, "input_width", None)
    output_width = getattr(result, "output_width", None)
    values = getattr(result, "values", None)
    if values is None:
        values = getattr(result, "outputs", None)
    if values is None:
        values = getattr(result, "table", None)

    if isinstance(result, dict):
        input_width = result.get("input_width", input_width)
        output_width = result.get("output_width", output_width)
        for key in ("values", "outputs", "table", "truth"):
            if key in result:
                values = result[key]
                break

    if values is None and isinstance(result, list):
        values = result

    if values is None and isinstance(result, tuple):
        try:
            if len(result) == 3:
                first, second, third = result[0], result[1], result[2]
                if isinstance(first, int) and isinstance(second, int):
                    input_width, output_width, values = first, second, third
                else:
                    values, input_width, output_width = first, second, third
            elif len(result) == 2:
                input_width, output_width = result[0], result[1]
                values = None
        except (TypeError, IndexError):
            pass

    if values is None:
        return None

    values = list(values)
    if values and all(isinstance(value, str) for value in values):
        if all(value and all(char in "01" for char in value) for value in values):
            if is_power_of_two(len(values[0])) and (output_width is None or len(values) == output_width):
                return normalise_bitplanes(case, values, bit_order, input_order, source)
            return normalise_value_sequence(case, [int(value, 2) for value in values], input_width, output_width, source)
    if values and all(isinstance(value, bytes) for value in values):
        return normalise_bitplanes(case, values, bit_order, input_order, source)
    return normalise_value_sequence(case, values, input_width, output_width, source)


def call_with_supported_args(func, case, truth_path, benchmarks_dir, bit_order, input_order, input_width, output_width):
    signature = inspect.signature(func)
    params = signature.parameters
    kwargs = {}

    for name, param in params.items():
        if name in ("case", "case_name"):
            kwargs[name] = case
        elif name in ("truth", "truth_path", "path"):
            kwargs[name] = truth_path
        elif name in ("benchmarks", "benchmarks_dir"):
            kwargs[name] = benchmarks_dir
        elif name == "bit_order":
            kwargs[name] = bit_order
        elif name == "input_order":
            kwargs[name] = input_order
        elif name == "input_width" and input_width is not None:
            kwargs[name] = input_width
        elif name == "output_width" and output_width is not None:
            kwargs[name] = output_width
        elif param.default == inspect.Parameter.empty and param.kind in (
            inspect.Parameter.POSITIONAL_OR_KEYWORD,
            inspect.Parameter.KEYWORD_ONLY,
        ):
            return None
    return func(**kwargs)


def load_truth_with_module(case, truth_path, benchmarks_dir, bit_order, input_order, input_width, output_width):
    module, module_name = import_first(["student.frontends.truth", "truth"])
    if module is None:
        return None

    table_cls = getattr(module, "TruthTable", None)
    if table_cls is not None and truth_path is not None and Path(truth_path).is_file():
        try:
            table = table_cls(str(truth_path), bit_order=bit_order, input_order=input_order)
        except TypeError:
            table = table_cls(str(truth_path))
        return truth_from_table_object(case, table, "{0}.TruthTable".format(module_name))

    for func_name in ("load_truth", "load_case", "get_truth", "truth_table", "get_case"):
        func = getattr(module, func_name, None)
        if func is None:
            continue
        result = call_with_supported_args(
            func,
            case,
            truth_path,
            benchmarks_dir,
            bit_order,
            input_order,
            input_width,
            output_width,
        )
        table = truth_from_generic_result(
            case,
            result,
            "{0}.{1}".format(module_name, func_name),
            bit_order,
            input_order,
        )
        if table is not None:
            return table
    return None


def load_truth_file(case, truth_path, bit_order, input_order):
    with Path(truth_path).open("rb") as handle:
        planes = handle.read().splitlines()
    return normalise_bitplanes(case, planes, bit_order, input_order, str(truth_path))


def load_python_model(spec):
    if ":" not in spec:
        raise VerifyError("--python-model must be MODULE_OR_PATH:function")
    module_part, func_name = spec.rsplit(":", 1)
    if module_part.endswith(".py") or os.path.sep in module_part:
        path = Path(module_part)
        if not path.is_file():
            raise VerifyError("Python model file not found: {0}".format(path))
        module_name = "als_python_model_{0}".format(abs(hash(str(path))))
        spec_obj = importlib.util.spec_from_file_location(module_name, str(path))
        module = importlib.util.module_from_spec(spec_obj)
        spec_obj.loader.exec_module(module)
    else:
        module = importlib.import_module(module_part)
    func = getattr(module, func_name, None)
    if func is None:
        raise VerifyError("Python model function not found: {0}".format(func_name))
    return module, func


def model_width(module, names):
    for name in names:
        value = getattr(module, name, None)
        if isinstance(value, int):
            return value
    return None


def call_python_model(func, index, input_width, output_width, case):
    signature = inspect.signature(func)
    kwargs = {}
    positional = []
    for name, param in signature.parameters.items():
        if name in ("index", "value", "x", "input_value"):
            kwargs[name] = index
        elif name == "input_width":
            kwargs[name] = input_width
        elif name == "output_width":
            kwargs[name] = output_width
        elif name == "case":
            kwargs[name] = case
        elif param.kind in (inspect.Parameter.POSITIONAL_ONLY, inspect.Parameter.POSITIONAL_OR_KEYWORD):
            positional.append(name)

    if kwargs:
        return func(**kwargs)
    if len(positional) <= 1:
        return func(index)
    return func(index, input_width, output_width)


def load_truth_from_python_model(case, spec, input_width, output_width):
    module, func = load_python_model(spec)
    if input_width is None:
        input_width = model_width(module, ("INPUT_WIDTH", "input_width"))
    if output_width is None:
        output_width = model_width(module, ("OUTPUT_WIDTH", "output_width"))
    if input_width is None or output_width is None:
        raise VerifyError("--python-model requires --input-width and --output-width unless the model module defines them")
    values = []
    for index in range(1 << input_width):
        values.append(call_python_model(func, index, input_width, output_width, case))
    return normalise_value_sequence(case, values, input_width, output_width, "python_model:{0}".format(spec))


def apply_width_overrides(truth, input_width, output_width):
    if input_width is not None and input_width != truth.input_width:
        raise VerifyError(
            "--input-width={0} conflicts with truth source input_width={1}".format(input_width, truth.input_width)
        )
    if output_width is not None and output_width != truth.output_width:
        raise VerifyError(
            "--output-width={0} conflicts with truth source output_width={1}".format(output_width, truth.output_width)
        )
    return truth


def load_truth(args):
    if args.python_model:
        truth = load_truth_from_python_model(args.case, args.python_model, args.input_width, args.output_width)
        return truth

    truth_path = args.truth
    if truth_path is None:
        truth_path = args.benchmarks / "{0}.truth".format(args.case)

    table = load_truth_with_module(
        case=args.case,
        truth_path=truth_path,
        benchmarks_dir=args.benchmarks,
        bit_order=args.bit_order,
        input_order=args.input_order,
        input_width=args.input_width,
        output_width=args.output_width,
    )
    if table is None:
        if truth_path is not None and Path(truth_path).is_file():
            table = load_truth_file(args.case, truth_path, args.bit_order, args.input_order)
        else:
            raise VerifyError(
                "truth source unavailable for {0}: no truth table at {1}, and no supported truth.py loader. "
                "Pass --truth, or use --python-model with --input-width and --output-width.".format(
                    args.case, truth_path
                )
            )
    return apply_width_overrides(table, args.input_width, args.output_width)


def discover_ports(verilog, module, yosys, timeout, use_sv):
    read_cmd = "read_verilog"
    if use_sv:
        read_cmd += " -sv"

    with tempfile.TemporaryDirectory(prefix="als_port_discovery_") as temp_dir:
        json_path = Path(temp_dir) / "design.json"
        script_path = Path(temp_dir) / "discover.ys"
        script = "\n".join(
            [
                "{0} {1}".format(read_cmd, yosys_quote(verilog)),
                "hierarchy -check -top {0}".format(module),
                "write_json {0}".format(yosys_quote(json_path)),
                "",
            ]
        )
        with script_path.open("w") as handle:
            handle.write(script)
        returncode, log = run_command([str(yosys), "-s", str(script_path)], timeout)
        if returncode != 0:
            raise VerifyError("Yosys port discovery failed:\n{0}".format(log.strip()))
        with json_path.open("r") as handle:
            data = json.load(handle)

    modules = data.get("modules", {})
    if module not in modules:
        raise VerifyError("Yosys JSON did not contain top module {0}".format(module))
    ports = modules[module].get("ports", {})
    inputs = []
    outputs = []
    for name, port in ports.items():
        direction = port.get("direction")
        width = len(port.get("bits", []))
        if direction == "input":
            inputs.append((name, width))
        elif direction == "output":
            outputs.append((name, width))

    if len(inputs) != 1 or len(outputs) != 1:
        raise VerifyError(
            "cannot auto-select DUT ports for {0}: found inputs={1}, outputs={2}. "
            "Pass --input-port and --output-port.".format(module, inputs, outputs)
        )
    return inputs[0], outputs[0]


def resolve_ports(args, truth):
    input_port = args.input_port
    output_port = args.output_port
    input_port_width = None
    output_port_width = None

    if input_port is None or output_port is None:
        discovered_input, discovered_output = discover_ports(args.verilog, args.module, args.yosys, args.timeout, args.sv)
        if input_port is None:
            input_port, input_port_width = discovered_input
        if output_port is None:
            output_port, output_port_width = discovered_output
    validate_identifier(args.module, "--module")
    validate_identifier(input_port, "--input-port")
    validate_identifier(output_port, "--output-port")

    if input_port_width is not None and input_port_width != truth.input_width:
        raise VerifyError(
            "DUT input port {0} has width {1}, truth input_width is {2}".format(
                input_port, input_port_width, truth.input_width
            )
        )
    if output_port_width is not None and output_port_width != truth.output_width:
        raise VerifyError(
            "DUT output port {0} has width {1}, truth output_width is {2}".format(
                output_port, output_port_width, truth.output_width
            )
        )
    return input_port, output_port


def render_expected_function(truth, function_name):
    lines = [
        "  function {0}{1};".format(width_range(truth.output_width), function_name),
        "    input {0}__als_idx;".format(width_range(truth.input_width)),
        "    begin",
        "      case (__als_idx)",
    ]
    for index, value in enumerate(truth.values):
        lines.append(
            "        {0}'d{1}: {2} = {3};".format(
                truth.input_width,
                index,
                function_name,
                verilog_const(truth.output_width, value),
            )
        )
    lines.extend(
        [
            "        default: {0} = {1};".format(function_name, verilog_const(truth.output_width, 0)),
            "      endcase",
            "    end",
            "  endfunction",
        ]
    )
    return lines


def render_miter(truth, module, input_port, output_port):
    lines = [
        "module {0}(in, actual, expected, mismatch);".format(MITER_MODULE),
        "  input {0}in;".format(width_range(truth.input_width)),
        "  output {0}actual;".format(width_range(truth.output_width)),
        "  output {0}expected;".format(width_range(truth.output_width)),
        "  output mismatch;",
        "",
        "  {0} dut (.{1}(in), .{2}(actual));".format(module, input_port, output_port),
        "  assign expected = __als_expected(in);",
        "  assign mismatch = (actual != expected);",
        "",
    ]
    lines.extend(render_expected_function(truth, "__als_expected"))
    lines.extend(["endmodule", ""])
    return "\n".join(lines)


def render_testbench(truth, module, input_port, output_port, max_mismatches):
    lines = [
        "module __als_truth_tb;",
        "  reg {0}__als_in;".format(width_range(truth.input_width)),
        "  wire {0}__als_out;".format(width_range(truth.output_width)),
        "  integer __als_i;",
        "  integer __als_mismatches;",
        "",
        "  {0} dut (.{1}(__als_in), .{2}(__als_out));".format(module, input_port, output_port),
        "",
    ]
    lines.extend(render_expected_function(truth, "__als_expected"))
    lines.extend(
        [
            "",
            "  initial begin",
            "    __als_mismatches = 0;",
            "    for (__als_i = 0; __als_i < {0}; __als_i = __als_i + 1) begin".format(truth.num_inputs),
            "      __als_in = __als_i[{0}:0];".format(truth.input_width - 1),
            "      #1;",
            "      if (__als_out !== __als_expected(__als_in)) begin",
            "        if (__als_mismatches < {0}) begin".format(max_mismatches),
            "          $display(\"MISMATCH input=%0d expected=%0h actual=%0h\", __als_i, __als_expected(__als_in), __als_out);",
            "        end",
            "        __als_mismatches = __als_mismatches + 1;",
            "      end",
            "    end",
            "    if (__als_mismatches == 0) begin",
            "      $display(\"PASS checked={0}\");".format(truth.num_inputs),
            "    end else begin",
            "      $display(\"FAIL mismatches=%0d\", __als_mismatches);",
            "    end",
            "    $finish;",
            "  end",
            "endmodule",
            "",
        ]
    )
    return "\n".join(lines)


def parse_signal_line(line):
    parts = line.strip().split()
    if len(parts) < 2:
        return None
    name = parts[0].lstrip("\\")
    if name not in ("in", "expected", "actual"):
        return None
    for token in reversed(parts[1:]):
        cleaned = token.lower().replace("_", "")
        if cleaned and all(char in "01xz" for char in cleaned):
            cleaned = cleaned.replace("x", "0").replace("z", "0")
            return name, int(cleaned, 2)
    for token in reversed(parts[1:]):
        cleaned = token.lower().replace("_", "")
        if cleaned.startswith("0x"):
            cleaned = cleaned[2:]
        if cleaned and all(char in "0123456789abcdef" for char in cleaned):
            return name, int(cleaned, 16)
    return None


def parse_yosys_sat_models(log, max_mismatches):
    models = []
    current = {}
    for line in log.splitlines():
        parsed = parse_signal_line(line)
        if parsed is None:
            continue
        name, value = parsed
        current[name] = value
        if "in" in current and "expected" in current and "actual" in current:
            models.append(
                {
                    "input": current["in"],
                    "expected": current["expected"],
                    "actual": current["actual"],
                }
            )
            current = {}
            if len(models) >= max_mismatches:
                break
    return models


def verify_with_yosys_sat(args, truth, input_port, output_port):
    with tempfile.TemporaryDirectory(prefix="als_sim_verify_") as temp_dir:
        temp_dir = Path(temp_dir)
        miter_path = temp_dir / "miter.v"
        script_path = temp_dir / "verify.ys"
        with miter_path.open("w") as handle:
            handle.write(render_miter(truth, args.module, input_port, output_port))

        read_cmd = "read_verilog"
        if args.sv:
            read_cmd += " -sv"
        script = "\n".join(
            [
                "{0} {1}".format(read_cmd, yosys_quote(args.verilog)),
                "read_verilog {0}".format(yosys_quote(miter_path)),
                "prep -top {0} -flatten".format(MITER_MODULE),
                "memory_map",
                "opt",
                "sat -max {0} -set-def-inputs -set mismatch 1 -show in -show expected -show actual".format(
                    args.max_mismatches
                ),
                "",
            ]
        )
        with script_path.open("w") as handle:
            handle.write(script)
        returncode, log = run_command([str(args.yosys), "-s", str(script_path)], args.timeout)

    if returncode != 0:
        raise VerifyError("Yosys SAT verification failed:\n{0}".format(log.strip()))
    if re.search(r"no model found", log, re.IGNORECASE):
        return True, [], log
    if re.search(r"model found", log, re.IGNORECASE):
        return False, parse_yosys_sat_models(log, args.max_mismatches), log
    raise VerifyError("could not parse Yosys SAT result:\n{0}".format("\n".join(log.splitlines()[-40:])))


def format_word(value, width):
    digits = (width + 3) // 4
    if digits < 1:
        digits = 1
    return "0x{0:0{1}x}".format(value, digits)


def write_report(path, report_format, result):
    path = Path(path)
    path.parent.mkdir(parents=True, exist_ok=True)
    if report_format == "auto":
        if path.suffix.lower() == ".json":
            report_format = "json"
        else:
            report_format = "text"
    if report_format == "json":
        with path.open("w") as handle:
            json.dump(result, handle, indent=2, sort_keys=True)
            handle.write("\n")
    else:
        lines = [
            "status: {0}".format(result["status"]),
            "case: {0}".format(result["case"]),
            "module: {0}".format(result["module"]),
            "engine: {0}".format(result["engine"]),
            "truth_source: {0}".format(result["truth_source"]),
            "input_width: {0}".format(result["input_width"]),
            "output_width: {0}".format(result["output_width"]),
            "checked_inputs: {0}".format(result["checked_inputs"]),
        ]
        if result["mismatches"]:
            lines.append("mismatches:")
            for mismatch in result["mismatches"]:
                lines.append(
                    "  input={0} expected={1} actual={2}".format(
                        mismatch["input_hex"],
                        mismatch["expected_hex"],
                        mismatch["actual_hex"],
                    )
                )
        with path.open("w") as handle:
            handle.write("\n".join(lines) + "\n")


def build_result(args, truth, passed, mismatches, engine):
    result_mismatches = []
    for mismatch in mismatches:
        result_mismatches.append(
            {
                "input": mismatch["input"],
                "expected": mismatch["expected"],
                "actual": mismatch["actual"],
                "input_hex": format_word(mismatch["input"], truth.input_width),
                "expected_hex": format_word(mismatch["expected"], truth.output_width),
                "actual_hex": format_word(mismatch["actual"], truth.output_width),
            }
        )
    return {
        "case": args.case,
        "module": args.module,
        "engine": engine,
        "truth_source": truth.source,
        "input_width": truth.input_width,
        "output_width": truth.output_width,
        "checked_inputs": truth.num_inputs,
        "status": "pass" if passed else "fail",
        "mismatches": result_mismatches,
    }


def print_summary(result):
    if result["status"] == "pass":
        print(
            "PASS {case}: checked {checked_inputs} inputs ({input_width}-bit -> {output_width}-bit) with {engine}".format(
                **result
            )
        )
        return
    print(
        "FAIL {case}: mismatch found while checking {checked_inputs} inputs with {engine}".format(
            **result
        )
    )
    for mismatch in result["mismatches"]:
        print(
            "  input={0} expected={1} actual={2}".format(
                mismatch["input_hex"],
                mismatch["expected_hex"],
                mismatch["actual_hex"],
            )
        )


def parse_args(argv):
    parser = argparse.ArgumentParser(description="Exhaustively verify a Verilog module against an ALS truth source.")
    parser.add_argument("--case", required=True, help="Benchmark case name, for example ex200.")
    parser.add_argument("--verilog", required=True, type=Path, help="Candidate Verilog file.")
    parser.add_argument("--module", required=True, help="Top module name.")
    parser.add_argument("--truth", type=Path, help="Truth table path. Defaults to benchmarks/<case>.truth.")
    parser.add_argument("--benchmarks", type=Path, default=DEFAULT_BENCHMARKS, help="Benchmark truth directory.")
    parser.add_argument("--input-width", type=parse_int, help="Override or provide input width.")
    parser.add_argument("--output-width", type=parse_int, help="Override or provide output width.")
    parser.add_argument(
        "--bit-order",
        choices=VALID_BIT_ORDERS,
        default="lsb_first",
        help="Map truth table lines to output bits.",
    )
    parser.add_argument(
        "--input-order",
        choices=VALID_INPUT_ORDERS,
        default="abc_xf",
        help="Map numeric input index to truth-file character index.",
    )
    parser.add_argument("--input-port", help="DUT input port. Auto-detected when omitted and unambiguous.")
    parser.add_argument("--output-port", help="DUT output port. Auto-detected when omitted and unambiguous.")
    parser.add_argument("--python-model", help="Reference model as MODULE_OR_PATH:function.")
    parser.add_argument("--yosys", type=Path, default=DEFAULT_YOSYS, help="Yosys executable path.")
    parser.add_argument("--timeout", type=int, default=120, help="Yosys timeout in seconds.")
    parser.add_argument("--max-mismatches", type=int, default=5, help="Maximum mismatches to report.")
    parser.add_argument("--report", type=Path, help="Optional JSON or text report path.")
    parser.add_argument("--report-format", choices=("auto", "json", "text"), default="auto")
    parser.add_argument("--emit-testbench", type=Path, help="Write an exhaustive Verilog testbench scaffold.")
    parser.add_argument("--engine", choices=("yosys-sat", "yosys-sim"), default="yosys-sat")
    parser.add_argument("--sv", action="store_true", help="Read candidate Verilog as SystemVerilog.")
    return parser.parse_args(argv)


def main(argv=None):
    args = parse_args(argv)
    try:
        if args.max_mismatches <= 0:
            raise VerifyError("--max-mismatches must be positive")
        if not args.verilog.is_file():
            raise VerifyError("Verilog input not found: {0}".format(args.verilog))
        if not args.yosys.is_file():
            raise VerifyError("Yosys executable not found: {0}".format(args.yosys))

        truth = load_truth(args)
        input_port, output_port = resolve_ports(args, truth)

        if args.emit_testbench is not None:
            args.emit_testbench.parent.mkdir(parents=True, exist_ok=True)
            with args.emit_testbench.open("w") as handle:
                handle.write(render_testbench(truth, args.module, input_port, output_port, args.max_mismatches))

        if args.engine == "yosys-sim":
            raise VerifyError(
                "Yosys sim does not reliably run the generated procedural exhaustive testbench here. "
                "Use --engine yosys-sat, or pass --emit-testbench and run it with a Verilog simulator."
            )

        passed, mismatches, unused_log = verify_with_yosys_sat(args, truth, input_port, output_port)
        result = build_result(args, truth, passed, mismatches, "yosys-sat")
        if args.report is not None:
            write_report(args.report, args.report_format, result)
        print_summary(result)
        return 0 if passed else 1
    except VerifyError as error:
        print("ERROR: {0}".format(error), file=sys.stderr)
        return 2


if __name__ == "__main__":
    raise SystemExit(main())
