#!/bin/sh
# Usage: cold-read.sh <figure-only.png> [caption-file] [model]
# Runs an isolated first-time reader on a figure render with Claude Code: a fresh `claude -p` in a
# temporary directory that holds only the image (and the caption, if given), restricted to the Read
# tool inside that directory, with no MCP servers. Prints the reader's answer; removes the directory.
# Profile and authentication come from the caller's environment (e.g. CLAUDE_CONFIG_DIR).
set -eu
png=$1
caption=${2:-}
model=${3:-opus}
tmp=$(mktemp -d)
trap 'command rm -rf -- "$tmp"' EXIT
command cp -- "$png" "$tmp/figure.png"
ask='You are a first-time reader of a research figure. Read ./figure.png (the only file you may use). Without guessing beyond what the figure shows: (1) In 4 to 6 sentences, explain what the figure shows and what it claims. (2) List every label, symbol, colour or mark you cannot interpret or find ambiguous, each with what you think it might mean, and anything that looks inconsistent. (3) Say what you think each quantity or readout in the figure measures. Be blunt and specific; short answers.'
if [ -n "$caption" ]; then
  command cp -- "$caption" "$tmp/caption.txt"
  ask="$ask (4) Then read ./caption.txt, the figure's caption, and say what it changed in your understanding and what is still unclear."
fi
cd "$tmp"
claude -p --restricted --tools Read --strict-mcp-config --model "$model" \
  --permission-mode default "$ask" </dev/null
