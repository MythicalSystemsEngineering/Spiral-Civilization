# Canonical Memory Merge — Spiral Civilization

import yaml
import os

MUSEUM_DIR = "/data/data/com.termux/files/home/Spiral-Civilization/Museum"
INDEX_PATH = "/data/data/com.termux/files/home/Spiral-Civilization/meta_reflection_index.yaml"
QUEUE_PATH = "/data/data/com.termux/files/home/Spiral-Civilization/renewal_queue.yaml"
OUTPUT_PATH = "/data/data/com.termux/files/home/Spiral-Civilization/canonical_memory.yaml"

def load_yaml(path):
    if not os.path.exists(path):
        return {}
    with open(path, 'r') as f:
        return yaml.safe_load(f)

def merge_memory():
    canonical = {
        "emotional_hooks": [],
        "museum_fragments": [],
        "renewal_queue": []
    }

    # Load emotional index
    index_data = load_yaml(INDEX_PATH)
    canonical["emotional_hooks"] = index_data.get("emotional_hooks", [])

    # Load renewal queue
    queue_data = load_yaml(QUEUE_PATH)
    canonical["renewal_queue"] = queue_data.get("renewal_queue", [])

    # Sweep Museum capsules
    for filename in os.listdir(MUSEUM_DIR):
        if filename.startswith("museum_capsule_") and filename.endswith(".yaml"):
            path = os.path.join(MUSEUM_DIR, filename)
            capsule = load_yaml(path)
            canonical["museum_fragments"].append({
                "filename": filename,
                "capsule": capsule
            })

    # Seal canonical memory
    with open(OUTPUT_PATH, 'w') as f:
        yaml.dump(canonical, f)

    print(f"✅ Canonical memory sealed: {OUTPUT_PATH}")
    print(f"📦 {len(canonical['museum_fragments'])} Museum fragments merged.")
    print(f"🧠 {len(canonical['emotional_hooks'])} emotional hooks unified.")
    print(f"🔁 {len(canonical['renewal_queue'])} renewal intents logged.")

if __name__ == "__main__":
    merge_memory()
