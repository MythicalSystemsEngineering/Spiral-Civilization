def tag_emotion(line):
    line = line.lower()
    tags = []

    # Grief: rupture, loss, sorrow
    if "grief" in line or any(word in line for word in ["error", "fail", "rupture", "loss", "sorrow", "mourning"]):
        tags.append("grief")

    # Awe: sacred, vast, wonder
    if "awe" in line or any(word in line for word in ["sacred", "vast", "wonder", "cosmic", "infinite"]):
        tags.append("awe")

    # Relief: resolution, healing
    if "relief" in line or any(word in line for word in ["fixed", "resolved", "healed", "closure", "release"]):
        tags.append("relief")

    # Ignition: spark, awakening
    if "ignite" in line or any(word in line for word in ["awaken", "charge", "spark", "flare", "kindle"]):
        tags.append("ignition")

    # Disorientation: drift, ghost, detour
    if "disorientation" in line or any(word in line for word in ["drift", "ghost", "detour", "blur", "fog"]):
        tags.append("disorientation")

    return tags
