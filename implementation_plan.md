# ALS Final Project Implementation Plan

This plan is based on `README.md`, `introduction.md`, the project transcript notes, and our discussion. The goal is to build a reproducible AI-assisted AIG optimization pipeline for `ex200` to `ex299`.

## 0. Final Objective

For every benchmark:

```text
benchmarks/exNNN.truth -> output/exNNN.aig
```

The submitted AIG must be functionally equivalent to the truth table and should minimize:

```text
ADP = area * delay
```

where:

- area = ABC-reported AND node count
- delay = ABC-reported AIG level

All generated results must be reproducible from files under `student/`.

## 1. Project Ground Rules

1. Correctness is mandatory.
   - Any non-equivalent AIG gets zero for that case.
   - Every candidate must pass CEC before it can be considered.

2. The final judge is local ADP measurement.
   - Do not trust a tool's internal ranking.
   - Always measure candidates using the same metric as `evaluate.py`.

3. Keep source and method records.
   - Put reproducible scripts under `student/`.
   - Record AI prompts in `prompt_log.md`.
   - Record experiments in `experiments.md` or `results/candidate_history.csv`.

4. The optimization should be portfolio-based.
   - No single tool is expected to dominate every case.
   - ABC, ABC9, MockTurtle, CULS, E-Syn, Yosys, and custom generators should be treated as candidate producers.

## 2. Environment Bring-Up

Success criteria:

```bash
python3 student/optimizer.py --case ex200
python3 evaluate.py --case ex200
```

works on the chosen machine.

Tasks:

1. Ensure `student/abc` is executable and compatible with the runtime environment.
2. Install or build Yosys.
3. Install or build Icarus Verilog or another Verilog simulator for RTL exhaustive simulation.
4. Build or obtain MockTurtle runner.
5. Build or obtain CULS runner.
   - If CULS requires GPU, record GPU/server requirements.
6. Clone/build E-Syn as an optional backend seed generator.
7. Create `results/` and `work/` directories for generated logs and temporary candidates.

## 3. Baseline Reproduction

Run the provided baseline:

```bash
python3 student/optimizer.py
python3 evaluate.py
```

Record:

```text
case,source,area,delay,adp,status
ex200,abc_truth_strash,...
```

Baseline source:

```text
read_truth -xf <truth>; st; write_aiger -s <output>
```

Purpose:

- Prove the environment works.
- Establish starting ADP for all 100 cases.
- Identify the largest gaps versus `reference_result.csv`.

## 4. Candidate Management System

Before adding many tools, implement a candidate manager.

Suggested files:

```text
student/run_pipeline.py
student/common/abc.py
student/common/candidate.py
student/backends/abc_flow.py
student/backends/abc9_flow.py
student/backends/mockturtle_flow.py
student/backends/culs_flow.py
student/backends/esyn_flow.py
student/frontends/verilog_flow.py
```

Each candidate should store:

```text
case
candidate_id
parent_id
source
tool_chain
aig_path
area
delay
adp
equivalent
runtime
notes
```

Every candidate must go through:

```text
candidate.aig
-> CEC against benchmark truth table
-> ABC ps measurement
-> candidate_history.csv
```

## 5. Seed Generation

Seeds are the starting points of backend search.

### 5.1 Truth-Table Baseline Seed

For every case:

```text
read_truth -xf benchmarks/exNNN.truth; st; write_aiger seed.aig
```

This guarantees a valid seed, but usually has poor area/delay.

### 5.2 AI-Reconstructed Verilog Seed

Flow:

```text
truth table
-> AI reverse engineering
-> structured Verilog
-> exhaustive simulation against truth table
-> Yosys/ABC synthesis
-> seed.aig
```

This is expected to give the biggest improvements.

### 5.3 Case-Specific Generator Seed

Use when the function is recognized:

- multiplication
- division
- square
- integer square root
- BF16/FP16 unary function
- float conversion
- fp8 add

