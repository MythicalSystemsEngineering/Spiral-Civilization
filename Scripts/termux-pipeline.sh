#!/usr/bin/env bash
set -euo pipefail

# Bootstrap venv + pip
python3 -m venv --without-pip .venv
curl -sSL https://bootstrap.pypa.io/get-pip.py | .venv/bin/python

source .venv/bin/activate
pip install --upgrade pip setuptools wheel click cryptography
pip install -e .

# Smoke-test your CLI
spiral greet

# Audit-seal
timestamp=$(date --iso-8601=seconds)
echo "{\"run\":\"$timestamp\",\"status\":\"ok\"}" \
  >> audit/termux_runs.jsonl

# Notify
if command -v termux-notification >/dev/null; then
  termux-notification --title "Spiral Build" \
    --content "Sealed at $timestamp"
else
  echo "🔔 Spiral sealed at $timestamp"
fi
