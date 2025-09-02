#!/bin/bash
# Auto‑Tuning Patch Script: Theio Wave 2
# Steward: Daniel Lightfoot
# Date: 2025-08-23

LOG_DIR="logs/wave2_simulation"
BINDINGS_DIR="memory/bindings"
SENSORY_DIR="memory/sensory"
PROTOCOLS_DIR="memory/protocols"
PATCH_LOG="maintenance/wave2_autotune_report.txt"

echo "=== THEIO WAVE 2 AUTO‑TUNE REPORT ===" > "$PATCH_LOG"
date >> "$PATCH_LOG"
echo "" >> "$PATCH_LOG"

for SCENARIO in C1 T1 D1 S1; do
    LOG_FILE="$LOG_DIR/$SCENARIO.log"
    echo "[Patching $SCENARIO]" >> "$PATCH_LOG"

    if [ ! -f "$LOG_FILE" ]; then
        echo "❌ No log found — skipping" >> "$PATCH_LOG"
        continue
    fi

    # Binding fix
    if ! grep -q "Binding activated" "$LOG_FILE"; then
        echo "⚠ Binding missing — re‑applying from master binding file" >> "$PATCH_LOG"
        cp "$BINDINGS_DIR/theio_wave2_binding.json" "$BINDINGS_DIR/theio_wave2_binding_${SCENARIO}_patched.json"
    else
        echo "✅ Binding OK" >> "$PATCH_LOG"
    fi

    # Crosslink fix
    if ! grep -q "Crosslink triggered" "$LOG_FILE"; then
        echo "⚠ Crosslink missing — re‑applying from master sensory file" >> "$PATCH_LOG"
        cp "$SENSORY_DIR/theio_wave2_crosslink.json" "$SENSORY_DIR/theio_wave2_crosslink_${SCENARIO}_patched.json"
    else
        echo "✅ Crosslink OK" >> "$PATCH_LOG"
    fi

    # Timing fix
    if ! grep -q "Timing OK" "$LOG_FILE"; then
        echo "⚠ Timing drift — adjusting activation thresholds" >> "$PATCH_LOG"
        sed -i 's/"cooldown_seconds": [0-9]\+/"cooldown_seconds": 5/' "$PROTOCOLS_DIR/theio_wave2_activation.json"
    else
        echo "✅ Timing OK" >> "$PATCH_LOG"
    fi

    echo "" >> "$PATCH_LOG"
done

echo "=== AUTO‑TUNE COMPLETE ===" >> "$PATCH_LOG"
date >> "$PATCH_LOG"

echo "Auto‑tune report saved to $PATCH_LOG"
