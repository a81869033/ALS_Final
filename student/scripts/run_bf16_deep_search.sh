#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
cd "$ROOT"

TS="${1:-$(date +%Y%m%d_%H%M%S)}"
CASES="${CASES:-ex200-ex219}"
TIMEOUT="${TIMEOUT:-900}"
VARIANTS="${VARIANTS:-value_case,sign_pair_case,exp_mant_pair_case,sign_exp_mant_case,split_sign_exp_mant_case,magnitude_range_pair,exp_mant_delta_pair,positive_default_exp_mant_case,positive_default_exp_mant_delta,default_expr_exception_case,sign_exp_default_expr_case}"

WORK_DIR="student/work/reverse_bf16_deep_${TS}"
RESULTS="student/results/bf16_deep_variants_${TS}.csv"
BEST_RESULTS="student/results/bf16_deep_variants_${TS}_best.csv"
SUMMARY="student/results/bf16_deep_variants_${TS}_summary.csv"
CHECK_RESULTS="student/results/bf16_deep_variants_${TS}_eval_check.csv"
EMIT_RESULTS="student/results/bf16_deep_variants_${TS}_emit.csv"
EMIT_BEST="student/results/bf16_deep_variants_${TS}_emit_best.csv"
BEST_DIR="student/work/best/bf16_deep_${TS}"
TMP_DIR="student/work/eval/bf16_deep_${TS}"
LOG="student/results/logs/bf16_deep_${TS}.log"

mkdir -p student/results/logs student/run_pids

{
  echo "[bf16-deep] start $(date '+%Y-%m-%d %H:%M:%S %z')"
  echo "[bf16-deep] cases=$CASES"
  echo "[bf16-deep] variants=$VARIANTS"
  echo "[bf16-deep] timeout=$TIMEOUT"
  echo "[bf16-deep] work_dir=$WORK_DIR"
  echo "[bf16-deep] results=$RESULTS"

  echo "[bf16-deep] emitting Verilog variants"
  python3 -u student/generators/bf16_verilog_search.py \
    --cases "$CASES" \
    --variants "$VARIANTS" \
    --work-dir "$WORK_DIR" \
    --results "$EMIT_RESULTS" \
    --best-results "$EMIT_BEST" \
    --timeout "$TIMEOUT" \
    --emit-only

  echo "[bf16-deep] synthesizing and checking candidates"
  python3 -u student/generators/bf16_verilog_search.py \
    --cases "$CASES" \
    --variants "$VARIANTS" \
    --work-dir "$WORK_DIR" \
    --results "$RESULTS" \
    --best-results "$BEST_RESULTS" \
    --timeout "$TIMEOUT"

  echo "[bf16-deep] collecting summary from manifests"
  python3 -u student/scripts/collect_bf16_deep_results.py \
    --work-dir "$WORK_DIR" \
    --results "$RESULTS" \
    --best-results "$BEST_RESULTS" \
    --summary "$SUMMARY"

  echo "[bf16-deep] re-running official evaluate.py for equivalent candidates"
  python3 -u student/scripts/verify_variant_csv.py \
    --results "$RESULTS" \
    --best-results "$BEST_RESULTS" \
    --check-results "$CHECK_RESULTS" \
    --best-dir "$BEST_DIR" \
    --tmp-dir "$TMP_DIR" \
    --timeout "$TIMEOUT"

  echo "[bf16-deep] done $(date '+%Y-%m-%d %H:%M:%S %z')"
  echo "[bf16-deep] results=$RESULTS"
  echo "[bf16-deep] best=$BEST_RESULTS"
  echo "[bf16-deep] summary=$SUMMARY"
  echo "[bf16-deep] eval_check=$CHECK_RESULTS"
  echo "[bf16-deep] best_dir=$BEST_DIR"
} 2>&1 | tee "$LOG"
