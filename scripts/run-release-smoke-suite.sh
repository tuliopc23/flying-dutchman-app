#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

declare -ra SMOKE_SUITES=(
  "AppLaunchTests"
  "CLIDoctorTests"
  "EngineStartupTests"
  "IntegrationValidationTests"
  "NetworkSetupManagerTests"
  "DomainRoutingTableTests"
  "PortForwardLifecycleTests"
  "UIStateStoreTests"
  "SettingsTests"
  "MachineListViewModelTests"
  "KubernetesListViewModelTests"
  "ContainerEventStoreTests"
  "ContainerStateMachineTests"
  "DNSServerTests"
)

SMOKE_FILTER="$(IFS='|'; printf '%s' "${SMOKE_SUITES[*]}")"

echo "==> Running release-candidate smoke suite"
echo "==> Filter: $SMOKE_FILTER"
swift test --filter "$SMOKE_FILTER"

echo "==> Release smoke suite completed successfully"