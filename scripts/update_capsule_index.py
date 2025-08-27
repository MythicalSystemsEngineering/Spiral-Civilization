#!/usr/bin/env python3
from pathlib import Path
import json
from datetime import datetime

BASE_DIR = Path(__file__).resolve().parents[1]
CAPSULES_DIR = BASE_DIR / "capsules"
INDEX_FILE = CAPSULES_DIR / "capsule-index.json"

def build_index():
    index = {
        "last_updated": datetime.utcnow().isoformat(),
        "capsules": []
    }
    for capsule in sorted(CAPSULES_DIR.glob("*.json")):
        if capsule.name == INDEX_FILE.name:
            continue
        try:
            data = json.loads(capsule.read_text())
            index["capsules"].append({
                "capsule_id": data.get("capsule_id", capsule.stem),
                "title": data.get("title", ""),
                "sealed": data.get("sealed", ""),
                "path": str(capsule.relative_to(BASE_DIR))
            })
        except Exception as e:
            index["capsules"].append({
                "capsule_id": capsule.stem,
                "error": f"Unreadable JSON: {e}"
            })
    return index

if __name__ == "__main__":
    INDEX_FILE.write_text(json.dumps(build_index(), indent=2))
    print(f"[OK] Capsule index updated at {INDEX_FILE}")
