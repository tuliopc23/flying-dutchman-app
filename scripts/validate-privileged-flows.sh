#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

readonly CLI_BUILD_COMMAND=(swift build --product FlyingDutchmanCLI)
readonly CLI_COMMAND=(swift run --skip-build FlyingDutchmanCLI)

sample_host="${FD_SAMPLE_HOST:-<running-container-name>}"
https_url=""
https_url_explicit=0
port_forward_url="${FD_PORT_FORWARD_URL:-http://127.0.0.1:<forwarded-port>/health}"
run_preflight=1

usage() {
  cat <<'EOF'
Usage: bash scripts/validate-privileged-flows.sh [options]

Runs safe preflight checks for privileged release-validation commands, then prints
the targeted manual commands to exercise resolver install, CA trust, HTTPS, and
port-forward reachability.

Options:
  --sample-host <name>        Running container or cluster hostname prefix used in DNS/HTTPS checks
  --https-url <url>           Full HTTPS URL to validate after trust is installed
  --port-forward-url <url>    Full local URL to validate for port-forward reachability
  --skip-preflight            Only print the manual commands
  -h, --help                  Show this help text
EOF
}

derive_https_url() {
  printf 'https://%s.flyingdutchman.local:8443' "$1"
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --sample-host)
      sample_host="$2"
      shift 2
      ;;
    --https-url)
      https_url="$2"
      https_url_explicit=1
      shift 2
      ;;
    --port-forward-url)
      port_forward_url="$2"
      shift 2
      ;;
    --skip-preflight)
      run_preflight=0
      shift
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      echo "Unknown argument: $1" >&2
      usage >&2
      exit 1
      ;;
  esac
done

if [[ $https_url_explicit -eq 0 ]]; then
  https_url="$(derive_https_url "$sample_host")"
fi

if [[ $run_preflight -eq 1 ]]; then
  echo "==> Verifying privileged validation command surface"
  "${CLI_BUILD_COMMAND[@]}" >/dev/null
  "${CLI_COMMAND[@]}" --help >/dev/null
  "${CLI_COMMAND[@]}" doctor --json >/dev/null
  "${CLI_COMMAND[@]}" start --help >/dev/null
  "${CLI_COMMAND[@]}" stop --help >/dev/null
  "${CLI_COMMAND[@]}" networking install-resolver --help >/dev/null
  "${CLI_COMMAND[@]}" networking uninstall-resolver --help >/dev/null
  "${CLI_COMMAND[@]}" trust-ca --help >/dev/null
  "${CLI_COMMAND[@]}" machines --help >/dev/null
  "${CLI_COMMAND[@]}" k8s --help >/dev/null
  echo "==> Command preflight complete"
  echo
fi

cat <<EOF
==> Targeted privileged validation commands
Run these after 'bash scripts/validate-release.sh' succeeds.

1. Engine status and recovery surface
   swift run FlyingDutchmanCLI start --daemon --wait
   swift run FlyingDutchmanCLI doctor

2. Resolver installation and DNS resolution (sudo expected)
   swift run FlyingDutchmanCLI networking install-resolver
   dig ${sample_host}.flyingdutchman.local

3. Root CA trust and HTTPS routing (sudo / keychain approval expected)
   swift run FlyingDutchmanCLI trust-ca
   curl -vk ${https_url}

4. Port-forward reachability
   curl --fail --silent --show-error ${port_forward_url}

5. Cleanup / reset when finishing the smoke pass
   swift run FlyingDutchmanCLI networking uninstall-resolver
   swift run FlyingDutchmanCLI stop

Notes:
- Replace placeholder values such as '${sample_host}' or '${port_forward_url}' with a real running container, cluster, or forwarded service before executing the checks.
- Use 'swift run FlyingDutchmanCLI machines ...' and 'swift run FlyingDutchmanCLI k8s ...' during the full manual smoke matrix in docs/release/release-evidence-checklist.md.
EOF