#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

echo "==> Building FlyingDutchmanApp"
swift build --target FlyingDutchmanApp

echo "==> Building FlyingDutchmanEngine"
swift build --target FlyingDutchmanEngine

echo "==> Building FlyingDutchmanCLI"
swift build --target FlyingDutchmanCLI

echo "==> Running release smoke suite"
bash scripts/run-release-smoke-suite.sh

echo "==> Running Swift test suite"
swift test

echo "==> Privileged/manual validation helper"
echo "bash scripts/validate-privileged-flows.sh"

echo "==> Release validation completed successfully"