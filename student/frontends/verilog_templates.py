"""Small Verilog template generators for reverse-engineering seeds."""


BINARY_OPS = set(["add", "xor", "and", "or", "mul"])
SPLIT_BINARY_OPS = set(["add", "sub", "xor", "and", "or", "mul"])


def _check_positive_int(name, value):
    if not isinstance(value, int) or value <= 0:
        raise ValueError("{0} must be a positive integer".format(name))


def _check_identifier(name):
    if not isinstance(name, str) or not name:
        raise ValueError("module must be a non-empty string")
    first = name[0]
    if not (first == "_" or first.isalpha()):
        raise ValueError("invalid Verilog module name: {0}".format(name))
    for char in name[1:]:
        if not (char == "_" or char.isalnum()):
            raise ValueError("invalid Verilog module name: {0}".format(name))


def _const(width, value):
    _check_positive_int("width", width)
    if isinstance(value, int):
        if value < 0:
            raise ValueError("constant value must be non-negative")
        mask = (1 << width) - 1
        digits = (width + 3) // 4
        return "{0}'h{1:0{2}x}".format(width, value & mask, digits)
    if isinstance(value, str):
        value = value.strip()
        if "'" in value:
            return value
        if not value:
            raise ValueError("constant string must be non-empty")
        if any(char not in "01" for char in value):
            raise ValueError("binary constant string contains non-binary characters")
        return "{0}'b{1}".format(width, value[-width:].zfill(width))
    raise ValueError("unsupported constant value: {0!r}".format(value))


def _zero(width):
    return _const(width, 0)


def _fit_expr(expr, expr_width, target_width):
    _check_positive_int("expr_width", expr_width)
    _check_positive_int("target_width", target_width)
    if expr_width == target_width:
        return expr
    if expr_width > target_width:
        if target_width == 1:
            return "{0}[0]".format(expr)
        return "{0}[{1}:0]".format(expr, target_width - 1)
    pad_width = target_width - expr_width
    return "{{{{{0}{{1'b0}}}}, {1}}}".format(pad_width, expr)


def _range(width):
    _check_positive_int("width", width)
    return "[{0}:0]".format(width - 1)


def _module_header(module, input_width, output_width):
    _check_identifier(module)
    _check_positive_int("input_width", input_width)
    _check_positive_int("output_width", output_width)
    return [
        "module {0}(in, out);".format(module),
        "  input {0} in;".format(_range(input_width)),
        "  output {0} out;".format(_range(output_width)),
    ]


def identity_template(module, width=16, output_width=None, input_width=None):
    """Return a pass-through template, truncating or zero-extending as needed."""
    if input_width is None:
        input_width = width
    if output_width is None:
        output_width = width
    lines = _module_header(module, input_width, output_width)
    lines.extend(
        [
            "",
            "  assign out = {0};".format(_fit_expr("in", input_width, output_width)),
            "endmodule",
            "",
        ]
    )
    return "\n".join(lines)


def byte_binary_op_template(module, op, input_width=16, output_width=16):
    """Return a split-input binary operation template.

    The historical 16-bit case treats the input as two 8-bit operands. For other
    widths, the input is split into lower and upper halves and the low
    output_width bits of the operation are emitted.
    """
    if op not in BINARY_OPS:
        raise ValueError("unsupported binary op: {0}".format(op))
    _check_positive_int("input_width", input_width)
    _check_positive_int("output_width", output_width)
    if input_width < 2:
        raise ValueError("input_width must be at least 2 for binary op templates")

    right_width = input_width // 2
    left_width = input_width - right_width
    operand_width = max(left_width, right_width)

    if op == "mul":
        result_width = operand_width * 2
        operator = "*"
    elif op == "add":
        result_width = operand_width + 1
        operator = "+"
    elif op == "xor":
        result_width = operand_width
        operator = "^"
    elif op == "and":
        result_width = operand_width
        operator = "&"
    else:
        result_width = operand_width
        operator = "|"

    low_slice = "in[{0}:0]".format(right_width - 1)
    high_slice = "in[{0}:{1}]".format(input_width - 1, right_width)

    lines = _module_header(module, input_width, output_width)
    lines.extend(
        [
            "  wire {0} a;".format(_range(operand_width)),
            "  wire {0} b;".format(_range(operand_width)),
            "  wire {0} result;".format(_range(result_width)),
            "",
            "  assign a = {0};".format(_fit_expr(low_slice, right_width, operand_width)),
            "  assign b = {0};".format(_fit_expr(high_slice, left_width, operand_width)),
            "  assign result = a {0} b;".format(operator),
            "  assign out = {0};".format(_fit_expr("result", result_width, output_width)),
            "endmodule",
            "",
        ]
    )
    return "\n".join(lines)


