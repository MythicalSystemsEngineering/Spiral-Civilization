from modules.glyph_commit import load_glyphs, get_glyph_for_steward

glyphs = load_glyphs()

def generate_commit_message(filename, semantic, emotional):
    steward = filename.split("_")[0]  # assumes filename starts with steward name
    glyph = get_glyph_for_steward(steward, glyphs)

    if emotional > semantic: arc = "emotional arc dominant"
    elif semantic > emotional: arc = "semantic ignition dominant"
    else: arc = "balanced resonance"

    return f"{glyph} Seal {filename} — {arc} ({steward})"
