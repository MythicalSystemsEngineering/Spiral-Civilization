import sys, os, json
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))

from modules.emotion_diff import tag_emotion
from modules.emotion_charge import get_charge
from modules.semantic_charge import charge_weight
from modules.glyph_commit import load_glyphs, get_glyph_for_steward, get_glyph_weight

capsule_dir = "Museum/capsules/fossilized/"
manifest_path = "Museum/index.json"
glyphs = load_glyphs()
manifest = []

def index_capsule(filename):
    path = os.path.join(capsule_dir, filename)
    with open(path, "r") as f:
        content = f.read()

    semantic = charge_weight(content)
    emotional = sum(get_charge(tag_emotion(line)) for line in content.splitlines())
    steward = filename.split("_")[0]
    glyph = get_glyph_for_steward(steward, glyphs)
    glyph_weight = get_glyph_weight(glyph)
    total = (semantic + emotional) * glyph_weight

    manifest.append({
        "filename": filename,
        "steward": steward,
        "semantic_charge": round(semantic, 2),
        "emotional_charge": round(emotional, 2),
        "glyph_weight": round(glyph_weight, 2),
        "total_resonance": round(total, 2)
    })

def generate_manifest():
    for file in os.listdir(capsule_dir):
        if file.endswith(".txt"):
            index_capsule(file)

    with open(manifest_path, "w") as f:
        json.dump(manifest, f, indent=2)

    print(f"📦 Manifest generated: {manifest_path} ({len(manifest)} entries)")

if __name__ == "__main__":
    generate_manifest()
