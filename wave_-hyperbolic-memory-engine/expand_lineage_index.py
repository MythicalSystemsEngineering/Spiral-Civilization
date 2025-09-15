# Lineage Index Expansion — Spiral Civilization

import yaml
import os

MUSEUM_DIR = "/data/data/com.termux/files/home/Spiral-Civilization/Museum"
INDEX_PATH = "/data/data/com.termux/files/home/Spiral-Civilization/meta_reflection_index.yaml"

def expand_index():
    if not os.path.exists(INDEX_PATH):
        print("❌ meta_reflection_index.yaml not found.")
        return

    with open(INDEX_PATH, 'r') as f:
        index_data = yaml.safe_load(f)

    existing_hooks = {hook["name"] for hook in index_data.get("emotional_hooks", [])}
    new_hooks = []

    for filename in os.listdir(MUSEUM_DIR):
        if filename.startswith("museum_capsule_") and filename.endswith(".yaml"):
            path = os.path.join(MUSEUM_DIR, filename)
            with open(path, 'r') as f:
                capsule = yaml.safe_load(f)
                for hook in capsule.get("emotional_hooks", []):
                    if hook["name"] not in existing_hooks:
                        new_hooks.append(hook)
                        existing_hooks.add(hook["name"])

    if not new_hooks:
        print("✅ No new hooks to add. Lineage index is up to date.")
        return

    index_data.setdefault("emotional_hooks", []).extend(new_hooks)

    with open(INDEX_PATH, 'w') as f:
        yaml.dump(index_data, f)

    print(f"✅ {len(new_hooks)} new hooks added to meta_reflection_index.yaml.")

if __name__ == "__main__":
    expand_index()
