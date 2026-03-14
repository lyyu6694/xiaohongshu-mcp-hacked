#!/bin/zsh
set -euo pipefail
curl -s --max-time 10 http://127.0.0.1:18060/api/v1/login/status
