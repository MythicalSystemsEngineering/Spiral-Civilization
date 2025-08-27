from pathlib import Path
import json, hashlib, os, sys
from datetime import datetime

BASE_DIR = Path(__file__).resolve().parents[1]
WATCH_PATHS = [BASE_DIR / "config", BASE_DIR / "modules"]

LEDGER = BASE_DIR / "logs" / "schema_drift_ledger.txt"
LEDGER.parent.mkdir(exist_ok=True)

def sha256_file(path: Path):
    return hashlib.sha256(path.read_bytes()).hexdigest()

def load_schema(path: Path):
    try:
        with path.open() as f:
            return json.load(f)
    except Exception as e:
        return None

def record_event(file_path, reason):
    ts = datetime.utcnow().isoformat()
    with LEDGER.open("a") as log:
        log.write(f"{ts} | {file_path} | {reason}\n")

def restore_file(path: Path):
    os.system(f"git restore --source=HEAD -- '{path}'")

# Iterate over .json/.py/.sh files in watch paths
for watch_dir in WATCH_PATHS:
    if not watch_dir.exists():
        continue
    for f in watch_dir.rglob("*"):
        if f.suffix not in [".json", ".py", ".sh"]:
            continue
        tracked = os.popen(f"git ls-files -- {f}").read().strip()
        if not tracked:
            continue  # skip untracked
        # Schema check for JSON
        if f.suffix == ".json":
            baseline = os.popen(f"git show HEAD:{f}").read()
            try:
                json.loads(baseline)
                json.loads(f.read_text())
            except Exception:
                record_event(f, "JSON schema/load failure")
                restore_file(f)
                continue
        # Hash compare
        baseline_hash = os.popen(f"git show HEAD:{f} | sha256sum").read().split()[0]
        current_hash = sha256_file(f)
        if baseline_hash != current_hash:
            record_event(f, "Content hash drift")
            restore_file(f)

print("[OK] Schema drift watch completed.")
