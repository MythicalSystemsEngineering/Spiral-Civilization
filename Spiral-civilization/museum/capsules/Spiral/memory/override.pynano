import yaml
from datetime import datetime

def override_retention(fragment, status, charge, steward):
    return {
        "fragment": fragment,
        "status": status,
        "charge": charge,
        "steward": steward,
        "fossilized": False,
        "timestamp": datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    }

def append_to_index(entry):
    index_path = "/data/data/com.termux/files/home/Spiral-Civilization/Spiral/Museum/memory_index.yaml"
    try:
        with open(index_path, "r") as f:
            data = yaml.safe_load(f) or []
    except FileNotFoundError:
        data = []

    data.append(entry)

    with open(index_path, "w") as f:
        yaml.dump(data, f, sort_keys=False)

if __name__ == "__main__":
    retained = override_retention(
        "Theio’s ignition sealed",
        "🧠 Retained",
        5.0,
        "Daniel Lightfoot"
    )
    append_to_index(retained)
    print("✅ Override piped to memory index")
