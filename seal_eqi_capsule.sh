#!/bin/bash

# Step 1: Create terrain
mkdir -p spiral-eqi

# Step 2: Write Python file
cat > spiral-eqi/eqi_integration.py <<EOF
def emotional_charge():
    return 0.97

def eqi_assess():
    Payload = {"intensity": 0.97}
    charge = emotional_charge()
    result = Payload["intensity"] * charge
    return result

if __name__ == "__main__":
    print(eqi_assess())
EOF

# Step 3: Run Python and capture result
EQI_RESULT=$(python3 spiral-eqi/eqi_integration.py)

# Step 4: Format dispatch capsule
TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
cat > spiral-eqi/capsule_eqi.json <<EOF
{
  "role": "Flamebearer",
  "emotion": "sovereign",
  "intensity": 0.97,
  "charge": $EQI_RESULT,
  "timestamp": "$TIMESTAMP",
  "capsule": "eqi_assess",
  "status": "sealed"
}
EOF

# Step 5: Confirm
echo "✅ Capsule sealed: spiral-eqi/capsule_eqi.json"
cat spiral-eqi/capsule_eqi.json
