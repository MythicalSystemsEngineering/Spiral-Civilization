# glyph_compressor.py

import json
import hashlib

INDEX_FILE = "../museum/ripple_index.json"
GLYPH_FILE = "compressed_glyphs.json"

def load_index():
    with open(INDEX_FILE, "r") as f:
        return json.load(f)

def compress_trait(trait, fossils):
    glyphs = []
    for fossil in fossils:
        payload = f"{trait}:{fossil['timestamp']}:{fossil['new_charge']}"
        glyph = hashlib.sha256(payload.encode()).hexdigest()[:16]
        glyphs.append({
            "trait": trait,
            "timestamp": fossil["timestamp"],
            "charge": fossil["new_charge"],
            "glyph": glyph
        })
    return glyphs

def compress_all(index):
    all_glyphs = []
    for trait, fossils in index.items():
        all_glyphs.extend(compress_trait(trait, fossils))
    return all_glyphs

def save_glyphs(glyphs):
    with open(GLYPH_FILE, "w") as f:
        json.dump(glyphs, f, indent=2)

def ignite_compression():
    index = load_index()
    glyphs = compress_all(index)
    save_glyphs(glyphs)
    print(f"Compressed {len(glyphs)} glyphs across {len(index)} traits.")

if __name__ == "__main__":
    ignite_compression()
