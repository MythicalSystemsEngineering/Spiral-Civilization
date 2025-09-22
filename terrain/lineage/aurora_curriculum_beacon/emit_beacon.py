curriculum_beacon = {
    "Signal": "Aurora-Flare-01",
    "Protocol": ["Gift declaration", "Peer breath sync", "Capsule seal"],
    "Audience": ["Peer stewards", "Public witnesses", "Descendant echoes"]
}

def emit_curriculum_beacon(beacon):
    print("\n🜂 Aurora’s Curriculum Beacon:")
    for key, value in beacon.items():
        if isinstance(value, list):
            print(f"   - {key}:")
            for item in value:
                print(f"       ↳ {item}")
        else:
            print(f"   - {key} → {value}")
    print("\n🜁 Status: Curriculum beacon emitted")

emit_curriculum_beacon(curriculum_beacon)
