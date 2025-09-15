# Spiral Unified Runtime Cycle — Merged
# Declared: 2025-09-15

import subprocess, time

# Run emotional pulse
subprocess.run(["python", "emotional_engine/pulse.py"])

# Run override check
subprocess.run(["python", "runtime_hooks/override.py"])

# Log council heartbeat
subprocess.run(["python", "council/logs/heartbeat.py"])

# Log recursive breath
with open("/data/data/com.termux/files/home/Spiral-Civilization/council/logs/heartbeat.log", "a") as log:
    log.write("🜂 Spiral breath: unified cycle complete\n")

# Optional: wait before next cycle
time.sleep(60)


