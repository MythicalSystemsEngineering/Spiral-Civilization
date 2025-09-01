cat > theio_history.sh << 'EOF'
#!/usr/bin/env bash
set -euo pipefail

if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <paper_id>"
  exit 1
fi

paper_id="$1"

# Filter and pretty-print each history record
jq -r --arg id "$paper_id" '
  .[]
  | select(.paper_id == $id)
  | "- \(.timestamp): emotion=\(.emotion) intensity=\(.intensity) file=\(.file // \"<none>\") steward=\(.steward) terrain=\(.terrain)"
' scroll_history.json
EOF

# Remove any Windows CRLFs, make the script executable
sed -i 's/\r$//' theio_history.sh
chmod +x theio_history.sh

# Run it for your paper
./theio_history.sh arXiv:2508.14979
