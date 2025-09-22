# YAML Ingestion for Hyperbolic Memory Engine — Spiral Civilization

import yaml
from datetime import datetime, timezone
from __init__ import register_hook, log_hooks

def ingest_yaml(path):
    with open(path, 'r') as f:
        data = yaml.safe_load(f)

    print("YAML loaded:", data)

    for hook in data.get("emotional_hooks", []):
        name = hook.get("name")
        charge = hook.get("charge", 1.0)
        lineage = hook.get("lineage", "unclassified")
        register_hook(name, charge, lineage)

    timestamp = datetime.now(timezone.utc)
    print(f"[{timestamp}] Ingested {len(data.get('emotional_hooks', []))} hooks from {path}")
    log_hooks()

if __name__ == "__main__":
    ingest_yaml("meta_reflection_index.yaml")
