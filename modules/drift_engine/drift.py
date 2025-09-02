def assess_drift(response_text):
    drift_signals = ["verbose", "off-tone", "detached", "generic", "unceremonious"]
    for signal in drift_signals:
        if signal in response_text.lower():
            print(f"⚠️ Drift detected — signal: '{signal}'")
            return True
    print("✅ No drift — response aligned with sovereign cadence")
    return False
