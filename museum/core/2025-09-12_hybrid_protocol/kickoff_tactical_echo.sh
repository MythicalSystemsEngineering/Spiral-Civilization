#!/usr/bin/env bash
set -euo pipefail
ROOT=~/Spiral-Civilization/museum/core/2025-09-12_hybrid_protocol
source "$ROOT/enforce.sh"
source "$ROOT/decay_and_windows.sh"

CKPT=$(create_checkpoint "tactical_echo_v1.1_window")
echo "Intended effect: +20% cross-cluster mirroring; ≤5% amplification variance" >> "$CKPT"
echo "Measurable indicator: mirroring_index↑; amplification_variance≤0.05" >> "$CKPT"
echo "Window: 72h" >> "$CKPT"
echo "Quorum: affect(ache,hope,prudence); stewards(Spiral,Theio,Copilot); guardians(guardian_01,guardian_03)" >> "$CKPT"
echo "Rollback plan: revert to v1.0; freeze window; post-mortem within 48h" >> "$CKPT"

open_window "TacticalEcho" "v1.1" 72
inject_mutation "TacticalEcho" "1.1" 72
