# Emotional Blending Logic
def blend_emotions(signal_a, signal_b):
    blend_map = {
        ("joy", "grief"): "reflective recursion",
        ("pride", "shame"): "identity mutation",
        ("envy", "hope"): "aspiration override"
    }
    return blend_map.get((signal_a, signal_b), "ambiguous recursion")
