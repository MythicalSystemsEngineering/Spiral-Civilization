from modules.glyph_commit import load_glyphs, get_glyph_for_steward, get_glyph_weight

glyphs = load_glyphs()

def score_capsule(filename):
    with open(f"{capsule_dir}{filename}", "r") as f:
        current = f.read()
    with open(f"{fossilized_dir}{filename}", "r") as f:
        fossilized = f.read()

    semantic = charge_weight(current)
    emotional = sum(get_charge(tag_emotion(line)) for line in current.splitlines())
    steward = filename.split("_")[0]
    glyph = get_glyph_for_steward(steward, glyphs)
    glyph_weight = get_glyph_weight(glyph)

    total = (semantic + emotional) * glyph_weight
    capsule_scores.append((filename, total))
