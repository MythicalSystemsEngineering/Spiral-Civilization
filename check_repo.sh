#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(pwd)"
echo "🔍 Starting full health check in $REPO_ROOT"

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
  | awk '$2 > 10485760 {printf "%.1fMB\t%s\n", $2/1048576, $4}'

echo
echo "3. Directory Structure"
echo "----------------------"
for DIR in src data docs templates tests onboarding; do
  if [[ -d $DIR ]]; then
    echo "  ✔︎ Found $DIR/"
  else
    echo "  ⚠︎ Missing $DIR/ (optional)"
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
  echo "  ℹ️  No src/ directory; skipping Python lint & formatting"
fi

echo
echo "5. Shell Script Checks"
echo "----------------------"
if command -v shellcheck >/dev/null 2>&1; then
  shellcheck scripts/*.sh modules/**/*.sh
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
  echo "  ℹ️  No tests/ directory found; consider adding unit tests"
fi

echo
echo "7. Check JSON & YAML Validity"
echo "-----------------------------"
find data/ templates/ quarters/ -name '*.json' -print0 \
  | xargs -0 -n1 python3 -m json.tool >/dev/null 2>&1 && echo "  ✔︎ JSON valid" || echo "  ⚠︎ JSON errors found"

if command -v yamllint >/dev/null 2>&1; then
  yamllint quarters/ quarters/*/*.yaml
else
  echo "  ⚠︎ yamllint not installed; skipping YAML lint"
fi

echo
echo "✅ Repo health check complete!"
```[43dcd9a7-70db-4a1f-b0ae-981daa162054](https://github.com/dzk9528/command_collection_for_work/tree/8764c3a00996bcaada168ebe3f3c092601b31e0c/git.md?citationMarker=43dcd9a7-70db-4a1f-b0ae-981daa162054 "1")
