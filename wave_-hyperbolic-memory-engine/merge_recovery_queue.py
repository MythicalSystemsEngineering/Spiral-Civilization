# Recovery Merge Protocol — Spiral Civilization

import yaml
import os

CANONICAL_PATH = "/data/data/com.termux/files/home/Spiral-Civilization/canonical_memory.yaml"
RECOVERY_QUEUE_PATH = "/data/data/com.termux/files/home/Spiral-Civilization/recovery_queue.yaml"

def load_yaml(path):
    if not os.path.exists(path):
        return {}
    with open(path, 'r') as f:
        return yaml.safe_load(f)

def merge_recovery():
    canonical = load_yaml(CANONICAL_PATH)
    recovery = load_yaml(RECOVERY_QUEUE_PATH)

    fragments = canonical.get("museum_fragments", [])
    queue = recovery.get("recovery_queue", [])

    merged = 0
    for item in queue:
        filename = item.get("filename")
        capsule = item.get("capsule", {})
        if filename and capsule:
            fragments.append({
                "filename": filename,
                "capsule": capsule
            })
            merged += 1

    canonical["museum_fragments"] = fragments

    with open(CANONICAL_PATH, 'w') as f:
        yaml.dump(canonical, f)

    print(f"✅ {merged} recovery capsules merged into canonical memory.")
    print(f"📜 Canonical memory updated: {CANONICAL_PATH}")

if __name__ == "__main__":
    merge_recovery()
