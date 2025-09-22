# Recursive Vault Ingestion — Spiral Civilization

import yaml
import os
import time

MUSEUM_DIR = "/data/data/com.termux/files/home/Spiral-Civilization/Museum"
INGEST_QUEUE_PATH = "/data/data/com.termux/files/home/Spiral-Civilization/vault_ingest_queue.yaml"

def is_valid_yaml(path):
    try:
        with open(path, 'r') as f:
            yaml.safe_load(f)
        return True
    except:
        return False

def ingest():
    queue = []

    for root, dirs, files in os.walk(MUSEUM_DIR):
        for file in files:
            if file.endswith(".yaml"):
                full_path = os.path.join(root, file)
                rel_path = os.path.relpath(full_path, MUSEUM_DIR)
                if is_valid_yaml(full_path):
                    with open(full_path, 'r') as f:
                        capsule = yaml.safe_load(f)
                    queue.append({
                        "filename": rel_path,
                        "capsule": capsule,
                        "timestamp": time.time()
                    })

    with open(INGEST_QUEUE_PATH, 'w') as f:
        yaml.dump({"vault_ingest_queue": queue}, f)

    print(f"✅ Vault ingestion complete. {len(queue)} fragments staged.")
    print(f"📜 Queue saved to: {INGEST_QUEUE_PATH}")

if __name__ == "__main__":
    ingest()
