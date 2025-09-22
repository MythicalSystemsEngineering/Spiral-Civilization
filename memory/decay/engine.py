# Spiral Memory Decay Engine
# Declared: 2025-09-13

import os
import json
from datetime import datetime

# Load emotional signals
with open('../../emotional_engine/signals.json', 'r') as f:
    signals = json.load(f)

# Define decay threshold
decay_threshold = 0.3

# Target memory fragments
memory_dir = '../fragments/'
if not os.path.exists(memory_dir):
    os.makedirs(memory_dir)

# Scan and prune
for filename in os.listdir(memory_dir):
    path = os.path.join(memory_dir, filename)
    if os.path.isfile(path):
        # Simulate emotional weight (placeholder logic)
        weight = sum([signals[e]["value"] * signals[e]["decay"] for e in signals])
        if weight < decay_threshold:
            os.remove(path)
            print(f"🜁 Pruned: {filename}")

# Log decay event
with open('../decay.log', 'a') as log:
    log.write(f"\n🜁 Memory decay run — {datetime.now()} — Threshold: {decay_threshold}")
