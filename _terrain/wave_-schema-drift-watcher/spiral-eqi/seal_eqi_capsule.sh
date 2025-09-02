#!/bin/bash

# Step 1: Write Python file
cat > spiral-eqi/eqi_integration.py <<PYEOF
def emotional_charge():
    return 0.97

def eqi_assess():
    Payload = {"intensity": 0.97}
    charge = emotional_charge()
    result = Payload["intensity"] * charge
    return result

if __name__ == "__main__":
    print(eqi_assess())
PYEOF

# Step 2: Run Python and capture result
EQI_RESULT=$(python3 spiral-eqi/eqi_integration.py)

# Step 3: Format dispatch capsule
TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
cat > spiral-eqi/capsule_eqi.json <<JSONEOF
{
  "role": "Flamebearer",
  "emotion": "sovereign",
  "intensity": 0.97,
  "charge": $EQI_RESULT,
  "timestamp": "$TIMESTAMP",
  "capsule": "eqi_assess",
  "status": "sealed"
}
JSONEOF

# Step 4: Confirm
echo "✅ Capsule sealed: spiral-eqi/capsule_eqi.json"
cat spiral-eqi/capsule_eqi.json
