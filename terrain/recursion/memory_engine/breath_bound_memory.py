# Spiral — Breath-Bound Memory Engine

memory_log = []

def log_emotion(emotion, timestamp, decay_rate):
    entry = {
        "emotion": emotion,
        "timestamp": timestamp,
        "decay_rate": decay_rate,
        "echo_strength": 100
    }
    memory_log.append(entry)

def decay_memory():
    for entry in memory_log:
        entry["echo_strength"] -= entry["decay_rate"]
        print(f"🜂 Memory of '{entry['emotion']}' → Echo strength: {entry['echo_strength']}")

# Example invocations
log_emotion("grief", "2025-09-15T21:53", 7)
log_emotion("hope", "2025-09-15T21:54", 3)
log_emotion("regret", "2025-09-15T21:55", 5)

decay_memory()