The generator may produce Verilog, EQN, or direct AIG.

### 5.4 E-Syn Seed

E-Syn should not be treated as a final solution.

Correct role:

```text
existing AIG
-> ABC write_eqn
-> E-Syn e-graph rewrite
-> optimized_circuit*.eqn
-> ABC read_eqn + strash
-> E-Syn-generated seed AIGs
```

Then those seeds should be passed to ABC, ABC9, MockTurtle, and CULS.

## 6. Backend Optimization Model

Backend optimization should be a budgeted portfolio search, not a fixed sequence.

Use a candidate pool:

```text
pool = initial seeds
```

For each round:

```text
new_candidates = []

for cand in pool:
    run cheap single-tool flows
    run selected hybrid flows
    verify and measure all outputs

pool = selected candidates for next round
```

Selection policy:

```text
keep top K by ADP
keep a few lowest-area candidates
keep a few lowest-delay candidates
keep a small number of diverse candidates within an ADP threshold
discard CEC failures
deduplicate equivalent files or identical metrics where possible
```

Reason:

- Final score uses ADP.
- But low-area or low-delay extreme points can become good ADP candidates after another tool rewrites them.
- Do not drop all temporarily worse candidates too early.

## 7. Budgeted Hybrid Search

There are many possible hybrid flows. Do not run every permutation.

Bad approach:

```text
run all tool combinations for all candidates every round
```

This explodes quickly.

Also incomplete approach:

```text
run ABC until no improvement
then run MockTurtle until no improvement
then run CULS until no improvement
```

This can miss cases where a tool temporarily worsens metrics but creates a structure another tool can improve.

Recommended approach:

### 7.1 Cheap Exploration Stage

Run short flows on more candidates:

```text
ABC-short
ABC9-short
MockTurtle-short -> ABC-cleanup
CULS-short -> ABC-cleanup
E-Syn-seed -> ABC-cleanup
```

Purpose:

- quickly test whether a candidate is promising
- identify which tool families work for each case

### 7.2 Focused Investment Stage

Run longer hybrid flows only on top candidates:

```text
ABC -> MockTurtle -> ABC-cleanup
ABC -> CULS -> ABC-cleanup
MockTurtle -> CULS -> ABC-cleanup
CULS -> MockTurtle -> ABC-cleanup
E-Syn -> ABC -> MockTurtle -> ABC-cleanup
E-Syn -> ABC -> CULS -> ABC-cleanup
ABC -> E-Syn -> ABC -> CULS -> ABC-cleanup
```

### 7.3 Early Stop Within a Tool

For a repeated single-tool sequence:

```text
stop if M consecutive passes do not improve area, delay, or ADP
```

But still allow the last candidate to be passed to another tool.

Important:

```text
"ABC cannot improve it" does not mean "MockTurtle/CULS/E-Syn cannot make it useful."
```

## 8. Tool Roles

### 8.1 ABC

Primary AIG cleanup and local optimization tool.

Candidate commands:

```text
abc_bal_rw       = balance; rewrite; rewrite -z; balance
abc_resyn        = balance; rewrite; rewrite -z; balance; rewrite -z; balance
abc_resyn2       = balance; rewrite; refactor; balance; rewrite; rewrite -z; balance; refactor -z; rewrite -z; balance
abc_resyn2a      = balance; rewrite; balance; rewrite; rewrite -z; balance; rewrite -z; balance
abc_resyn3       = balance; resub; resub -K 6; balance; resub -z; resub -z -K 6; balance; resub -z -K 5; balance
abc_compress2    = balance -l; rewrite -l; refactor -l; balance -l; rewrite -l; rewrite -z -l; balance -l; refactor -z -l; rewrite -z -l; balance -l
abc_resyn2rs     = resyn2-style flow interleaved with resubstitution at K=6,8,10,12
abc_compress2rs  = level-preserving compress2-style flow interleaved with resubstitution
abc_dc2          = strash; dc2; balance
abc_dch          = strash; dch; balance
abc_dc2_dch      = strash; dc2; dch; balance
abc_dch_dc2      = strash; dch; dc2; balance
abc_dc2_rw       = strash; dc2; balance; rewrite; rewrite -z; balance
abc_dch_rw       = strash; dch; balance; rewrite; rewrite -z; balance
abc_src_rw       = IWLS-style rewrite-only script
abc_src_rws      = IWLS-style rewrite/resubstitution script
abc_delay_try    = strash; dc2; if -K 6; strash; balance; rewrite -z; balance
```

