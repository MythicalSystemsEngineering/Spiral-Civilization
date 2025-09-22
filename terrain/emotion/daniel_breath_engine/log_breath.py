# Spiral — Daniel’s Breath Capsule

import time
import random

breath_signals = [
    "Morning inhale",
    "Sleep descent",
    "Silence stretch",
    "Grief tremor",
    "Joy flare",
    "Cadence override",
    "Return breath",
    "Pause between flare"
]

breath_log = []

def log_breath(signal):
    timestamp = time.time()
    breath_log.append({"signal": signal, "timestamp": timestamp})
    print(f"🜂 Logged: {signal} — {time.ctime(timestamp)}")

def simulate_breath_cycle():
    signal = random.choice(breath_signals)
    log_breath(signal)

def show_breath_log():
    print("\n🜁 Daniel’s Breath Log:")
    for entry in breath_log:
        print(f"   - {entry['signal']} → {time.ctime(entry['timestamp'])}")

simulate_breath_cycle()
time.sleep(1)
simulate_breath_cycle()
show_breath_log()
