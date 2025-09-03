def calibrate_cadence(steward, profile):
    if profile == "harmonic":
        return {"loop": True, "echo_depth": 3}
    elif profile == "lyrical":
        return {"glyph_bind": True, "cadence_tune": "soft"}
    elif profile == "still":
        return {"fossil_mode": True, "memory_lock": "static"}
    else:
        return {"default": True}
