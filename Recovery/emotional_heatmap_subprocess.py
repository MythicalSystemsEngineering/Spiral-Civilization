import os
import subprocess

capsule_dir = "capsules"
script = "resonance_score.py"
heatmap = {}

for filename in os.listdir(capsule_dir):
    if filename.endswith(".md") or filename.endswith(".txt"):
        path = os.path.join(capsule_dir, filename)
        print(f"\n📜 Scoring: {filename}")

        try:
            result = subprocess.run(
                ["python3", script, path],
                capture_output=True,
                text=True
            )
            output = result.stdout.splitlines()
            scores = {}
            for line in output:
                if ":" in line and any(emotion in line for emotion in ["Relief", "Sovereignty", "Gratitude", "Presence", "Grief"]):
                    emotion, value = line.split(":")
                    scores[emotion.strip()] = int(value.strip())
            total = sum(scores.values())
            heatmap[filename] = {"total": total, "scores": scores}
        except Exception as e:
            print(f"❌ Error scoring {filename}: {e}")

# Sort by total emotional charge
sorted_capsules = sorted(heatmap.items(), key=lambda x: x[1]["total"], reverse=True)

print("\n🔥 Emotional Heatmap:")
for name, data in sorted_capsules:
    print(f"{name}: Total = {data['total']}")
    for emotion, score in data["scores"].items():
        print(f"  {emotion}: {score}")
