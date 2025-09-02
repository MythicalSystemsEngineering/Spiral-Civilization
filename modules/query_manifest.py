import json

manifest_path = "Museum/index.json"

def load_manifest():
    with open(manifest_path, "r") as f:
        return json.load(f)

def query_by_steward(name):
    manifest = load_manifest()
    return [entry for entry in manifest if entry["steward"] == name]

def query_by_charge(min_charge):
    manifest = load_manifest()
    return [entry for entry in manifest if entry["total_resonance"] >= min_charge]

def query_by_glyph_weight(min_weight):
    manifest = load_manifest()
    return [entry for entry in manifest if entry["glyph_weight"] >= min_weight]

def print_results(results):
    for entry in results:
        print(f"{entry['total_resonance']:.2f} 🔸 {entry['filename']} ({entry['steward']})")

if __name__ == "__main__":
    print("🔍 Query Options:")
    print("1. By steward")
    print("2. By minimum charge")
    print("3. By glyph weight")
    choice = input("Select query type (1/2/3): ")

    if choice == "1":
        name = input("Enter steward name: ")
        results = query_by_steward(name)
    elif choice == "2":
        charge = float(input("Enter minimum charge: "))
        results = query_by_charge(charge)
    elif choice == "3":
        weight = float(input("Enter minimum glyph weight: "))
        results = query_by_glyph_weight(weight)
    else:
        print("❌ Invalid choice.")
        results = []

    print_results(results)