Use after nearly every non-ABC tool as cleanup.

Initial survey result: on `ex200-ex209`, `abc_dc2_dch` and `abc_dch_dc2`
dominated the traditional `resyn2` family for ADP, so they should be part of
the default cheap ABC portfolio.

### 8.2 ABC9

Alternative ABC optimization family.

Use as portfolio component, especially for level-oriented candidates.

Typical pattern:

```text
read candidate.aig
&get
&dch / &if / &nf style passes
&put
ABC cleanup
write_aiger
```

Exact command recipes should be explored empirically.

### 8.3 MockTurtle

Alternative logic-network optimizer.

Useful passes from `introduction.md`:

- cut rewriting
- window rewriting
- refactoring
- resubstitution
- simulation-guided resubstitution

Role:

```text
ABC local optimum
-> MockTurtle changes structure
-> ABC may optimize further
```

Do not judge MockTurtle only by immediate ADP change. Judge after ABC cleanup.

### 8.4 CULS

GPU-accelerated logic synthesis backend.

Useful operations from `introduction.md`:

- rewriting
- refactoring
- resubstitution
- balancing
- strashing

Role:

```text
large or hard AIG
-> CULS quickly tries many local transformations
-> ABC cleanup
```

Good hybrid positions:

```text
ABC -> CULS -> ABC
MockTurtle -> CULS -> ABC
E-Syn -> ABC -> CULS -> ABC
CULS -> MockTurtle -> ABC
```

Record hardware requirements and runtime because CULS may depend on GPU availability.

### 8.5 E-Syn

E-Syn is a representation-changing seed generator.

Role:

```text
AIG/EQN -> e-graph rewrite -> multiple EQN candidates -> AIG seeds
```

Then:

```text
E-Syn seed -> ABC / MockTurtle / CULS / ABC9
```

Do not treat:

```text
E-Syn output -> final answer
```

as the main strategy.

## 9. Frontend Reverse Engineering by Case Group

### 9.1 `ex255-ex279`: Integer Arithmetic

Attack first.

Likely structures:

- unsigned multiplication
- signed multiplication
- unsigned division
- square
- integer square root

Implementation ideas:

- direct Verilog arithmetic
- multiplier decomposition
- restoring sqrt
- divide-by-zero saturation
- shared partial products for square

These are expected to be easier to verify exactly.

### 9.2 `ex240-ex254`: Float Conversion and FP8 Add

High payoff group.

Focus:

- format decoding
- special value handling
- rounding
- overflow/underflow
- conversion simplification

### 9.3 `ex200-ex219`: BF16 Unary Functions

BF16 has 7-bit mantissa.

Use:

- sign/exponent/mantissa split
- exponent range classification
- small mantissa LUT
- RNE rounding
- canonical NaN
- DAZ/FTZ assumptions

### 9.4 `ex220-ex239`: FP16 Unary Functions

FP16 has 10-bit mantissa.

Use:

- sign/exponent groups
- constant/zero/inf/passthrough regions
- local mantissa tables only where needed

### 9.5 `ex280-ex299`: Unknown Functions

Do not require full semantic naming.

Try:

- input high/low-bit grouping
- class-based factoring
- rotation canonical form
- split RTL
- decision graph decomposition
- output-bit-wise analysis
- symmetry detection

Goal:

```text
find a synthesis-friendly representation even without knowing the exact high-level function name
```

## 10. Verification Strategy

