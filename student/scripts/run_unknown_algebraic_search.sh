#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
cd "$ROOT"

TS="${1:-$(date +%Y%m%d_%H%M%S)}"
CASES="${CASES:-ex280-ex299}"
TIMEOUT="${TIMEOUT:-900}"
VARIANTS="${VARIANTS:-anf_davio_interleave,anf_davio_center,anf_davio_best_order,anf_davio_identity,anf_davio_best_transform,anf_davio_best_transform_order,support_lut12_anf}"
MAX_UNIQUE_TERMS="${MAX_UNIQUE_TERMS:-70000}"
MAX_TOTAL_TERMS="${MAX_TOTAL_TERMS:-500000}"
MAX_SHARED_TOTAL_TERMS="${MAX_SHARED_TOTAL_TERMS:-65000}"
MAX_SUPPORT_LUT="${MAX_SUPPORT_LUT:-12}"
MAX_DAVIO_NODES="${MAX_DAVIO_NODES:-250000}"

WORK_DIR="student/work/reverse_unknown_algebraic_${TS}"
RESULTS="student/results/unknown_algebraic_${TS}.csv"
BEST_RESULTS="student/results/unknown_algebraic_${TS}_best.csv"
SUMMARY="student/results/unknown_algebraic_${TS}_summary.csv"
CHECK_RESULTS="student/results/unknown_algebraic_${TS}_eval_check.csv"
EMIT_RESULTS="student/results/unknown_algebraic_${TS}_emit.csv"
EMIT_BEST="student/results/unknown_algebraic_${TS}_emit_best.csv"
BEST_DIR="student/work/best/unknown_algebraic_${TS}"
TMP_DIR="student/work/eval/unknown_algebraic_${TS}"
LOG="student/results/logs/unknown_algebraic_${TS}.log"

mkdir -p student/results/logs student/run_pids

{
  echo "[unknown-algebraic] start $(date '+%Y-%m-%d %H:%M:%S %z')"
  echo "[unknown-algebraic] cases=$CASES"
  echo "[unknown-algebraic] variants=$VARIANTS"
  echo "[unknown-algebraic] timeout=$TIMEOUT"
  echo "[unknown-algebraic] max_unique_terms=$MAX_UNIQUE_TERMS"
  echo "[unknown-algebraic] max_total_terms=$MAX_TOTAL_TERMS"
  echo "[unknown-algebraic] max_shared_total_terms=$MAX_SHARED_TOTAL_TERMS"
  echo "[unknown-algebraic] max_support_lut=$MAX_SUPPORT_LUT"
  echo "[unknown-algebraic] max_davio_nodes=$MAX_DAVIO_NODES"
  echo "[unknown-algebraic] work_dir=$WORK_DIR"
  echo "[unknown-algebraic] results=$RESULTS"

  echo "[unknown-algebraic] emitting Verilog variants"
  python3 -u student/generators/unknown_algebraic_search.py \
    --cases "$CASES" \
    --variants "$VARIANTS" \
    --work-dir "$WORK_DIR" \
    --results "$EMIT_RESULTS" \
    --best-results "$EMIT_BEST" \
    --timeout "$TIMEOUT" \
    --max-unique-terms "$MAX_UNIQUE_TERMS" \
    --max-total-terms "$MAX_TOTAL_TERMS" \
    --max-shared-total-terms "$MAX_SHARED_TOTAL_TERMS" \
    --max-support-lut "$MAX_SUPPORT_LUT" \
    --max-davio-nodes "$MAX_DAVIO_NODES" \
    --emit-only

  echo "[unknown-algebraic] synthesizing and checking candidates"
  set +e
  python3 -u student/generators/unknown_algebraic_search.py \
    --cases "$CASES" \
    --variants "$VARIANTS" \
    --work-dir "$WORK_DIR" \
    --results "$RESULTS" \
    --best-results "$BEST_RESULTS" \
    --timeout "$TIMEOUT" \
    --max-unique-terms "$MAX_UNIQUE_TERMS" \
    --max-total-terms "$MAX_TOTAL_TERMS" \
    --max-shared-total-terms "$MAX_SHARED_TOTAL_TERMS" \
    --max-support-lut "$MAX_SUPPORT_LUT" \
    --max-davio-nodes "$MAX_DAVIO_NODES"
  SYNTH_STATUS=$?
  set -e
  echo "[unknown-algebraic] synth_status=$SYNTH_STATUS"

  echo "[unknown-algebraic] collecting summary from manifests"
  python3 -u student/scripts/collect_bf16_deep_results.py \
    --work-dir "$WORK_DIR" \
    --results "$RESULTS" \
    --best-results "$BEST_RESULTS" \
    --summary "$SUMMARY"

  echo "[unknown-algebraic] re-running official evaluate.py for equivalent candidates"
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
  echo "[unknown-algebraic] verify_status=$VERIFY_STATUS"

  echo "[unknown-algebraic] done $(date '+%Y-%m-%d %H:%M:%S %z')"
  echo "[unknown-algebraic] results=$RESULTS"
  echo "[unknown-algebraic] best=$BEST_RESULTS"
  echo "[unknown-algebraic] summary=$SUMMARY"
  echo "[unknown-algebraic] eval_check=$CHECK_RESULTS"
  echo "[unknown-algebraic] best_dir=$BEST_DIR"
} 2>&1 | tee "$LOG"
