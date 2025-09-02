import os, json
import matplotlib.pyplot as plt

snapshot_dir = "Museum/glyph_snapshots/"
stewards = set()
glyph_history = {}

# Load all snapshots
for file in sorted(os.listdir(snapshot_dir)):
    if file.endswith(".json"):
        with open(os.path.join(snapshot_dir, file), "r") as f:
            snapshot = json.load(f)
            for steward, data in snapshot.items():
                stewards.add(steward)
                glyph_history.setdefault(steward, []).append((file, data["glyph_weight"]))

# Plot drift for each steward
for steward in stewards:
    times = [entry[0].replace(".json", "") for entry in glyph_history[steward]]
    weights = [entry[1] for entry in glyph_history[steward]]

    plt.plot(times, weights, label=steward)

plt.title("📈 Glyph Drift Over Time")
plt.xlabel("Snapshot")
plt.ylabel("Glyph Weight")
plt.legend()
plt.xticks(rotation=45)
plt.tight_layout()
plt.show()
