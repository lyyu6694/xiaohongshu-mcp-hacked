#!/bin/zsh
set -euo pipefail
ROOT_DIR="$(cd "$(dirname "$0")" && pwd)"
mkdir -p "$ROOT_DIR/bin"
go build -o "$ROOT_DIR/bin/xiaohongshu-mcp" .
echo "Built: $ROOT_DIR/bin/xiaohongshu-mcp"
