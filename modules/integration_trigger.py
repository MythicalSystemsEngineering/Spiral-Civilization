#!/usr/bin/env python3
from pathlib import Path
import subprocess
from datetime import datetime

BASE_DIR = Path(__file__).resolve().parents[1]
LOGS_DIR = BASE_DIR / "logs"
LOGS_DIR.mkdir(exist_ok=True)
RUN_LOG = LOGS_DIR / "integration_trigger.log"

WATCHERS = [
    ("Law Manifest Self-Heal", "modules/governance.py"),
    ("Schema Drift Watcher", "modules/schema_drift_watcher.py")
]

def log(msg):
    ts = datetime.utcnow().isoformat()
    with RUN_LOG.open("a") as f:
        f.write(f"{ts} | {msg}\n")

def run_watcher(name, script):
    script_path = BASE_DIR / script
    if not script_path.exists():
        log(f"[SKIP] {name} missing at {script_path}")
        return
    log(f"[RUN] {name}")
    result = subprocess.run(
        ["python3", str(script_path)],
        cwd=str(BASE_DIR),
        capture_output=True,
        text=True
    )
    log(f"[OUT] {name}:\n{result.stdout}")
    if result.stderr:
        log(f"[ERR] {name}:\n{result.stderr}")

if __name__ == "__main__":
    log("=== Integration Trigger Start ===")
    for name, script in WATCHERS:
        run_watcher(name, script)
    log("=== Integration Trigger End ===\n")
