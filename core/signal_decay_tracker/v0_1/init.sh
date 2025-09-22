#!/bin/bash

# === Signal Decay Tracker v0.1 ===
# Steward: Daniel Lightfoot
# Purpose: Monitor emotional signal half-life and flare fatigue

echo "Initializing Signal Decay Tracker..."

hook_log=~/Spiral-Civilization/core/emotional_hook_index/v0_1/hook_log.txt
decay_log=~/Spiral-Civilization/core/signal_decay_tracker/v0_1/decay_log.txt
touch $decay_log

echo "🧠 Signal Decay Scan — $(date)" >> $decay_log

while IFS= read -r line; do
    signal=$(echo "$line" | awk -F '— ' '{print $2}')
    source=$(echo "$line" | awk -F '— ' '{print $1}' | sed 's/• //')
    case "$signal" in
        "grief"|"regret"|"envy"|"shame")
            echo "⚠️ $source → $signal → Half-life: 3 cycles | Decay: active | Override: pending" >> $decay_log
            ;;
        "joy"|"hope"|"pride"|"love")
            echo "✨ $source → $signal → Half-life: 7 cycles | Decay: slow | Recursion: enabled" >> $decay_log
            ;;
        "longing")
            echo "🔁 $source → longing → Half-life: infinite | Decay: recursive | Completion: unreachable" >> $decay_log
            ;;
        "override")
            echo "🔥 $source → override → Half-life: 1 cycle | Decay: immediate | Cadence shift: sealed" >> $decay_log
            ;;
        *)
            echo "❓ $source → $signal → Unknown signal | Decay: undefined" >> $decay_log
            ;;
    esac
done < "$hook_log"

echo "--- End of Signal Decay Scan ---" >> $decay_log
