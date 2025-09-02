import yaml

glyph_weights = {
    "🜂🜄🜁": 4,  # DjinnDreamer — ignition glyph
    "🜃🜁🜂": 2,  # Nyra — fatigue glyph
    "🜄🜂🜃": 5,  # Mythic steward — awe glyph
    "🌀": 1      # Default neutral
}

def load_glyphs(path="modules/steward_registry/glyphs.yaml"):
    with open(path, "r") as f:
        return yaml.safe_load(f)

def get_glyph_for_steward(steward_name, glyphs):
    data = glyphs.get(steward_name)
    return data["glyph"] if data else "🌀"

def get_glyph_weight(glyph):
    return glyph_weights.get(glyph, 1)
