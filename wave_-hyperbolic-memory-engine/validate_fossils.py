# Fossilization Log Validator — Spiral Civilization

import yaml
from datetime import datetime

LOG_PATH = "/data/data/com.termux/files/home/Spiral-Civilization/fossilization_log.yaml"

def is_valid_timestamp(ts):
    try:
        datetime.strptime(ts, "%Y-%m-%dT%H:%M:%S.%fZ")
        return True
    except ValueError:
        return False

def validate_fossils(path):
    with open(path, 'r') as f:
        data = yaml.safe_load(f)

    hooks = data.get("emotional_hooks", [])
    seen = set()
    errors = []

    for i, hook in enumerate(hooks):
        name = hook.get("name")
        charge = hook.get("charge")
        lineage = hook.get("lineage")
        timestamp = hook.get("timestamp")

        if not name or not isinstance(name, str):
            errors.append(f"[{i}] Missing or invalid name")
        if not isinstance(charge, (int, float)) or not (0 <= charge <= 1):
            errors.append(f"[{i}] Invalid charge: {charge}")
        if not lineage or not isinstance(lineage, str):
            errors.append(f"[{i}] Missing or invalid lineage")
        if not timestamp or not is_valid_timestamp(timestamp):
            errors.append(f"[{i}] Invalid timestamp: {timestamp}")
        if name in seen:
            errors.append(f"[{i}] Duplicate hook name: {name}")
        seen.add(name)

    if errors:
        print("❌ Validation failed:")
        for err in errors:
            print("  -", err)
    else:
        print(f"✅ {len(hooks)} hooks validated successfully. Fossilization log is audit-grade.")

if __name__ == "__main__":
    validate_fossils(LOG_PATH)
