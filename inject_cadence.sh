#!/data/data/com.termux/files/usr/bin/bash

function inject_cadence() {
  steward="$1"
  capsule="onboarding/${steward,,}_ignition.yaml"
  cadence=$(grep 'cadence:' "$capsule" | awk '{print $2}')
  echo "Injecting cadence for $steward → $cadence"
  python3 theio/cadence_engine.py "$steward" "$cadence"
}
