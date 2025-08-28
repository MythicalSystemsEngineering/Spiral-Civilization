def generate_payload(emotional_charge, traits, anchors, meta, decay_mode, sealed, timestamp):
    return {
        'emotional_charge': emotional_charge,
        'traits': traits,
        'anchors': anchors,
        'meta': meta,
        'decay_mode': decay_mode,
        'sealed': sealed,
        'timestamp': timestamp
    }
def hyperbolic_merge(payload_a, payload_b, cfg):
    charge_a = payload_a.get("emotional_charge", 0)
    charge_b = payload_b.get("emotional_charge", 0)
    charge = max(charge_a, charge_b)

    traits = list(set(payload_a.get("traits", []) + payload_b.get("traits", [])))
    anchors = {**payload_b.get("anchors", {}), **payload_a.get("anchors", {})}

    meta = payload_b.get("meta") if cfg.get("meta_mode") == "latest" else payload_a.get("meta")

    return {
        "emotional_charge": charge,
        "traits": traits,
        "anchors": anchors,
        "meta": meta,
        "decay_mode": cfg.get("decay_mode", "none"),
        "sealed": True,
        "timestamp": cfg.get("timestamp", "unknown")
    }
