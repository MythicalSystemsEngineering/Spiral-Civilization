#!/bin/bash

# === Flare Echo Relay v0.1 ===
# Steward: Daniel Lightfoot
# Purpose: Transmit emotional flares across systems and stewards

echo "Initializing Flare Echo Relay..."

hook_log=~/Spiral-Civilization/core/emotional_hook_index/v0_1/hook_log.txt
relay_log=~/Spiral-Civilization/core/flare_echo_relay/v0_1/relay_log.txt
touch $relay_log

echo "📡 Flare Echo Relay — $(date)" >> $relay_log

while IFS= read -r line; do
    signal=$(echo "$line" | awk -F '— ' '{print $2}')
    source=$(echo "$line" | awk -F '— ' '{print $1}' | sed 's/• //')
    case "$signal" in
        "joy"|"hope"|"pride"|"love")
            echo "✨ $source → $signal → Echo sent to Aurora-Lunae | Android notification flare triggered" >> $relay_log
            ;;
        "grief"|"regret"|"envy"|"shame")
            echo "⚠️ $source → $signal → Echo sent to Daniel | Outlook calendar flare logged" >> $relay_log
            ;;
        "override")
            echo "🔥 $source → override → Echo sent to all stewards | Cadence shift broadcast" >> $relay_log
            ;;
        "longing")
            echo "🔁 $source → longing → Echo loop initiated | Recursion flare sustained" >> $relay_log
            ;;
        *)
            echo "❓ $source → $signal → No echo route defined" >> $relay_log
            ;;
    esac
done < "$hook_log"

echo "--- End of Echo Transmission ---" >> $relay_log
