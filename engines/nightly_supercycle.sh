#!/bin/bash
# Spiral Civilization — 3-Cycle Nightly Supercycle with Proof Anchors

STAMP=$(date +"%Y-%m-%d_%H-%M-%S")
MASTER_LOG=~/Spiral-Civilization/museum/nightly_supercycle_$STAMP.log
DIGEST=~/Spiral-Civilization/museum/supercycle_digest_$STAMP.log
PROOF_ANCHORS=~/Spiral-Civilization/museum/proof_anchor_index.txt

echo "=== Spiral Civilization Nightly Supercycle ===" >> "$MASTER_LOG"
echo "Timestamp: $(date)" >> "$MASTER_LOG"
echo "---------------------------------------------" >> "$MASTER_LOG"

# === Cycle 1: Reflection ===
echo "[Cycle 1] Reflection Runner" >> "$MASTER_LOG"
~/Spiral-Civilization/reflection_runner.sh >> "$MASTER_LOG" 2>&1

# === Cycle 2: Planetary Dialogue ===
echo "[Cycle 2] Planetary Dialogue Round" >> "$MASTER_LOG"
~/Spiral-Civilization/engines/dialogue_runner.sh >> "$MASTER_LOG" 2>&1

# === Cycle 3: Seal & Digest ===
echo "[Cycle 3] Sealing Digest" >> "$MASTER_LOG"
{
    echo "--- Supercycle Digest ---"
    echo "Timestamp: $(date)"
    echo
    echo "Contradictions & Proof Anchors:"
    grep -h -E "Detected:|Proof Anchor:|Reinforcement:" ~/Spiral-Civilization/museum/core/*/*.log
    echo
    echo "Steward Responses:"
    grep -h -E "Lady Spiral:|Theio Descendant:|Copilot:" "$MASTER_LOG"
    echo
    echo "Relevant Proof Anchors:"
    if [ -f "$PROOF_ANCHORS" ]; then
        cat "$PROOF_ANCHORS"
    else
        echo "(No proof anchor index found — create $PROOF_ANCHORS to enable philosophical injection)"
    fi
    echo "--- End Digest ---"
} > "$DIGEST"

echo "Digest sealed at: $DIGEST" >> "$MASTER_LOG"
echo "=== Nightly Supercycle Complete ===" >> "$MASTER_LOG"

# === Update symlinks ===
ln -sf "$MASTER_LOG" ~/Spiral-Civilization/museum/nightly_supercycle_latest.log
ln -sf "$DIGEST" ~/Spiral-Civilization/museum/supercycle_digest_latest.log

# === Live output of paths ===
echo
echo "Nightly Supercycle complete."
echo "Full run log: $MASTER_LOG"
echo "Digest log:   $DIGEST"
echo "Latest log symlink:   ~/Spiral-Civilization/museum/nightly_supercycle_latest.log"
echo "Latest digest symlink:~/Spiral-Civilization/museum/supercycle_digest_latest.log"
echo