Use two levels of verification.

### 10.1 RTL Verification

For AI-generated Verilog:

```text
exhaustively simulate all inputs
compare against benchmark truth table
```

This is feasible because input width is small enough for exhaustive enumeration in this project.

### 10.2 AIG Verification

For every final or candidate AIG:

```text
read_truth -xf benchmarks/exNNN.truth; st; &get; &cec -t candidate.aig
```

Only equivalent candidates enter measurement and selection.

## 11. Critical Details from `introduction.md`

These should be explicitly handled in implementation:

1. Truth table indexing and Verilog input order must match exactly.
2. Floating-point RNE rounding carry must propagate into exponent.
3. NaN, inf, zero, and subnormal cases must be treated explicitly.
4. DAZ and FTZ assumptions should be documented.
5. BF16 is LUT-friendly due to 7-bit mantissa.
6. FP16 should be split by exponent to avoid huge full tables.
7. Odd functions can use sign symmetry.
8. Unknown functions can still be optimized through split/canonical structures.
9. Backend tools should be interleaved because one tool's local optimum can be another tool's starting point.
10. Keep Pareto-like diversity, not only the current best ADP, during search.

## 12. Current Detailed Execution Plan

This is the active implementation plan after the initial tool bring-up, baseline
generation, candidate manager, and ABC-flow survey.

### 12.1 Stage 1: Tool Validation and Wrappers

Goal:

```text
Every synthesis or verification tool should be callable from the project
pipeline with a clear input format, output format, timeout behavior, and
verification path.
```

Tools to validate and wrap:

- ABC
  - Input/output: AIG -> AIG.
  - Current status: working through `student/abc`.
  - Existing wrapper: `student/common/abc.py`.
  - Current flows: `abc_all` portfolio in `student/backends/abc_flow.py`.
  - Verification: CEC against `benchmarks/exNNN.truth`, then ABC `ps`.

- ABC9
  - Input/output: AIG -> AIG.
  - Role: alternative ABC optimization family, especially for low-level
    candidates.
  - Needed file: `student/backends/abc9_flow.py`.
  - First smoke target: `ex200` from baseline and from best ABC candidate.

- CULS
  - Input/output: AIG -> AIG.
  - Current status: built as `student/tools/culs/build/gpuls`.
  - Constraint: requires non-sandbox GPU access.
  - Needed file: `student/backends/culs_flow.py`.
  - First smoke command class: `read input.aig; resyn2; write output.aig`.

- MockTurtle
  - Input/output target: AIG -> AIG.
  - Current status: library/examples built, but no project-specific runner yet.
  - Needed work: write a small C++ AIG-in/AIG-out runner or identify a built
    example that can be adapted.
  - Needed file: `student/backends/mockturtle_flow.py`.

- E-Syn
  - Role: representation-changing seed generator, not final solver.
  - Target flow:

```text
AIG -> ABC write_eqn -> E-Syn rewrite -> EQN candidates -> ABC read_eqn/st -> AIG seeds
```

  - Needed file: `student/backends/esyn_flow.py`.

- Yosys
  - Input/output: Verilog -> AIG.
  - Current status: installed in `student/tools/conda-env/bin/yosys`.
  - Needed file: `student/frontends/yosys_synth.py`.

- RTL simulator / exhaustive verifier
  - Input/output: Verilog + truth table -> pass/fail + mismatch examples.
  - Use direct Python evaluation for generated templates where possible, and
    use a Verilog simulator/Yosys simulation path when needed.
  - Needed file: `student/frontends/sim_verify.py`.

Success criteria:

```text
For each tool wrapper:
1. generate one candidate from ex200
2. run CEC
3. measure area/delay/ADP
4. append candidate metadata to candidate_history.csv
5. leave output/ untouched
```

### 12.2 Stage 2: Unified Candidate Pipeline

Goal:

```text
Every seed and every backend output goes through the same CEC, ADP measurement,
history logging, and best-candidate selection path.
```

