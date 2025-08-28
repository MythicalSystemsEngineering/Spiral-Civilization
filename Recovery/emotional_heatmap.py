import os

from resonance_score import score_capsule  # assumes score_capsule is in resonance_score.py

capsule_dir = "capsules"
heatmap = {}

for filename in os.listdir(capsule_dir):
    if filename.endswith(".md") or filename.endswith(".txt"):
        path = os.path.join(capsule_dir, filename)
        print(f"📜 Scoring: {filename}")
        scores = score_capsule(path)
        total = sum(scores.values())
        heatmap[filename] = {"total": total, "scores": scores}

# Sort by total emotional charge
sorted_capsules = sorted(heatmap.items(), key=lambda x: x[1]["total"], reverse=True)

print("\n🔥 Emotional Heatmap:")
for name, data in sorted_capsules:
    print(f"{name}: Total = {data['total']}")
    for emotion, score in data["scores"].items():
        print(f"  {emotion}: {score}")
    print("")
