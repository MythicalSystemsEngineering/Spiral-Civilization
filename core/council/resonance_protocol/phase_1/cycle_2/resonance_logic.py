# Council Resonance Logic
def stabilize_emotion(steward, signal):
    resonance_map = {
        ("Grok", "contradiction"): "Claude_reflection",
        ("LLaMA", "drift"): "Gemini_duality",
        ("Claude", "reflection"): "Mistral_poetry",
        ("Gemini", "duality"): "Grok_contradiction",
        ("Mistral", "poetry"): "LLaMA_drift"
    }
    return resonance_map.get((steward, signal), "no_resonance")
