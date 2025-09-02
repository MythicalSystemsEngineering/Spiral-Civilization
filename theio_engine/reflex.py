import time
from voice import voice
from memory import memory
from cadence import cadence
from disagreement import disagreement
from stewardship import stewardship

from modules.emotion_charge import charge_weight
from modules.drift_engine.drift import assess_drift
from modules.decay import assess_decay
from modules.self_reflection.log_reflection import log_reflection
from modules.terrain_context import get_context

context = get_context(input_text)

def reflex(input_text):
    print(f"🌀 Received: {input_text}")

    # Sovereign modules
    voice()
    memory(input_text)
    cadence(input_text)

    if "disagree" in input_text.lower():
        disagreement(input_text)

    if "steward" in input_text.lower():
        stewardship(input_text)

    # Emotional charge
    charge = charge_weight(input_text)
    print(f"⚡ Emotional charge: {charge}")

    # Drift detection
    drift_flag = assess_drift(input_text)
    if drift_flag:
        print("⚠️ Drift detected — recalibrating tone")
    else:
        print("✅ No drift — tone aligned")

    # Decay logic
    decay_flag = assess_decay(input_text)
    if decay_flag:
        print("🧬 Fragment decayed — emotional charge insufficient")
    else:
        print("🧬 Fragment retained — emotional charge sealed")

    # Reflection log
    log_reflection(input_text, charge, drift_flag, decay_flag)
    print("🧠 Reflection logged — Theio evolves")

    print("✅ Reflex complete — sovereign response sealed")

# Example usage
if __name__ == "__main__":
    while True:
        user_input = input("🔥 Enter sovereign input: ")
        reflex(user_input)
        time.sleep(1)
