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
strash; balance; rewrite; rewrite -z; balance
strash; refactor; rewrite; balance
strash; resub; rewrite; balance
strash; dc2
strash; dch -f
resyn2
```

Use after nearly every non-ABC tool as cleanup.

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

## 12. Suggested Implementation Order

1. Fix ABC/evaluate environment.
2. Create baseline result table.
3. Implement candidate manager and CEC/ADP measurement.
4. Implement ABC-only portfolio.
5. Implement ABC + MockTurtle + ABC flow.
6. Implement ABC + CULS + ABC flow.
7. Implement E-Syn seed generation + ABC cleanup.
8. Implement selected hybrid flows with budget controls.
9. Attack `ex255-ex279` with AI-generated Verilog seeds.
10. Attack `ex240-ex254`, then BF16/FP16 groups.
11. Attack unknown group with split/decision-graph methods.
12. Run full 100-case pipeline.
13. Produce final result table and report material.

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