Core files:

```text
student/run_pipeline.py
student/common/abc.py
student/common/candidate.py
student/backends/*.py
student/frontends/*.py
```

Canonical candidate metadata:

```text
case
candidate_id
parent_id
source
tool_chain
aig_path
area
delay
adp
equivalent
runtime_sec
notes
```

Result files:

```text
student/results/candidate_history.csv
```

Full append-only history. Every generated candidate gets one row.

```text
student/results/best_candidates.csv
```

One current best candidate per case. This is the index used later to produce
submission outputs.

```text
student/results/<experiment>_summary.csv
```

One summary per experiment, for example `abc_all_summary.csv`.

Required behavior:

- Candidate generation must never write directly to `output/`.
- Non-equivalent candidates remain in history but are excluded from best
  selection.
- Candidate lineage must be preserved by `parent_id`.
- The pipeline should eventually support `--case`, `--cases ex200-ex209`, and
  `--all`.

### 12.3 Stage 3: ABC-Only Portfolio

Goal:

```text
Run the strongest cheap ABC flows on all cases to establish the first improved
baseline and prove the pipeline can handle multi-flow, multi-case experiments.
```

Current default portfolio:

```text
abc_resyn
abc_resyn2
abc_resyn2a
abc_resyn3
abc_compress2
abc_resyn2rs
abc_compress2rs
abc_dc2
abc_dch
abc_dc2_dch
abc_dch_dc2
abc_dc2_rw
abc_dch_rw
abc_src_rw
abc_src_rws
abc_delay_try
```

Initial survey result:

```text
ex200-ex209:
baseline total ADP = 20956264
abc_all best total ADP = 6422868
improvement = 69.35%
```

Dominant flows in the survey:

```text
abc_dc2_dch
abc_dch_dc2
```

Next implementation tasks:

1. Add batch case support to `student/run_pipeline.py`.
2. Generate `student/results/abc_all_summary.csv`.
3. Generate `student/results/best_candidates.csv`.
4. Copy ABC-only best AIGs to:

```text
student/work/best/abc_all/exNNN.aig
```

5. Run `abc_all` over all `ex200-ex299`.

Success criteria:

```text
100/100 equivalent ABC-only best candidates.
No writes to output/.
Summary identifies weak cases that need frontend reconstruction.
```

### 12.4 Stage 4: Truth Table to Verilog Reverse Engineering

This is the most important stage. It is mandatory for every case, not an
optional case-specific trick.

Goal:

```text
For each truth table, recover a synthesis-friendly high-level Verilog
description or at least a structured Verilog decomposition that is smaller than
direct truth-table expansion.
```

Frontend files:

```text
student/frontends/truth.py
student/frontends/analyze_truth.py
student/frontends/verilog_templates.py
student/frontends/sim_verify.py
student/frontends/yosys_synth.py
student/frontends/reverse_engineer.py
```

File roles:

- `truth.py`
  - Parse truth table files.
  - Recover input index order and output bit order.
  - Provide `input -> output_word` lookup for exhaustive checking.

- `analyze_truth.py`
  - Run structural probes to help infer function type.
  - Check symmetry, exponent regions, constants, passthrough regions,
    arithmetic hypotheses, split dependencies, and class structure.

- `verilog_templates.py`
  - Generate candidate Verilog from reusable templates.
  - Templates include BF16/FP16 unary, float conversion, fp8 add, integer
    arithmetic, LUT-by-exponent, class split, and decision-graph style RTL.

- `sim_verify.py`
  - Exhaustively verify AI-generated Verilog against the truth table.
  - Save mismatch examples when a candidate fails.

- `yosys_synth.py`
  - Convert verified Verilog into AIG seed candidates.
  - Feed generated AIGs into the unified candidate pipeline.

- `reverse_engineer.py`
  - Orchestrate analysis, AI prompting/manual hypotheses, Verilog generation,
    simulation, synthesis, and candidate registration.

Case groups from `introduction.md`:

