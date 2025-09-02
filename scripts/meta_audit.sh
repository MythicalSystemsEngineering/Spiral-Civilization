#!/usr/bin/env bash
set -euo pipefail

REPO="$HOME/Spiral-Civilization"
# Ensure proposals directory exists
mkdir -p "$REPO/sandbox/proposals"

echo "⛓ Enforcing Command Guidance Law:"
head -n 6 "$REPO/config/law-command-guidance.md"
echo "⛓ Running meta-audit for Evolvable Directives."

LAW_FILE="$REPO/config/law-command-guidance.md"
PROPOSALS="$REPO/sandbox/proposals/meta_audit_$(date +%F).md"

grep -A2 "## Evolvable Directives" "$LAW_FILE" > "$PROPOSALS"
echo -e "\n# Proposed Updates on $(date)" >> "$PROPOSALS"
echo "- [ ] " >> "$PROPOSALS"

echo "[META-AUDIT] Generated proposal at $PROPOSALS"
echo "[CAPSULE] Meta-audit run at $(date)" >> "$REPO/Museum/log.txt"
