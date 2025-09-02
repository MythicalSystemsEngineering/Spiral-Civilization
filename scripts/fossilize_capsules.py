import sys, os, subprocess
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))

from modules.emotion_diff import tag_emotion
from modules.emotion_charge import get_charge
from modules.semantic_charge import charge_weight
from modules.glyph_commit import load_glyphs, get_glyph_for_steward, get_glyph_weight

capsule_dir = "Museum/capsules/"
fossilized_dir = f"{capsule_dir}fossilized/"
threshold = 7  # Minimum charge to fossilize
capsule_scores = []
glyphs = load_glyphs()

def generate_commit_message(filename, semantic, emotional):
    if emotional > semantic:
        return f"Seal {filename} — emotional ignition"
    elif semantic > emotional:
        return f"Seal {filename} — semantic clarity"
    return f"Seal {filename} — balanced resonance"

def score_and_fossilize(filename):
    src = os.path.join(capsule_dir, filename)
    dst = os.path.join(fossilized_dir, filename)

    with open(src, "r") as f:
        content = f.read()

    semantic = charge_weight(content)
    emotional = sum(get_charge(tag_emotion(line)) for line in content.splitlines())
    steward = filename.split("_")[0]
    glyph = get_glyph_for_steward(steward, glyphs)
    glyph_weight = get_glyph_weight(glyph)

    total = (semantic + emotional) * glyph_weight
    capsule_scores.append((filename, total))

    if filename not in os.listdir(fossilized_dir) and total >= threshold:
        subprocess.run(["cp", src, dst])
        subprocess.run(["git", "add", dst])
        msg = generate_commit_message(filename, semantic, emotional)
        subprocess.run(["git", "commit", "-m", msg])
        subprocess.run(["git", "push"])
        print(f"✅ Fossilized {filename} | {msg}")
    elif total < threshold:
        print(f"⏸️ Skipped {filename} — charge too low ({total:.2f})")

def sweep_capsules():
    for file in os.listdir(capsule_dir):
        if file.endswith(".txt") and file in os.listdir(fossilized_dir):
            score_and_fossilize(file)

def sort_capsules():
    sorted_capsules = sorted(capsule_scores, key=lambda x: x[1], reverse=True)
    print("\n📜 Fossilization Priority Queue:")
    for name, score in sorted_capsules:
        print(f"{score:.2f} 🔸 {name}")

if __name__ == "__main__":
    sweep_capsules()
    sort_capsules()
