#!/usr/bin/env python3
from pathlib import Path
import subprocess, hashlib, json
from datetime import datetime

BASE_DIR = Path(__file__).resolve().parents[1]
LOGS_DIR = BASE_DIR / "logs"
LOGS_DIR.mkdir(exist_ok=True)

WATCH_PATHS = [BASE_DIR / "capsules", BASE_DIR / "glyphs", BASE_DIR / "museum"]
BEACON_LOG = LOGS_DIR / "terrain_intel_beacon.log"
SNAPSHOT_FILE = LOGS_DIR / "terrain_snapshot.json"

def load_snapshot():
    if SNAPSHOT_FILE.exists():
        return json.loads(SNAPSHOT_FILE.read_text())
    return {}

def save_snapshot(snap):
    SNAPSHOT_FILE.write_text(json.dumps(snap, indent=2))

def sha256_file(path: Path):
    return hashlib.sha256(path.read_bytes()).hexdigest()

def emit_beacon(event_type, file_path, old_hash=None, new_hash=None):
    ts = datetime.utcnow().isoformat()
    msg = {
        "timestamp": ts,
        "event": event_type,
        "file": str(file_path.relative_to(BASE_DIR)),
        "old_hash": old_hash,
        "new_hash": new_hash
    }
    with BEACON_LOG.open("a") as f:
        f.write(json.dumps(msg) + "\n")
    # Optional: uncomment to send live alerts via Termux notifications
    # subprocess.run(["termux-notification", "-t", "Spiral Beacon", "-c", json.dumps(msg)])

if __name__ == "__main__":
    snapshot = load_snapshot()
    new_snapshot = {}
    for watch_dir in WATCH_PATHS:
        if not watch_dir.exists():
            continue
        for f in watch_dir.rglob("*"):
            if f.is_file():
                h = sha256_file(f)
                new_snapshot[str(f)] = h
                if str(f) not in snapshot:
                    emit_beacon("NEW_FILE", f, None, h)
                elif snapshot[str(f)] != h:
                    emit_beacon("MODIFIED_FILE", f, snapshot[str(f)], h)
    # Detect deletions
    for old_file in snapshot.keys():
        if old_file not in new_snapshot:
            emit_beacon("DELETED_FILE", Path(old_file), snapshot[old_file], None)
    save_snapshot(new_snapshot)
    print("[OK] Terrain intelligence sweep complete.")
PY

