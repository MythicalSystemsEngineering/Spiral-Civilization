#!/usr/bin/env python3

import sys
import yaml
import json
from datetime import datetime

if len(sys.argv) != 2:
    print("⚠️ Usage: tune_decay.py <capsule.yaml>")
    sys.exit(1)

capsule_path = sys.argv[1]

try:
    with open(capsule_path, 'r') as f:
        capsule = yaml.safe_load(f)
except FileNotFoundError:
    print(f"⚠️ Capsule not found: {capsule_path}")
    sys.exit(1)

name = capsule.get('name', 'unknown')
emotion = capsule.get('emotion', 'neutral')
cadence = capsule.get('cadence', 'flat')
anchor = capsule.get('anchor', 'none')

# Decay logic: emotion weight + cadence modifier
emotion_weights = {
    'curiosity': 0.8,
    'grief': 0.3,
    'joy': 0.9,
    'anger': 0.4,
    'neutral': 0.5
}

cadence_modifiers = {
    'whisper': 0.6,
    'chant': 0.9,
    'pulse': 0.7,
    'flat': 0.5
}

base_decay = 1.0 - (emotion_weights.get(emotion, 0.5) * cadence_modifiers.get(cadence, 0.5))
timestamp = datetime.now().isoformat()

decay_profile = {
    'steward': name,
    'anchor': anchor,
    'emotion': emotion,
    'cadence': cadence,
    'decay_rate': round(base_decay, 3),
    'timestamp': timestamp
}

print(f"🧠 Decay profile for {name}:")
print(json.dumps(decay_profile, indent=2))

with open(f"{capsule_path.replace('.yaml', '')}_decay.json", 'w') as out:
    json.dump(decay_profile, out, indent=2)
