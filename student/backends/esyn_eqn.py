"""ABC EQN and E-Syn S-expression parsing helpers.

The bridge only needs ABC's small Boolean EQN surface and E-Syn's prefix
S-expression form.  This module keeps that contract explicit with a lightweight
AST shared by both parsers.
"""

from collections import OrderedDict
import argparse
import os
from pathlib import Path
import subprocess
import sys
import tempfile


class EqnParseError(ValueError):
    """Raised when EQN or S-expression input is malformed."""


class Expr(object):
    """Base class for Boolean expression nodes."""

    def to_eqn(self):
        return format_eqn_expr(self)

    def to_sexpr(self):
        return eqn_expr_to_sexpr(self)


class Const(Expr):
    __slots__ = ("value",)

    def __init__(self, value):
        if value not in (0, 1, False, True):
            raise ValueError("Boolean constants must be 0 or 1.")
        self.value = 1 if bool(value) else 0

    def __eq__(self, other):
        return isinstance(other, Const) and self.value == other.value

    def __repr__(self):
        return "Const({0})".format(self.value)


class Ident(Expr):
    __slots__ = ("name",)

    def __init__(self, name):
        self.name = _validate_identifier(name)

    def __eq__(self, other):
        return isinstance(other, Ident) and self.name == other.name

    def __repr__(self):
        return "Ident({0!r})".format(self.name)


class Not(Expr):
    __slots__ = ("operand",)

    def __init__(self, operand):
        self.operand = _coerce_expr(operand)

    def __eq__(self, other):
        return isinstance(other, Not) and self.operand == other.operand

    def __repr__(self):
        return "Not({0!r})".format(self.operand)


class Binary(Expr):
    __slots__ = ("op", "left", "right")

    def __init__(self, op, left, right):
        if op not in ("and", "or"):
            raise ValueError("Binary operator must be 'and' or 'or'.")
        self.op = op
        self.left = _coerce_expr(left)
        self.right = _coerce_expr(right)

    def __eq__(self, other):
        return (
            isinstance(other, Binary)
            and self.op == other.op
            and self.left == other.left
            and self.right == other.right
        )

    def __repr__(self):
        return "Binary({0!r}, {1!r}, {2!r})".format(self.op, self.left, self.right)


class EqnAssignment(object):
    __slots__ = ("target", "expr")

    def __init__(self, target, expr):
        self.target = _validate_identifier(target)
        self.expr = _coerce_expr(expr)

    def __eq__(self, other):
        return (
            isinstance(other, EqnAssignment)
            and self.target == other.target
            and self.expr == other.expr
        )

    def __repr__(self):
        return "EqnAssignment({0!r}, {1!r})".format(self.target, self.expr)


class EqnCircuit(object):
    __slots__ = ("inorder", "outorder", "assignments")

    def __init__(self, inorder=None, outorder=None, assignments=None):
        self.inorder = [_validate_identifier(name) for name in (inorder or [])]
        self.outorder = [_validate_identifier(name) for name in (outorder or [])]
        self.assignments = [
            item if isinstance(item, EqnAssignment) else EqnAssignment(item[0], item[1])
            for item in (assignments or [])
        ]

    @property
    def assignments_by_name(self):
        result = OrderedDict()
        for assignment in self.assignments:
            result[assignment.target] = assignment.expr
        return result

    def __eq__(self, other):
        return (
            isinstance(other, EqnCircuit)
            and self.inorder == other.inorder
            and self.outorder == other.outorder
            and self.assignments == other.assignments
        )

    def __repr__(self):
        return "EqnCircuit({0!r}, {1!r}, {2!r})".format(
            self.inorder, self.outorder, self.assignments
        )


def get_output_expr(circuit, output_name):
    """Return the direct EQN expression assigned to an output name."""

    if output_name not in circuit.outorder:
        raise EqnParseError("Output is not listed in OUTORDER: {0}".format(output_name))
    assignments = circuit.assignments_by_name
    if output_name not in assignments:
        raise EqnParseError("Output has no assignment: {0}".format(output_name))
    return assignments[output_name]


def output_to_sexpr(circuit, output_name):
    """Convert one direct output assignment expression to E-Syn S-expression."""

    return eqn_expr_to_sexpr(get_output_expr(circuit, output_name))


def replace_output(circuit, output_name, replacement_expr):
    """Return a copy of circuit with one output assignment replaced."""

    if output_name not in circuit.outorder:
        raise EqnParseError("Output is not listed in OUTORDER: {0}".format(output_name))
    replacement_expr = _coerce_expr(replacement_expr)
    assignments = []
    replaced = False
    for assignment in circuit.assignments:
        if assignment.target == output_name:
            assignments.append(EqnAssignment(output_name, replacement_expr))
            replaced = True
        else:
            assignments.append(assignment)
    if not replaced:
        raise EqnParseError("Output has no assignment: {0}".format(output_name))
    return EqnCircuit(circuit.inorder, circuit.outorder, assignments)


