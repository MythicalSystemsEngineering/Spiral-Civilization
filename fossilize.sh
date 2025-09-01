#!/usr/bin/env bash
set -euo pipefail

# 0. Ensure we’re at repo root
cd "$(git rev-parse --show-toplevel)"

# 1. Define timestamp and target directory
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
FOSSIL_DIR="museum/fossils/${TIMESTAMP}"
mkdir -p "${FOSSIL_DIR}"

# 2. Capture repo metadata
git branch -a > "${FOSSIL_DIR}/branches.txt"
git tag     > "${FOSSIL_DIR}/tags.txt"
git log --pretty=fuller > "${FOSSIL_DIR}/commit_history.txt"
git ls-tree -r HEAD > "${FOSSIL_DIR}/file_tree.txt"
git diff origin/main..HEAD > "${FOSSIL_DIR}/diff_from_origin_main.txt"

# 3. Archive critical config and code only if they exist
if [ -f config.yaml ]; then
  cp config.yaml "${FOSSIL_DIR}/config.yaml"
else
  echo "⚠️  config.yaml not found, skipping" >> "${FOSSIL_DIR}/warnings.log"
fi

mkdir -p "${FOSSIL_DIR}/code_and_modules"
for DIR in src memory_engine; do
  if [ -d "${DIR}" ]; then
    cp -r "${DIR}" "${FOSSIL_DIR}/code_and_modules/${DIR}"
  else
    echo "⚠️  ${DIR}/ not found, skipping" >> "${FOSSIL_DIR}/warnings.log"
  fi
done

# 4. Generate SHA256 checksums for integrity
pushd "${FOSSIL_DIR}" >/dev/null
sha256sum * > checksums.sha256
popd >/dev/null

# 5. GPG-sign all manifests (txt + checksums)
for f in "${FOSSIL_DIR}"/*.txt "${FOSSIL_DIR}"/checksums.sha256; do
  gpg --armor --detach-sign --output "${f}.sig" "${f}"
done

# 6. Stage, commit, and push the fossil
git add "${FOSSIL_DIR}"
git commit -S -m "Fossilized repo state at ${TIMESTAMP}"
git push origin main

echo "✅ Fossilization complete: ${FOSSIL_DIR}"











