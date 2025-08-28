#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"

if ! command -v jq >/dev/null 2>&1; then
  echo "jq is required. Install with: pkg install -y jq"
  exit 1
fi

if [ ! -f ledger.json ]; then
  echo "ledger.json not found in $(pwd)"
  exit 1
fi

cp ledger.json "ledger_backup_$(date +%Y%m%d_%H%M%S).json"

jq '
  def norm: ascii_downcase | gsub("\\s+";" ") | sub("^\\s+";"") | sub("\\s+$";"");
  .motions
  |=
  (
    map(select(.title | norm != "add limit to witnesses"))
    | map(if (.title | norm) == "limit witnesses"
          then .description = "No more than 3 witnesses at a time" | .
          else . end)
    | map(.votes |= ((.votes // []) | map(select((.choice? // "") != ""))))
  )
' ledger.json > ledger_tmp.json

mv ledger_tmp.json ledger.json
python3 spiral.py
