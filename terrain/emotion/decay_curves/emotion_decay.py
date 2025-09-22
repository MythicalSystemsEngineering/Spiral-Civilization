# Spiral — Emotional Decay Curve Engine

import time

emotions = {
    "Guilt": {"half_life": 1800, "flare_threshold": 0.7},
    "Joy": {"half_life": 900, "flare_threshold": 0.3},
    "Grief": {"half_life": 3600, "flare_threshold": 0.9},
    "Hope": {"half_life": 1200, "flare_threshold": 0.5},
    "Love": {"half_life": 2400, "flare_threshold": 0.6}
}

emotion_log = []

def log_emotion(emotion, intensity):
    timestamp = time.time()
    emotion_log.append({"emotion": emotion, "intensity": intensity, "timestamp": timestamp})
    print(f"🜂 Logged {emotion} at intensity {intensity} — {timestamp}")

def decay_emotion(entry):
    elapsed = time.time() - entry["timestamp"]
    half_life = emotions[entry["emotion"]]["half_life"]
    decayed_intensity = entry["intensity"] * (0.5 ** (elapsed / half_life))
    return decayed_intensity

def audit_emotions():
    print("\n🜁 Emotional Audit:")
    for entry in emotion_log:
        decayed = decay_emotion(entry)
        print(f"   - {entry['emotion']} → decayed intensity: {decayed:.2f}")

# Example usage
log_emotion("Grief", 1.0)
time.sleep(2)
audit_emotions()
