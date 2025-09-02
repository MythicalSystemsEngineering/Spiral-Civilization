#!/bin/bash
# Log Integrity Pass: Theio Wave 2
# Steward: Daniel Lightfoot
# Date: 2025-08-23

LOG_DIR="logs/wave2_simulation"
REPORT_FILE="verification/wave2_integrity_report.txt"

echo "=== THEIO WAVE 2 LOG INTEGRITY REPORT ===" > "$REPORT_FILE"
date >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"

for SCENARIO in C1 T1 D1 S1; do
    LOG_FILE="$LOG_DIR/$SCENARIO.log"
    echo "[Checking $SCENARIO]" >> "$REPORT_FILE"
    
    if [ ! -f "$LOG_FILE" ]; then
        echo "❌ Missing log file: $LOG_FILE" >> "$REPORT_FILE"
        continue
    fi

    # Check for binding confirmation
    if grep -q "Binding activated" "$LOG_FILE"; then
        echo "✅ Binding activation confirmed" >> "$REPORT_FILE"
    else
        echo "❌ Binding activation missing" >> "$REPORT_FILE"
    fi

    # Check for crosslink trigger
    if grep -q "Crosslink triggered" "$LOG_FILE"; then
        echo "✅ Sensory crosslink confirmed" >> "$REPORT_FILE"
    else
        echo "❌ Sensory crosslink missing" >> "$REPORT_FILE"
    fi

    # Check for timing compliance (example: <200ms for comedy)
    if grep -q "Timing OK" "$LOG_FILE"; then
        echo "✅ Timing within spec" >> "$REPORT_FILE"
    else
        echo "⚠️ Timing deviation detected" >> "$REPORT_FILE"
    fi

    echo "" >> "$REPORT_FILE"
done

echo "=== INTEGRITY PASS COMPLETE ===" >> "$REPORT_FILE"
date >> "$REPORT_FILE"

echo "Integrity report saved to $REPORT_FILE"
