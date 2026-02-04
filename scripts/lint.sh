#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
SWIFTFORMAT_CFG="$ROOT_DIR/.swiftformat"
SWIFTLINT_CFG="$ROOT_DIR/.swiftlint.yml"

LINT_PATHS=()
if [[ -d "$ROOT_DIR/Projects" ]]; then
  LINT_PATHS+=("$ROOT_DIR/Projects")
fi
if [[ -d "$ROOT_DIR/Sources" ]]; then
  LINT_PATHS+=("$ROOT_DIR/Sources")
fi
if [[ -d "$ROOT_DIR/Tests" ]]; then
  LINT_PATHS+=("$ROOT_DIR/Tests")
fi

if command -v swiftformat >/dev/null 2>&1; then
  if [[ ${#LINT_PATHS[@]} -gt 0 ]]; then
    swiftformat "${LINT_PATHS[@]}" --config "$SWIFTFORMAT_CFG" --lint
  else
    echo "No lint paths found; skipping swiftformat" >&2
  fi
else
  echo "swiftformat not installed; skipping format lint" >&2
fi

if command -v swiftlint >/dev/null 2>&1; then
  (cd "$ROOT_DIR" && swiftlint lint --config "$SWIFTLINT_CFG")
else
  echo "swiftlint not installed; skipping lint" >&2
fi
