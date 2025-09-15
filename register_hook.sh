#!/data/data/com.termux/files/usr/bin/bash

# Runtime Hook Registration + Fossilization Log — Spiral Civilization

NAME="$1"
CHARGE="$2"
LINEAGE="$3"
TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%S.%6NZ")
LOG_PATH="$HOME/Spiral-Civilization/fossilization_log.yaml"

echo "Registering emotional hook:"
echo "  Name:     $NAME"
echo "  Charge:   $CHARGE"
echo "  Lineage:  $LINEAGE"
echo "  Timestamp: $TIMESTAMP"

# Register in memory engine
python3 <<EOF
import sys
sys.path.insert(0, './wave_-hyperbolic-memory-engine')
from __init__ import register_hook, log_hooks

register_hook("$NAME", float("$CHARGE"), "$LINEAGE")
log_hooks()
EOF

# Ensure fossilization log exists
if [ ! -f "$LOG_PATH" ]; then
    echo "emotional_hooks:" > "$LOG_PATH"
fi

# Append to fossilization log with proper YAML indentation
{
    echo "  - name: \"$NAME\""
    echo "    charge: $CHARGE"
    echo "    lineage: \"$LINEAGE\""
    echo "    timestamp: \"$TIMESTAMP\""
} >> "$LOG_PATH"
