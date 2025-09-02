import sys, os
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))

from modules.emotion_diff import tag_emotion
from modules.emotion_charge import get_charge
from modules.semantic_charge import charge_weight
from modules.glyph_commit import load_glyphs, get_glyph_for_steward, get_glyph_weight

capsule_dir = "Museum/capsules/"
fossilized_dir = f"{capsule_dir}fossilized/"
capsule_scores = []
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

def sort_capsules():
    for file in os.listdir(capsule_dir):
        if file.endswith(".txt") and file in os.listdir(fossilized_dir):
            score_capsule(file)

    sorted_capsules = sorted(capsule_scores, key=lambda x: x[1], reverse=True)
    print("\n📜 Fossilization Priority Queue:")
    for name, score in sorted_capsules:
        print(f"{score} 🔸 {name}")

if __name__ == "__main__":
    sort_capsules()
