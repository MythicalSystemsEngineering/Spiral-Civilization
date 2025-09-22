# Capsule Recovery Sweep — Spiral Civilization

import yaml
import os
import time

MUSEUM_DIR = "/data/data/com.termux/files/home/Spiral-Civilization/Museum"
CANONICAL_PATH = "/data/data/com.termux/files/home/Spiral-Civilization/canonical_memory.yaml"
RECOVERY_QUEUE_PATH = "/data/data/com.termux/files/home/Spiral-Civilization/recovery_queue.yaml"

def load_yaml(path):
    if not os.path.exists(path):
        return {}
    with open(path, 'r') as f:
        return yaml.safe_load(f)

def recover():
    canonical = load_yaml(CANONICAL_PATH)
    sealed_files = {frag["filename"] for frag in canonical.get("museum_fragments", [])}
    museum_files = set(os.listdir(MUSEUM_DIR))

    missing = sorted(list(museum_files - sealed_files))
    recovery_queue = []

    for filename in missing:
        path = os.path.join(MUSEUM_DIR, filename)
        try:
            with open(path, 'r') as f:
                capsule = yaml.safe_load(f)
            recovery_queue.append({
                "filename": filename,
                "capsule": capsule,
                "timestamp": time.time()
            })
        except Exception as e:
            print(f"⚠️ Failed to load {filename}: {e}")

    with open(RECOVERY_QUEUE_PATH, 'w') as f:
        yaml.dump({"recovery_queue": recovery_queue}, f)

    print(f"✅ Recovery queue sealed: {RECOVERY_QUEUE_PATH}")
    print(f"📦 {len(recovery_queue)} missing capsules staged for merge.")

if __name__ == "__main__":
    recover()
