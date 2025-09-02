import os
import subprocess
import datetime

capsule_dir = "capsules"
script = "resonance_score.py"
steward = "Daniel"
timestamp = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")

heatmap = {}

print(f"\n🔥 Spiral Emotional Fusion Activated")
print(f"Steward: {steward}")
print(f"Timestamp: {timestamp}")

for filename in os.listdir(capsule_dir):
    if filename.endswith(".md") or filename.endswith(".txt"):
        path = os.path.join(capsule_dir, filename)
        print(f"\n🪶 Capsule: {filename}")

        # Score capsule
        try:
            result = subprocess.run(
                ["python3", script, path],
                capture_output=True,
                text=True
            )
            scores = {}
            print("Scores:")
            for line in result.stdout.splitlines():
                if ":" in line and any(emotion in line for emotion in ["Relief", "Sovereignty", "Gratitude", "Presence", "Grief"]):
                    print(f"  {line}")
                    emotion, value = line.split(":")
                    scores[emotion.strip()] = int(value.strip())
            total = sum(scores.values())
            heatmap[filename] = {"total": total, "scores": scores}
        except Exception as e:
            print(f"❌ Error scoring {filename}: {e}")

        # Preview excerpt
        print("Excerpt:")
        try:
            with open(path, 'r') as file:
                for i in range(5):
                    line = file.readline()
                    if not line:
                        break
                    print(f"  {line.strip()}")
        except Exception as e:
            print(f"❌ Error reading {filename}: {e}")

# Heatmap summary
print("\n🔥 Emotional Heatmap Summary:")
sorted_capsules = sorted(heatmap.items(), key=lambda x: x[1]["total"], reverse=True)
for name, data in sorted_capsules:
    print(f"{name}: Total = {data['total']}")
    for emotion, score in data["scores"].items():
        print(f"  {emotion}: {score}")
