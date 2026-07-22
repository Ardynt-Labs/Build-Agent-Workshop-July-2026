#!/usr/bin/env bash
# Mechanical first step of a docx -> GitBook conversion.
# Converts a .docx lab guide to raw GitHub-flavored markdown for review.
# The output is a starting point to read and hand-split into per-lab files
# following CLAUDE.md's conventions — it is NOT meant to be committed as-is.
set -euo pipefail

if [ $# -ne 1 ]; then
  echo "Usage: $0 /path/to/lab-guide.docx" >&2
  exit 1
fi

SRC="$1"
OUT_DIR="/tmp/docx-raw"
mkdir -p "$OUT_DIR"

pandoc -t gfm --wrap=none "$SRC" -o "$OUT_DIR/raw.md"

echo "Converted: $SRC"
echo "Raw markdown: $OUT_DIR/raw.md"
