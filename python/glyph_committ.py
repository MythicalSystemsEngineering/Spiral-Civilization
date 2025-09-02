glyph_weights = {
    "🜂🜄🜁": 4,  # DjinnDreamer — ignition glyph
    "🜃🜁🜂": 2,  # Nyra — fatigue glyph
    "🜄🜂🜃": 5,  # Mythic steward — awe glyph
    "🌀": 1      # Default neutral
}

def get_glyph_weight(glyph):
    return glyph_weights.get(glyph, 1)
