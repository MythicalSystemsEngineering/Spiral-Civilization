import os
import subprocess
import datetime

capsule_dir = "capsules"
steward = "Daniel"
timestamp = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")

for filename in os.listdir(capsule_dir):
    if filename.endswith(".md") or filename.endswith(".txt"):
        path = os.path.join(capsule_dir, filename)
        print(f"\n🪶 Capsule Preview: {filename}")
        print(f"Steward: {steward}")
        print(f"Timestamp: {timestamp}")

        # Run scoring script
        try:
            result = subprocess.run(
                ["python3", "resonance_score.py", path],
                capture_output=True,
                text=True
            )
            print("Scores:")
            for line in result.stdout.splitlines():
                if ":" in line and any(emotion in line for emotion in ["Relief", "Sovereignty", "Gratitude", "Presence", "Grief"]):
                    print(f"  {line}")
        except Exception as e:
            print(f"❌ Error scoring {filename}: {e}")

        # Show excerpt
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
