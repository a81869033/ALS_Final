#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
cd "$ROOT"

TS="${1:-$(date +%Y%m%d_%H%M%S)}"
CASES="${CASES:-ex200-ex219}"
TIMEOUT="${TIMEOUT:-900}"
VARIANTS="${VARIANTS:-semantic_field_reassembly,semantic_sign_exp_field_defaults,semantic_positive_symmetry_fields,semantic_positive_field_defaults,semantic_exp_delta_fields}"
DEDUPE_CURRENT="${DEDUPE_CURRENT:-student/results/bf16_candidates_current.csv}"

WORK_DIR="student/work/reverse_bf16_aggressive_semantic_${TS}"
RESULTS="student/results/bf16_aggressive_semantic_${TS}.csv"
BEST_RESULTS="student/results/bf16_aggressive_semantic_${TS}_best.csv"
SUMMARY="student/results/bf16_aggressive_semantic_${TS}_summary.csv"
CHECK_RESULTS="student/results/bf16_aggressive_semantic_${TS}_eval_check.csv"
EMIT_RESULTS="student/results/bf16_aggressive_semantic_${TS}_emit.csv"
EMIT_BEST="student/results/bf16_aggressive_semantic_${TS}_emit_best.csv"
BEST_DIR="student/work/best/bf16_aggressive_semantic_${TS}"
TMP_DIR="student/work/eval/bf16_aggressive_semantic_${TS}"
LOG="student/results/logs/bf16_aggressive_semantic_${TS}.log"

mkdir -p student/results/logs student/run_pids

{
  echo "[bf16-aggressive-semantic] start $(date '+%Y-%m-%d %H:%M:%S %z')"
  echo "[bf16-aggressive-semantic] cases=$CASES"
  echo "[bf16-aggressive-semantic] variants=$VARIANTS"
  echo "[bf16-aggressive-semantic] timeout=$TIMEOUT"
  echo "[bf16-aggressive-semantic] dedupe_current=$DEDUPE_CURRENT"
  echo "[bf16-aggressive-semantic] work_dir=$WORK_DIR"
  echo "[bf16-aggressive-semantic] results=$RESULTS"

  echo "[bf16-aggressive-semantic] emitting Verilog variants"
  python3 -u student/generators/bf16_aggressive_semantic_search.py \
    --cases "$CASES" \
    --variants "$VARIANTS" \
    --dedupe-current "$DEDUPE_CURRENT" \
    --work-dir "$WORK_DIR" \
    --results "$EMIT_RESULTS" \
    --best-results "$EMIT_BEST" \
    --timeout "$TIMEOUT" \
    --emit-only

  echo "[bf16-aggressive-semantic] synthesizing and checking candidates"
  set +e
  python3 -u student/generators/bf16_aggressive_semantic_search.py \
    --cases "$CASES" \
    --variants "$VARIANTS" \
    --dedupe-current "$DEDUPE_CURRENT" \
    --work-dir "$WORK_DIR" \
    --results "$RESULTS" \
    --best-results "$BEST_RESULTS" \
    --timeout "$TIMEOUT"
  SYNTH_STATUS=$?
  set -e
  echo "[bf16-aggressive-semantic] synth_status=$SYNTH_STATUS"

  echo "[bf16-aggressive-semantic] collecting summary from manifests"
  python3 -u student/scripts/collect_bf16_deep_results.py \
    --work-dir "$WORK_DIR" \
    --results "$RESULTS" \
    --best-results "$BEST_RESULTS" \
    --summary "$SUMMARY"

  echo "[bf16-aggressive-semantic] re-running official evaluate.py for equivalent candidates"
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
  echo "[bf16-aggressive-semantic] verify_status=$VERIFY_STATUS"

  echo "[bf16-aggressive-semantic] done $(date '+%Y-%m-%d %H:%M:%S %z')"
  echo "[bf16-aggressive-semantic] results=$RESULTS"
  echo "[bf16-aggressive-semantic] best=$BEST_RESULTS"
  echo "[bf16-aggressive-semantic] summary=$SUMMARY"
  echo "[bf16-aggressive-semantic] eval_check=$CHECK_RESULTS"
  echo "[bf16-aggressive-semantic] best_dir=$BEST_DIR"
} 2>&1 | tee "$LOG"
