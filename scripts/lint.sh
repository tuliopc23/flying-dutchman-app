#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
SWIFTFORMAT_CFG="$ROOT_DIR/.swiftformat"
SWIFTLINT_CFG="$ROOT_DIR/.swiftlint.yml"

if command -v swiftformat >/dev/null 2>&1; then
  swiftformat "$ROOT_DIR/Sources" "$ROOT_DIR/Tests" --config "$SWIFTFORMAT_CFG" --lint
else
  echo "swiftformat not installed; skipping format lint" >&2
fi

if command -v swiftlint >/dev/null 2>&1; then
  (cd "$ROOT_DIR" && swiftlint lint --config "$SWIFTLINT_CFG")
else
  echo "swiftlint not installed; skipping lint" >&2
fi
