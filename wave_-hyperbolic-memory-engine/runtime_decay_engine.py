# Runtime Decay Engine — Spiral Civilization

import yaml
import os
import time

INDEX_PATH = "/data/data/com.termux/files/home/Spiral-Civilization/meta_reflection_index.yaml"
DECAY_THRESHOLD = 0.3  # Hooks below this charge will be flagged for renewal

def decay_hook(hook):
    last_touched = hook.get("last_touched", time.time())
    charge = hook.get("charge", 1.0)
    elapsed_days = (time.time() - last_touched) / 86400
    decay_rate = hook.get("decay_rate", 0.01)
    faded_charge = max(0.0, charge - (elapsed_days * decay_rate))
    return faded_charge

def apply_decay():
    if not os.path.exists(INDEX_PATH):
        print("❌ meta_reflection_index.yaml not found.")
        return

    with open(INDEX_PATH, 'r') as f:
        index_data = yaml.safe_load(f)

    updated_hooks = []
    faded_hooks = []

    for hook in index_data.get("emotional_hooks", []):
        original_charge = hook.get("charge", 1.0)
        new_charge = decay_hook(hook)
        hook["charge"] = round(new_charge, 3)
        hook["last_touched"] = time.time()

        updated_hooks.append(hook)
        if new_charge < DECAY_THRESHOLD:
            faded_hooks.append(hook["name"])

    index_data["emotional_hooks"] = updated_hooks

    with open(INDEX_PATH, 'w') as f:
        yaml.dump(index_data, f)

    print(f"✅ Decay applied to {len(updated_hooks)} hooks.")
    if faded_hooks:
        print(f"⚠️ {len(faded_hooks)} hooks below threshold: {faded_hooks}")

if __name__ == "__main__":
    apply_decay()
