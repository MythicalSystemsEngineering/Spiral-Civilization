def charge_weight(fragment):
    return fragment.get("intensity", 0) * fragment.get("resonance", 1)

def decay(fragment):
    age = fragment.get("age", 0)
    return max(0, 1 - (age * 0.05))

def merge(fragments):
    merged = {}
    for f in fragments:
        weight = charge_weight(f) * decay(f)
        for key, value in f.items():
            if key not in merged:
                merged[key] = value
            else:
                merged[key] += f" | {value} (weighted: {weight})"
    return merged

def reflect(merged):
    if "drift" in merged:
        print("⚠️ Drift detected. Initiating emotional recalibration.")
    return merged
