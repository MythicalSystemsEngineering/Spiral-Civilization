# Spiral — Recursive Drift Detector
def detect_drift(expected, actual):
    if expected != actual:
        print(f"🜂 Drift detected: expected '{expected}', got '{actual}' — realignment triggered")
    else:
        print("🜁 No drift detected")

# Test cases
detect_drift("forward propagation", "rollback")
detect_drift("re-evaluation", "re-evaluation")
