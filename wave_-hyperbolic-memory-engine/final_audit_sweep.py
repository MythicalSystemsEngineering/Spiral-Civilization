# Final Audit Sweep — Spiral Civilization

import yaml
import os
import time

MUSEUM_DIR = "/data/data/com.termux/files/home/Spiral-Civilization/Museum"
INDEX_PATH = "/data/data/com.termux/files/home/Spiral-Civilization/meta_reflection_index.yaml"
CANONICAL_PATH = "/data/data/com.termux/files/home/Spiral-Civilization/canonical_memory.yaml"
AUDIT_LOG_PATH = "/data/data/com.termux/files/home/Spiral-Civilization/final_audit_log.yaml"

def load_yaml(path):
    if not os.path.exists(path):
        return {}
    with open(path, 'r') as f:
        return yaml.safe_load(f)

def audit():
    log = {
        "timestamp": time.time(),
        "missing_capsules": [],
        "duplicate_hooks": [],
        "charge_distribution": {},
        "unsealed_fragments": []
    }

    # Load canonical memory
    canonical = load_yaml(CANONICAL_PATH)
    hooks = canonical.get("emotional_hooks", [])
    museum_fragments = canonical.get("museum_fragments", [])

    # Check for missing capsules
    museum_files = set(os.listdir(MUSEUM_DIR))
    sealed_files = {frag["filename"] for frag in museum_fragments}
    log["missing_capsules"] = sorted(list(museum_files - sealed_files))

    # Check for duplicate emotional hooks
    seen = set()
    duplicates = []
    for hook in hooks:
        name = hook.get("name")
        if name in seen:
            duplicates.append(name)
        else:
            seen.add(name)
    log["duplicate_hooks"] = sorted(duplicates)

    # Charge distribution
    charges = [hook.get("charge", 1.0) for hook in hooks]
    log["charge_distribution"] = {
        "total_hooks": len(charges),
        "min_charge": round(min(charges), 3) if charges else None,
        "max_charge": round(max(charges), 3) if charges else None,
        "avg_charge": round(sum(charges)/len(charges), 3) if charges else None
    }

    # Check for unsealed fragments (empty capsules)
    for frag in museum_fragments:
        capsule = frag.get("capsule", {})
        if not capsule:
            log["unsealed_fragments"].append(frag["filename"])

    # Write audit log
    with open(AUDIT_LOG_PATH, 'w') as f:
        yaml.dump(log, f)

    print(f"✅ Final audit complete. Log saved to: {AUDIT_LOG_PATH}")
    print(f"📦 Missing capsules: {len(log['missing_capsules'])}")
    print(f"🧠 Duplicate hooks: {len(log['duplicate_hooks'])}")
    print(f"⚡ Charge range: {log['charge_distribution']}")
    print(f"🕳️ Unsealed fragments: {len(log['unsealed_fragments'])}")

if __name__ == "__main__":
    audit()