def replace_output_from_sexpr(circuit, output_name, replacement_sexpr):
    """Return a copy of circuit with one output replaced by E-Syn S-expression."""

    return replace_output(circuit, output_name, sexpr_to_eqn_expr(replacement_sexpr))


_EQN_SPECIAL = set("=;#!*+()")
_EQN_EXPR_SPECIAL = set("!*+()")
_SEXPR_SPECIAL = set("()")
_PREC = {"or": 1, "and": 2, "not": 3, "atom": 4}
_OP_TO_EQN = {"and": "*", "or": "+"}
_OP_TO_SEXPR = {"and": "*", "or": "+"}
_SEXPR_TO_OP = {"*": "and", "+": "or"}


def _coerce_expr(expr):
    if isinstance(expr, Expr):
        return expr
    if isinstance(expr, str):
        return parse_eqn_expr(expr)
    raise TypeError("Expected an Expr or EQN expression string.")


def _validate_identifier(name):
    if not isinstance(name, str):
        raise TypeError("Identifier names must be strings.")
    if not name:
        raise EqnParseError("Empty identifier.")
    for char in name:
        if char.isspace() or char in _EQN_SPECIAL:
            raise EqnParseError("Invalid EQN identifier: {0!r}".format(name))
    if name in ("0", "1"):
        raise EqnParseError("Constants 0/1 cannot be used as identifiers.")
    return name


def _strip_eqn_comments(text):
    lines = []
    for line in text.splitlines():
        lines.append(line.split("#", 1)[0])
    return "\n".join(lines)


def _tokenize_eqn_expr(text):
    tokens = []
    index = 0
    while index < len(text):
        char = text[index]
        if char.isspace():
            index += 1
            continue
        if char in _EQN_EXPR_SPECIAL:
            tokens.append(char)
            index += 1
            continue
        start = index
        while index < len(text):
            char = text[index]
            if char.isspace() or char in _EQN_SPECIAL:
                break
            index += 1
        if start == index:
            raise EqnParseError("Unexpected character in EQN expression: {0!r}".format(char))
        tokens.append(text[start:index])
    return tokens


class _EqnExprParser(object):
    def __init__(self, text):
        self.tokens = _tokenize_eqn_expr(text)
        self.index = 0

    def parse(self):
        if not self.tokens:
            raise EqnParseError("Empty EQN expression.")
        expr = self._parse_or()
        if self._peek() is not None:
            raise EqnParseError("Unexpected EQN token: {0!r}".format(self._peek()))
        return expr

    def _peek(self):
        if self.index >= len(self.tokens):
            return None
        return self.tokens[self.index]

    def _take(self):
        token = self._peek()
        if token is None:
            raise EqnParseError("Unexpected end of EQN expression.")
        self.index += 1
        return token

    def _accept(self, token):
        if self._peek() == token:
            self.index += 1
            return True
        return False

    def _expect(self, token):
        actual = self._take()
        if actual != token:
            raise EqnParseError("Expected {0!r}, got {1!r}.".format(token, actual))

    def _parse_or(self):
        expr = self._parse_and()
        while self._accept("+"):
            expr = Binary("or", expr, self._parse_and())
        return expr

    def _parse_and(self):
        expr = self._parse_not()
        while self._accept("*"):
            expr = Binary("and", expr, self._parse_not())
        return expr

    def _parse_not(self):
        if self._accept("!"):
            return Not(self._parse_not())
        return self._parse_primary()

    def _parse_primary(self):
        if self._accept("("):
            expr = self._parse_or()
            self._expect(")")
            return expr
        token = self._take()
        if token in (")", "*", "+", "!"):
            raise EqnParseError("Unexpected EQN token: {0!r}".format(token))
        if token == "0":
            return Const(0)
        if token == "1":
            return Const(1)
        return Ident(token)


def parse_eqn_expr(text):
    """Parse one ABC EQN Boolean expression into an Expr AST."""

    return _EqnExprParser(text).parse()


def format_eqn_expr(expr):
    """Format an Expr AST as an ABC EQN Boolean expression."""

    return _format_eqn_expr(_coerce_expr(expr), 0)


def _format_eqn_expr(expr, parent_prec):
    if isinstance(expr, Const):
        return str(expr.value)
    if isinstance(expr, Ident):
        return expr.name
    if isinstance(expr, Not):
        text = "!" + _format_eqn_expr(expr.operand, _PREC["not"])
        if _PREC["not"] < parent_prec:
            return "({0})".format(text)
        return text
    if isinstance(expr, Binary):
        prec = _PREC[expr.op]
        left = _format_eqn_expr(expr.left, prec)
        right = _format_eqn_expr(expr.right, prec + 1)
        text = "{0} {1} {2}".format(left, _OP_TO_EQN[expr.op], right)
        if prec < parent_prec:
            return "({0})".format(text)
        return text
    raise TypeError("Unsupported expression node: {0!r}".format(expr))


