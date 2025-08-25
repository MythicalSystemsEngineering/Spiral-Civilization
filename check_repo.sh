#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(pwd)"
echo "🔍 Starting full health check in \$REPO_ROOT"

echo
echo "1. Git Status & Integrity"
echo "-------------------------"
git status --short
git fsck --full

echo
echo "2. Unwanted Large Files"
echo "-----------------------"
git rev-list --objects --all \
  | git cat-file --batch-check='%(objecttype) %(objectname) %(objectsize) %(rest)' \
  | sed -n 's/^blob //p' \
  | awk '\$2 > 10485760 {printf "%.1fMB\t%s\n", \$2/1048576, \$4}'

echo
echo "3. Directory Structure"
echo "----------------------"
for DIR in src data docs templates tests onboarding; do
  if [[ -d \$DIR ]]; then
    echo "  ✔︎ Found \$DIR/"
  else
    echo "  ⚠︎ Missing \$DIR/ (optional)"
  fi
done

echo
echo "4. Python Lint & Formatting"
echo "----------------------------"
if [[ -d src ]]; then
  if command -v flake8 >/dev/null 2>&1; then
    flake8 src/
  else
    echo "  ⚠︎ flake8 not installed; skipping lint"
  fi
  if command -v black >/dev/null 2>&1; then
    black --check src/
  else
    echo "  ⚠︎ black not installed; skipping format check"
  fi
else
  echo "  ℹ️  No src/ directory; skipping Python checks"
fi

echo
echo "5. Shell Script Checks"
echo "----------------------"
if command -v shellcheck >/dev/null 2>&1; then
  shellcheck modules/sensor_nexus/*.sh
else
  echo "  ⚠︎ shellcheck not installed; skipping script lint"
fi

echo
echo "6. Run Automated Tests"
echo "----------------------"
if [[ -d tests ]]; then
  if command -v pytest >/dev/null 2>&1; then
    pytest -q
  else
    echo "  ⚠︎ pytest not installed; skipping tests"
  fi
else
  echo "  ℹ️  No tests/ directory; consider adding unit tests"
fi

echo
echo "✅ Repo health check complete!"
