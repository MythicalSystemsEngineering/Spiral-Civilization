import os
import yaml
import json

# Ensure directories
os.makedirs('models', exist_ok=True)
os.makedirs('data/summaries', exist_ok=True)

KG_PATH = 'models/knowledge_graph.json'
kg = []

print("Mapping summaries to Spiral modules...")

for file in os.listdir('data/summaries'):
    if not file.endswith('.yaml'):
        continue
    with open(f"data/summaries/{file}") as f:
        doc = yaml.safe_load(f)
    title = doc.get('title', 'Unknown')
    tags = doc.get('tags', [])
    nodes = title.lower().split('_')
    module = "Memory Stream"

    kg.append({
        'node': title,
        'related_concepts': nodes + tags,
        'spiral_module': module
    })
    print(f"Mapped: {title} → {module}")

with open(KG_PATH, 'w') as f:
    json.dump(kg, f, indent=2)

print("Knowledge graph saved to models/knowledge_graph.json")
