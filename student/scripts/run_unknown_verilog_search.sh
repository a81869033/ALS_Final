#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
cd "$ROOT"

TS="${1:-$(date +%Y%m%d_%H%M%S)}"
CASES="${CASES:-ex280-ex299}"
TIMEOUT="${TIMEOUT:-900}"
VARIANTS="${VARIANTS:-value_case,expr_default_exception,high_split_default,low_split_default,rotate_high_split_default,rotate_low_split_default,decision_tree_greedy}"

WORK_DIR="student/work/reverse_unknown_${TS}"
RESULTS="student/results/unknown_verilog_${TS}.csv"
BEST_RESULTS="student/results/unknown_verilog_${TS}_best.csv"
SUMMARY="student/results/unknown_verilog_${TS}_summary.csv"
CHECK_RESULTS="student/results/unknown_verilog_${TS}_eval_check.csv"
EMIT_RESULTS="student/results/unknown_verilog_${TS}_emit.csv"
EMIT_BEST="student/results/unknown_verilog_${TS}_emit_best.csv"
BEST_DIR="student/work/best/unknown_verilog_${TS}"
TMP_DIR="student/work/eval/unknown_verilog_${TS}"
LOG="student/results/logs/unknown_verilog_${TS}.log"

mkdir -p student/results/logs student/run_pids

{
  echo "[unknown-verilog] start $(date '+%Y-%m-%d %H:%M:%S %z')"
  echo "[unknown-verilog] cases=$CASES"
  echo "[unknown-verilog] variants=$VARIANTS"
  echo "[unknown-verilog] timeout=$TIMEOUT"
  echo "[unknown-verilog] work_dir=$WORK_DIR"
  echo "[unknown-verilog] results=$RESULTS"

  echo "[unknown-verilog] emitting Verilog variants"
  python3 -u student/generators/unknown_verilog_search.py \
    --cases "$CASES" \
    --variants "$VARIANTS" \
    --work-dir "$WORK_DIR" \
    --results "$EMIT_RESULTS" \
    --best-results "$EMIT_BEST" \
    --timeout "$TIMEOUT" \
    --emit-only

  echo "[unknown-verilog] synthesizing and checking candidates"
  set +e
  python3 -u student/generators/unknown_verilog_search.py \
    --cases "$CASES" \
    --variants "$VARIANTS" \
    --work-dir "$WORK_DIR" \
    --results "$RESULTS" \
    --best-results "$BEST_RESULTS" \
    --timeout "$TIMEOUT"
  SYNTH_STATUS=$?
  set -e
  echo "[unknown-verilog] synth_status=$SYNTH_STATUS"

  echo "[unknown-verilog] collecting summary from manifests"
  python3 -u student/scripts/collect_bf16_deep_results.py \
    --work-dir "$WORK_DIR" \
    --results "$RESULTS" \
    --best-results "$BEST_RESULTS" \
    --summary "$SUMMARY"

  echo "[unknown-verilog] re-running official evaluate.py for equivalent candidates"
  set +e
  python3 -u student/scripts/verify_variant_csv.py \
    --results "$RESULTS" \
    --best-results "$BEST_RESULTS" \
    --check-results "$CHECK_RESULTS" \
    --best-dir "$BEST_DIR" \
    --tmp-dir "$TMP_DIR" \
    --timeout "$TIMEOUT"
  VERIFY_STATUS=$?
  set -e
  echo "[unknown-verilog] verify_status=$VERIFY_STATUS"

  echo "[unknown-verilog] done $(date '+%Y-%m-%d %H:%M:%S %z')"
  echo "[unknown-verilog] results=$RESULTS"
  echo "[unknown-verilog] best=$BEST_RESULTS"
  echo "[unknown-verilog] summary=$SUMMARY"
  echo "[unknown-verilog] eval_check=$CHECK_RESULTS"
  echo "[unknown-verilog] best_dir=$BEST_DIR"
} 2>&1 | tee "$LOG"