def split_binary_op_template(
    module,
    op,
    input_width=16,
    output_width=16,
    order="low_high",
    invert_a=False,
    invert_b=False,
):
    """Return a split-input operation template with optional operand inversion."""
    if op not in SPLIT_BINARY_OPS:
        raise ValueError("unsupported split binary op: {0}".format(op))
    _check_positive_int("input_width", input_width)
    _check_positive_int("output_width", output_width)
    if input_width < 2:
        raise ValueError("input_width must be at least 2 for split binary op templates")
    if order not in ("low_high", "high_low"):
        raise ValueError("unsupported operand order: {0}".format(order))

    right_width = input_width // 2
    left_width = input_width - right_width
    operand_width = max(left_width, right_width)

    if op == "mul":
        result_width = operand_width * 2
        operator = "*"
    elif op in ("add", "sub"):
        result_width = operand_width + 1
        operator = "+" if op == "add" else "-"
    elif op == "xor":
        result_width = operand_width
        operator = "^"
    elif op == "and":
        result_width = operand_width
        operator = "&"
    else:
        result_width = operand_width
        operator = "|"

    low_slice = "in[{0}:0]".format(right_width - 1)
    high_slice = "in[{0}:{1}]".format(input_width - 1, right_width)
    if order == "low_high":
        a_slice, a_width = low_slice, right_width
        b_slice, b_width = high_slice, left_width
    else:
        a_slice, a_width = high_slice, left_width
        b_slice, b_width = low_slice, right_width

    a_expr = _fit_expr(a_slice, a_width, operand_width)
    b_expr = _fit_expr(b_slice, b_width, operand_width)
    if invert_a:
        a_expr = "~({0})".format(a_expr)
    if invert_b:
        b_expr = "~({0})".format(b_expr)

    lines = _module_header(module, input_width, output_width)
    lines.extend(
        [
            "  wire {0} a;".format(_range(operand_width)),
            "  wire {0} b;".format(_range(operand_width)),
            "  wire {0} result;".format(_range(result_width)),
            "",
            "  assign a = {0};".format(a_expr),
            "  assign b = {0};".format(b_expr),
            "  assign result = a {0} b;".format(operator),
            "  assign out = {0};".format(_fit_expr("result", result_width, output_width)),
            "endmodule",
            "",
        ]
    )
    return "\n".join(lines)


def _normalise_entries(entries):
    if entries is None:
        return []
    if isinstance(entries, dict):
        return sorted(entries.items(), key=lambda item: item[0])
    normalised = []
    for item in entries:
        if isinstance(item, dict):
            normalised.append((item.get("class"), item.get("value")))
        else:
            normalised.append((item[0], item[1]))
    return normalised


def split_case_lut_template(module, class_bits, entries, input_width=16, output_width=16):
    """Return a class-based LUT skeleton for unknown functions."""
    _check_positive_int("class_bits", class_bits)
    _check_positive_int("input_width", input_width)
    _check_positive_int("output_width", output_width)
    if class_bits > input_width:
        raise ValueError("class_bits cannot exceed input_width")

    select_expr = "in[{0}:{1}]".format(input_width - 1, input_width - class_bits)
    lines = _module_header(module, input_width, output_width)
    lines.extend(
        [
            "  reg {0} y;".format(_range(output_width)),
            "",
            "  always @* begin",
            "    case ({0})".format(select_expr),
        ]
    )
    for class_value, output_value in _normalise_entries(entries):
        lines.append(
            "      {0}: y = {1};".format(
                _const(class_bits, class_value),
                _const(output_width, output_value),
            )
        )
    lines.extend(
        [
            "      default: y = {0};".format(_zero(output_width)),
            "    endcase",
            "  end",
            "",
            "  assign out = y;",
            "endmodule",
            "",
        ]
    )
    return "\n".join(lines)
