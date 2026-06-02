#!/usr/bin/env python3
"""Synthesize a Verilog module to AIGER using the local Yosys install."""

import argparse
import os
import subprocess
import sys
import tempfile
from pathlib import Path


ROOT = Path(__file__).resolve().parents[2]
DEFAULT_YOSYS = ROOT / "student" / "tools" / "conda-env" / "bin" / "yosys"


class SynthError(Exception):
    pass


def yosys_quote(value):
    text = str(value)
    return '"' + text.replace("\\", "\\\\").replace('"', '\\"') + '"'


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
        raise SynthError("failed to execute {0}: {1}".format(command[0], error))
    except subprocess.TimeoutExpired:
        raise SynthError("command timed out after {0}s: {1}".format(timeout, " ".join(command)))
    return result.returncode, result.stdout


def build_yosys_script(verilog, module, output, use_sv=False, use_abc=True, ascii_aiger=False):
    read_cmd = "read_verilog"
    if use_sv:
        read_cmd += " -sv"

    lines = [
        "{0} {1}".format(read_cmd, yosys_quote(verilog)),
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
    ]
    if use_abc:
        lines.extend(
            [
                "abc -g AND",
                "opt",
            ]
        )
    lines.extend(
        [
            "aigmap",
            "opt",
            "clean",
        ]
    )

    write_cmd = "write_aiger -symbols"
    if ascii_aiger:
        write_cmd += " -ascii"
    lines.append("{0} {1}".format(write_cmd, yosys_quote(output)))
    return "\n".join(lines) + "\n"


def synthesize_verilog(
    verilog,
    module,
    output,
    yosys=DEFAULT_YOSYS,
    timeout=120,
    use_sv=False,
    use_abc=True,
    ascii_aiger=False,
    script_out=None,
):
    verilog = Path(verilog)
    output = Path(output)
    yosys = Path(yosys)

    if not verilog.is_file():
        raise SynthError("Verilog input not found: {0}".format(verilog))
    if not yosys.is_file():
        raise SynthError("Yosys executable not found: {0}".format(yosys))
    if not module:
        raise SynthError("--module must be non-empty")

    output.parent.mkdir(parents=True, exist_ok=True)
    script_text = build_yosys_script(
        verilog=verilog,
        module=module,
        output=output,
        use_sv=use_sv,
        use_abc=use_abc,
        ascii_aiger=ascii_aiger,
    )

    if script_out is not None:
        script_out = Path(script_out)
        script_out.parent.mkdir(parents=True, exist_ok=True)
        with script_out.open("w") as handle:
            handle.write(script_text)

    with tempfile.NamedTemporaryFile("w", suffix=".ys", prefix="als_yosys_synth_", delete=False) as handle:
        script_path = Path(handle.name)
        handle.write(script_text)

    try:
        returncode, log = run_command([str(yosys), "-s", str(script_path)], timeout=timeout)
    finally:
        try:
            os.unlink(str(script_path))
        except OSError:
            pass

    if returncode != 0:
        raise SynthError("Yosys failed with exit code {0}:\n{1}".format(returncode, log.strip()))
    if not output.is_file():
        raise SynthError("Yosys did not create expected output: {0}".format(output))
    if output.stat().st_size <= 0:
        raise SynthError("Yosys created an empty AIGER file: {0}".format(output))
    return log


def write_identity_verilog(path):
    text = "\n".join(
        [
            "module top(x, y);",
            "  input [7:0] x;",
            "  output [7:0] y;",
            "  assign y = x;",
            "endmodule",
            "",
        ]
    )
    with Path(path).open("w") as handle:
        handle.write(text)


def run_self_test(args):
    verilog = Path("/tmp/als_yosys_synth_identity.v")
    output = Path("/tmp/als_yosys_synth_identity.aig")
    write_identity_verilog(verilog)
    synthesize_verilog(
        verilog=verilog,
        module="top",
        output=output,
        yosys=args.yosys,
        timeout=args.timeout,
        use_sv=args.sv,
        use_abc=not args.no_abc,
        ascii_aiger=args.ascii,
        script_out=args.script_out,
    )
    print("PASS self-test: {0} ({1} bytes)".format(output, output.stat().st_size))


def parse_args(argv):
    parser = argparse.ArgumentParser(description="Convert a Verilog module to AIGER with Yosys.")
    parser.add_argument("--verilog", help="Input Verilog file.")
    parser.add_argument("--module", help="Top module name.")
    parser.add_argument("--output", help="Output .aig path.")
    parser.add_argument("--yosys", type=Path, default=DEFAULT_YOSYS, help="Yosys executable path.")
    parser.add_argument("--timeout", type=int, default=120, help="Yosys timeout in seconds.")
    parser.add_argument("--sv", action="store_true", help="Read input as SystemVerilog.")
    parser.add_argument("--no-abc", action="store_true", help="Skip the Yosys abc -g AND mapping pass.")
    parser.add_argument("--ascii", action="store_true", help="Write ASCII AIGER instead of binary AIGER.")
    parser.add_argument("--script-out", type=Path, help="Optional path to save the generated Yosys script.")
    parser.add_argument("--self-test", action="store_true", help="Synthesize a tiny identity module in /tmp.")
    return parser.parse_args(argv)


def main(argv=None):
    args = parse_args(argv)
    try:
        if args.self_test:
            run_self_test(args)
            return 0
        missing = [name for name in ("verilog", "module", "output") if getattr(args, name) is None]
        if missing:
            raise SynthError("missing required arguments: {0}".format(", ".join("--" + name for name in missing)))
        synthesize_verilog(
            verilog=args.verilog,
            module=args.module,
            output=args.output,
            yosys=args.yosys,
            timeout=args.timeout,
            use_sv=args.sv,
            use_abc=not args.no_abc,
            ascii_aiger=args.ascii,
            script_out=args.script_out,
        )
        size = Path(args.output).stat().st_size
        print("PASS synthesized {0} -> {1} ({2} bytes)".format(args.module, args.output, size))
        return 0
    except SynthError as error:
        print("ERROR: {0}".format(error), file=sys.stderr)
        return 1


if __name__ == "__main__":
    raise SystemExit(main())