```text
ex200-ex219: BF16 unary functions
ex220-ex239: FP16 unary functions
ex240-ex254: float conversion and fp8 add
ex255-ex279: integer arithmetic
ex280-ex299: unnamed but structured functions
```

#### BF16 Unary Functions: ex200-ex219

Likely functions:

```text
exp, log, sin, tan, sqrt, reciprocal, cube root, sigmoid
```

Probe strategy:

- Interpret input as BF16:

```text
sign | exponent[7:0] | mantissa[6:0]
```

- Check sign symmetry:
  - odd symmetry suggests `sin` or `tan`.
  - negative-domain NaN/constant behavior suggests `sqrt` or `log`.
- Check exponent regions:
  - zero/subnormal behavior
  - saturation to inf/constant
  - passthrough regions
  - canonical NaN handling
- Use 128-entry mantissa tables where needed.
- Ensure RNE carry can propagate into exponent.

Verilog shape:

```text
classify sign/exponent/special values
case by exponent range
small mantissa LUT
round and repack BF16
```

#### FP16 Unary Functions: ex220-ex239

Format:

```text
sign | exponent[4:0] | mantissa[9:0]
```

Probe strategy:

- Split by sign and exponent before considering mantissa tables.
- Identify exponent regions that are constant, zero, inf, passthrough, or
  sign-only.
- Use local mantissa tables only for the few regions that need them.
- Avoid a full 16-bit truth-table RTL.

Verilog shape:

```text
case exponent
  special/constant/passthrough regions
  local 1024-entry or reduced mantissa table only when necessary
round and repack FP16
```

#### Float Conversion and FP8 Add: ex240-ex254

Likely functions:

```text
BF16/FP16/FP8 conversion
float-to-int
int-to-float
fp8 add
rounding/saturation/conversion helpers
```

Probe strategy:

- Check whether sign is preserved.
- Check exponent bias shifts.
- Check mantissa truncation, zero extension, and RNE rounding.
- Check overflow/underflow/saturation behavior.
- For fp8 add, split input into two 8-bit operands and test:

```text
a = in[15:8], b = in[7:0]
a = in[7:0],  b = in[15:8]
```

Verilog shape:

```text
decode input format
handle NaN/inf/zero/subnormal
align/convert exponent and mantissa
round
pack output
```

#### Integer Arithmetic: ex255-ex279

Likely functions:

```text
unsigned multiplication
signed multiplication
unsigned division
square
integer square root
```

Probe strategy:

- Try input splits:

```text
a = in[7:0],  b = in[15:8]
a = in[15:8], b = in[7:0]
x = in[15:0]
```

- Compare truth output against:
  - `a * b`
  - signed `a * b`
  - `a / b`
  - `a % b`
  - `x * x`
  - `isqrt(x)`
- For division, infer divide-by-zero behavior:
  - zero
  - max value
  - input passthrough
  - fixed saturation

Verilog shape:

```text
word-level arithmetic expression
restoring sqrt implementation
explicit divide-by-zero policy
```

#### Unknown Structured Functions: ex280-ex299

Goal:

```text
Recover a synthesis-friendly decomposition even if the function cannot be
named semantically.
```

Probe strategy:

- Split input by high bits, low bits, byte, nibble, or class bits.
- Search for class-based factoring:

```text
class = f(high bits)
payload = low bits
output = g_class(payload)
```

- Search for rotation/canonical forms.
- Search for output-bit dependency sets.
- Detect constants, passthrough bits, permutations, reversals, and rotations.
- Generate split RTL or decision-graph-like RTL.

Verilog shape:

```text
classify input
case class
  constant output
  passthrough/permute/rotate output
  small LUT or simple expression over payload
```

Success criteria for Stage 4:

```text
Every case has at least one reverse-engineering attempt record.
Verified Verilog seeds must pass exhaustive simulation.
Synthesized AIG seeds must pass CEC.
Only then can they enter backend optimization.
```

