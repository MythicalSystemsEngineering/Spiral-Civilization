# Renewal Protocol — Spiral Civilization

import yaml
import os
import time

INDEX_PATH = "/data/data/com.termux/files/home/Spiral-Civilization/meta_reflection_index.yaml"
QUEUE_PATH = "/data/data/com.termux/files/home/Spiral-Civilization/renewal_queue.yaml"
RECHARGE_VALUE = 0.9
DECAY_THRESHOLD = 0.3

def renew_hooks():
    if not os.path.exists(INDEX_PATH):
        print("❌ meta_reflection_index.yaml not found.")
        return

    with open(INDEX_PATH, 'r') as f:
        index_data = yaml.safe_load(f)

    faded_hooks = []
    renewed_hooks = []

    for hook in index_data.get("emotional_hooks", []):
        if hook.get("charge", 1.0) < DECAY_THRESHOLD:
            faded_hooks.append({
                "name": hook["name"],
                "original_charge": hook["charge"],
                "timestamp": time.time()
            })
            hook["charge"] = RECHARGE_VALUE
            hook["last_touched"] = time.time()
            renewed_hooks.append(hook["name"])

    # Update index
    with open(INDEX_PATH, 'w') as f:
        yaml.dump(index_data, f)

    # Log renewal queue
    queue_data = {"renewal_queue": faded_hooks}
    with open(QUEUE_PATH, 'w') as f:
        yaml.dump(queue_data, f)

    print(f"✅ {len(renewed_hooks)} hooks recharged to {RECHARGE_VALUE}.")
    print(f"📝 Renewal queue logged: {QUEUE_PATH}")

if __name__ == "__main__":
    renew_hooks()
