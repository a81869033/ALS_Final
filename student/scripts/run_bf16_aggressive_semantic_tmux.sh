#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
cd "$ROOT"

TS="${1:-$(date +%Y%m%d_%H%M%S)}"
SESSION="${SESSION:-bf16_aggr_sem_${TS}}"
LOG="student/results/logs/bf16_aggressive_semantic_${TS}.log"
PID_FILE="student/run_pids/${SESSION}.pid"
META_FILE="student/run_pids/${SESSION}.txt"

mkdir -p student/results/logs student/run_pids

if ! command -v tmux >/dev/null 2>&1; then
  echo "tmux not found in PATH" >&2
  exit 1
fi

if tmux has-session -t "$SESSION" 2>/dev/null; then
  echo "tmux session already exists: $SESSION" >&2
  exit 1
fi

tmux new-session -d -s "$SESSION" "cd '$ROOT' && bash student/scripts/run_bf16_aggressive_semantic_search.sh '$TS'"

tmux display-message -p -t "$SESSION" "#{pane_pid}" > "$PID_FILE"
{
  echo "session=$SESSION"
  echo "timestamp=$TS"
  echo "log=$LOG"
  echo "attach=tmux attach -t $SESSION"
  echo "tail=tail -f $LOG"
  echo "started=$(date '+%Y-%m-%d %H:%M:%S %z')"
} > "$META_FILE"

echo "Started tmux session: $SESSION"
echo "Log: $LOG"
echo "Attach: tmux attach -t $SESSION"
echo "Tail: tail -f $LOG"