def parse_eqn_text(text):
    """Parse an ABC EQN file body into an EqnCircuit."""

    clean_text = _strip_eqn_comments(text)
    inorder = None
    outorder = None
    assignments = []
    for raw_statement in clean_text.split(";"):
        statement = raw_statement.strip()
        if not statement:
            continue
        if "=" not in statement:
            raise EqnParseError("EQN statement is missing '=': {0!r}".format(statement))
        lhs, rhs = statement.split("=", 1)
        lhs = lhs.strip()
        rhs = rhs.strip()
        if not lhs:
            raise EqnParseError("EQN statement has an empty left-hand side.")
        if lhs == "INORDER":
            if inorder is not None:
                raise EqnParseError("Duplicate INORDER statement.")
            inorder = _parse_name_list(rhs)
        elif lhs == "OUTORDER":
            if outorder is not None:
                raise EqnParseError("Duplicate OUTORDER statement.")
            outorder = _parse_name_list(rhs)
        else:
            assignments.append(EqnAssignment(lhs, parse_eqn_expr(rhs)))
    return EqnCircuit(inorder or [], outorder or [], assignments)


def _parse_name_list(text):
    names = text.split()
    return [_validate_identifier(name) for name in names]


def format_eqn(circuit):
    """Format an EqnCircuit as ABC EQN text."""

    if not isinstance(circuit, EqnCircuit):
        raise TypeError("Expected EqnCircuit.")
    lines = ["# Equations generated by student.backends.esyn_eqn"]
    lines.append(_format_order_statement("INORDER", circuit.inorder))
    lines.append(_format_order_statement("OUTORDER", circuit.outorder))
    for assignment in circuit.assignments:
        lines.append("{0} = {1};".format(assignment.target, format_eqn_expr(assignment.expr)))
    return "\n".join(lines) + "\n"


def _format_order_statement(label, names):
    if names:
        return "{0} = {1};".format(label, " ".join(names))
    return "{0} =;".format(label)


def read_eqn_file(path):
    """Read an ABC EQN file and return an EqnCircuit."""

    return parse_eqn_text(Path(path).read_text(encoding="utf-8"))


def write_eqn_file(obj, path):
    """Write an EqnCircuit to an ABC EQN file."""

    path = Path(path)
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(format_eqn(obj), encoding="utf-8")
    return path


def _tokenize_sexpr(text):
    tokens = []
    index = 0
    while index < len(text):
        char = text[index]
        if char.isspace():
            index += 1
            continue
        if char in _SEXPR_SPECIAL:
            tokens.append(char)
            index += 1
            continue
        start = index
        while index < len(text):
            char = text[index]
            if char.isspace() or char in _SEXPR_SPECIAL:
                break
            index += 1
        tokens.append(text[start:index])
    return tokens


class _SexprParser(object):
    def __init__(self, text):
        self.tokens = _tokenize_sexpr(text)
        self.index = 0

    def parse(self):
        if not self.tokens:
            raise EqnParseError("Empty S-expression.")
        expr = self._parse_expr()
        if self._peek() is not None:
            raise EqnParseError("Unexpected S-expression token: {0!r}".format(self._peek()))
        return expr

    def _peek(self):
        if self.index >= len(self.tokens):
            return None
        return self.tokens[self.index]

    def _take(self):
        token = self._peek()
        if token is None:
            raise EqnParseError("Unexpected end of S-expression.")
        self.index += 1
        return token

    def _expect(self, token):
        actual = self._take()
        if actual != token:
            raise EqnParseError("Expected {0!r}, got {1!r}.".format(token, actual))

    def _parse_expr(self):
        token = self._take()
        if token == "(":
            op = self._take()
            if op == "!":
                expr = Not(self._parse_expr())
            elif op in _SEXPR_TO_OP:
                expr = Binary(_SEXPR_TO_OP[op], self._parse_expr(), self._parse_expr())
            else:
                raise EqnParseError("Unsupported S-expression operator: {0!r}".format(op))
            self._expect(")")
            return expr
        if token == ")":
            raise EqnParseError("Unexpected ')' in S-expression.")
        if token == "0":
            return Const(0)
        if token == "1":
            return Const(1)
        return Ident(token)


def sexpr_to_eqn_expr(text):
    """Parse an E-Syn S-expression into an Expr AST."""

    return _SexprParser(text).parse()


