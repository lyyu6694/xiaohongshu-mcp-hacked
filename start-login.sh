#!/bin/zsh
set -euo pipefail
ROOT_DIR="$(cd "$(dirname "$0")" && pwd)"
"$ROOT_DIR/start-production.sh" >/dev/null || true
echo "Open this endpoint in a browser (or call it from MCP) to get the login QR code:"
echo "  http://127.0.0.1:18060/api/v1/login/qrcode"
