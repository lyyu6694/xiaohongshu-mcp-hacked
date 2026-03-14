#!/bin/zsh
set -euo pipefail
ROOT_DIR="$(cd "$(dirname "$0")" && pwd)"
mkdir -p "$ROOT_DIR/bin" "$ROOT_DIR/logs"
export COOKIES_PATH="$ROOT_DIR/cookies.json"
export XHS_MCP_PORT=:18060
if [ ! -x "$ROOT_DIR/bin/xiaohongshu-mcp" ]; then
  echo "Binary not found, building from source..."
  (cd "$ROOT_DIR" && go build -o "$ROOT_DIR/bin/xiaohongshu-mcp" .)
fi
pkill -f "$ROOT_DIR/bin/xiaohongshu-mcp" 2>/dev/null || true
sleep 1
nohup "$ROOT_DIR/bin/xiaohongshu-mcp" -headless=false > "$ROOT_DIR/logs/mcp-production.log" 2>&1 &
sleep 2
echo "Server started. Health check:"
curl -s --max-time 10 http://127.0.0.1:18060/api/v1/login/status || true
