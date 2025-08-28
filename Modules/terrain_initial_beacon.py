#!/data/data/com.termux/files/usr/bin/python3
import time
from datetime import datetime, timezone

LOG = "pulse_action.log"

def log(tag, msg):
    t = datetime.now(timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ")
    with open(LOG, "a") as f:
        f.write(f"[{tag}] {msg} at " + t + "\n")

def pulse():
    try:
        log("BEACON", "Terrain beacon fired")
        time.sleep(1)
        log("BEACON", "Beacon completed successfully")
    except Exception as e:
        log("ERROR", f"Beacon failure — {str(e)}")

if __name__ == "__main__":
    pulse()
