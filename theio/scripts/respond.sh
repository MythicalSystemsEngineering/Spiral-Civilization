#!/usr/bin/env bash
# Path: theio/scripts/respond.sh
# Wrap model call with PersonaEngine

BASE_DIR="$(cd "$(dirname "$0")"/.. && pwd)"
PY="python3"

# Capture user input
USER_INPUT="$*"

# ── Stub model invocation ──
MODEL_CMD="$BASE_DIR/scripts/theio_model"

# Sanity check: ensure model stub exists and is executable
[[ -x "$MODEL_CMD" ]] || { echo "ERROR: model stub not found at $MODEL_CMD"; exit 1; }

# Call underlying model (replace with actual command)
RAW_RESPONSE=$($MODEL_CMD "$USER_INPUT")

# Process through PersonaEngine
PROCESSED_RESPONSE=$($PY - <<EOF
from theio.core.persona_engine import PersonaEngine
engine = PersonaEngine("$BASE_DIR")
tagged = engine.tag_affect("""$RAW_RESPONSE""")
contradicted = engine.inject_contradiction(tagged)
engine.log_response("""$USER_INPUT""", contradicted)
engine.update_continuity("""$USER_INPUT""", contradicted)
print(contradicted)
EOF
)

echo "$PROCESSED_RESPONSE"