def eqn_expr_to_sexpr(expr):
    """Format an EQN Expr AST, or EQN expression string, as an E-Syn S-expression."""

    expr = _coerce_expr(expr)
    if isinstance(expr, Const):
        return str(expr.value)
    if isinstance(expr, Ident):
        return expr.name
    if isinstance(expr, Not):
        return "(! {0})".format(eqn_expr_to_sexpr(expr.operand))
    if isinstance(expr, Binary):
        return "({0} {1} {2})".format(
            _OP_TO_SEXPR[expr.op],
            eqn_expr_to_sexpr(expr.left),
            eqn_expr_to_sexpr(expr.right),
        )
    raise TypeError("Unsupported expression node: {0!r}".format(expr))


def abc_read_eqn_roundtrip(circuit, abc_path, timeout=30):
    """Validate that ABC can read, write, and re-read the formatted EQN."""

    if isinstance(circuit, EqnCircuit):
        eqn_text = format_eqn(circuit)
    elif isinstance(circuit, str):
        eqn_text = circuit
    else:
        raise TypeError("Expected EqnCircuit or EQN text.")
    with tempfile.TemporaryDirectory(prefix="esyn_eqn_") as temp_dir:
        temp_dir = Path(temp_dir)
        input_path = temp_dir / "input.eqn"
        output_path = temp_dir / "abc_out.eqn"
        input_path.write_text(eqn_text, encoding="utf-8")
        command = "read_eqn {0}; write_eqn {1}; read_eqn {1}; ps".format(input_path, output_path)
        result = subprocess.run(
            [str(abc_path), "-c", command],
            stdout=subprocess.PIPE,
            stderr=subprocess.STDOUT,
            universal_newlines=True,
            timeout=timeout,
        )
        output = result.stdout
        error_markers = (
            "** cmd error:",
            "Cannot open input file",
            "Cannot write",
            "Wrong input file format",
            "The parser has failed",
            "Error:",
        )
        if result.returncode != 0 or any(marker in output for marker in error_markers):
            raise RuntimeError(output.strip())
        if not output_path.is_file() or output_path.stat().st_size == 0:
            raise RuntimeError("ABC did not create a non-empty EQN output file.")
        return output


def _roundtrip_eqn_arg(value):
    path = Path(value)
    if path.is_file():
        text = path.read_text(encoding="utf-8")
    else:
        text = value
    circuit = parse_eqn_text(text)
    rendered = format_eqn(circuit)
    reparsed = parse_eqn_text(rendered)
    if circuit != reparsed:
        raise EqnParseError("EQN parse/print roundtrip changed the AST.")
    return circuit, rendered


def _default_abc_path():
    root = Path(__file__).resolve().parents[2]
    candidates = [
        root / "student" / "abc",
        root / "student" / "tools" / "abc" / "src" / "abc",
        root / "student" / "tools" / "conda-env" / "bin" / "yosys-abc",
    ]
    for candidate in candidates:
        if candidate.is_file() and os.access(str(candidate), os.X_OK):
            return candidate
    return None


def main(argv=None):
    parser = argparse.ArgumentParser(description=__doc__)
    group = parser.add_mutually_exclusive_group(required=True)
    group.add_argument("--expr", help="Parse one ABC EQN expression and print EQN/S-expression forms.")
    group.add_argument("--sexpr", help="Parse one E-Syn S-expression and print EQN/S-expression forms.")
    group.add_argument("--roundtrip", help="Roundtrip an EQN file path, or an inline EQN file body.")
    parser.add_argument("--abc", help="ABC binary for read_eqn/write_eqn validation.")
    args = parser.parse_args(argv)

    try:
        if args.expr is not None:
            expr = parse_eqn_expr(args.expr)
            sexpr = eqn_expr_to_sexpr(expr)
            sexpr_expr = sexpr_to_eqn_expr(sexpr)
            print("eqn: {0}".format(format_eqn_expr(expr)))
            print("sexpr: {0}".format(sexpr))
            print("sexpr_roundtrip_eqn: {0}".format(format_eqn_expr(sexpr_expr)))
            return 0

        if args.sexpr is not None:
            expr = sexpr_to_eqn_expr(args.sexpr)
            print("eqn: {0}".format(format_eqn_expr(expr)))
            print("sexpr: {0}".format(eqn_expr_to_sexpr(expr)))
            return 0

        circuit, rendered = _roundtrip_eqn_arg(args.roundtrip)
        sys.stdout.write(rendered)
        sys.stderr.write("parse_print_roundtrip: ok\n")
        abc = Path(args.abc) if args.abc else _default_abc_path()
        if abc is not None:
            abc_read_eqn_roundtrip(circuit, abc)
            sys.stderr.write("abc_read_eqn_roundtrip: ok ({0})\n".format(abc))
        elif args.abc:
            raise RuntimeError("ABC binary not found: {0}".format(args.abc))
        return 0
    except Exception as exc:
        sys.stderr.write("error: {0}\n".format(exc))
        return 1


if __name__ == "__main__":
    sys.exit(main())