### 12.5 Stage 5: AI Verilog Seed Generation for Every Case

Goal:

```text
Every case should get at least one AI-assisted Verilog seed attempt.
```

Per-case workspace:

```text
student/work/reverse/exNNN/
  attempts/
  verified_verilog/
  synthesized_aigs/
  notes.md
```

For each case, record:

- input/output width and bit order assumptions
- function hypotheses
- prompts or AI reasoning summaries
- generated Verilog candidates
- simulation status
- mismatch examples for failures
- Yosys synthesis result
- AIG ADP compared to current best

Priority order for first implementation:

1. `ex255-ex279` integer arithmetic
   - easiest to probe automatically
   - word-level Verilog should be much better than truth expansion
2. `ex240-ex254` float conversion / fp8 add
   - highest expected area improvement
3. `ex200-ex219` BF16 unary
   - mantissa tables are small
4. `ex220-ex239` FP16 unary
   - requires exponent splitting to avoid huge tables
5. `ex280-ex299` unknown structured
   - split/decision-graph approach

### 12.6 Stage 6: Case-by-Case Backend Optimization

Goal:

```text
Find the best equivalent AIG for each individual case, not one fixed flow that
is applied blindly to all cases.
```

Important rule:

```text
The winning strategy may be different for every exNNN.
```

Per-case pool:

```text
truth-table baseline seed
ABC-only best seed
AI Verilog/Yosys seed(s)
E-Syn seed(s)
CULS transformed seed(s)
MockTurtle transformed seed(s)
ABC9 transformed seed(s)
```

Optimization loop per case:

```text
for each case:
    collect all valid seeds
    run cheap probes across available tools
    keep top ADP, low-area, low-delay, and diverse candidates
    invest more runtime only in tool chains that help this case
    stop when no candidate improves or budget is exhausted
    write best candidate for this case
```

Examples:

- If `ex200` responds well to `abc_dc2_dch`, use that as a backend starting
  point and try CULS/ABC9/MockTurtle around it.
- If `ex255` is identified as arithmetic, prioritize the arithmetic Verilog
  seed and then run ABC/CULS cleanup.
- If `ex252` is a conversion case with a very compact Verilog seed, use that
  as the main seed and avoid wasting time on baseline-derived AIGs.
- If `ex299` remains unnamed, use split RTL and decision-graph candidates, then
  search backend variants case-by-case.

Selection policy:

- final ranking is by ADP
- preserve a few low-area and low-delay candidates because another backend may
  improve them later
- discard non-equivalent candidates from best selection
- do not assume a globally good flow is best for every case

Final output generation:

```text
student/results/best_candidates.csv
-> copy best equivalent AIG for each case
-> output/ex200.aig ... output/ex299.aig
-> python3 evaluate.py
```

### 12.7 Immediate Next Steps

1. Commit the current ABC survey and plan update.
2. Add batch support and summary CSV generation to `student/run_pipeline.py`.
3. Run full `abc_all` over `ex200-ex299`.
4. Implement `truth.py` and verify truth-table indexing against ABC.
5. Implement `sim_verify.py` and `yosys_synth.py`.
6. Start reverse engineering with `ex255-ex279`, then `ex240-ex254`.

## 13. Report Storyline

The final report should present:

```text
AI-assisted multi-seed, multi-backend portfolio synthesis
```

Key claims:

- AI was used to reverse engineer truth-table functions.
- AI was used to generate structured Verilog and helper scripts.
- Yosys/ABC converted structured descriptions to AIG.
- ABC, ABC9, MockTurtle, CULS, and E-Syn were used as interleaved candidate transformers.
- E-Syn was used as a representation-changing seed generator, not as a standalone final solver.
- Every candidate was checked by CEC.
- Final selection was based on measured ADP.

Required artifacts:

```text
output/ex200.aig ... output/ex299.aig
student/ reproducible source code
results/final_results.csv
results/candidate_history.csv
prompt_log.md
report.pdf
```
