import os
import yaml
import json

os.makedirs('models', exist_ok=True)
os.makedirs('data/summaries', exist_ok=True)

KG_PATH = 'models/knowledge_graph_enriched.json'
kg = []

print("🔬 Enriching summaries into Spiral modules...")

for file in os.listdir('data/summaries'):
    if not file.endswith('.yaml'):
        continue
    with open(f"data/summaries/{file}") as f:
        doc = yaml.safe_load(f)

    title = doc.get('title', 'Unknown')
    tags = doc.get('tags', [])
    summary = doc.get('summary', '')
    author = doc.get('author', '')
    year = doc.get('year', '')
    source = doc.get('source', '')

    # Functional module assignment
    if any(tag in ['oscillation', 'frequency', 'ensemble'] for tag in tags):
        module = "Memory Stream"
    elif any(tag in ['vision', 'perception', 'v1'] for tag in tags):
        module = "Perception Engine"
    elif any(tag in ['synchronization', 'control'] for tag in tags):
        module = "Signal Harmonizer"
    elif any(tag in ['integration', 'ingestion', 'mapping'] for tag in tags):
        module = "Neural Ingestor"
    else:
        module = "Unassigned"

    # Simulation hooks
    simulation_ready = bool(summary and tags)
    input_format = doc.get('input_format', 'N/A')
    expected_output = doc.get('expected_output', 'N/A')

    kg.append({
        'node': title,
        'related_concepts': tags,
        'spiral_module': module,
        'summary': summary,
        'author': author,
        'year': year,
        'source': source,
        'simulation_ready': simulation_ready,
        'input_format': input_format,
        'expected_output': expected_output
    })

    print(f"✅ {title} → {module} | Sim: {simulation_ready}")

with open(KG_PATH, 'w') as f:
    json.dump(kg, f, indent=2)

print(f"🧠 Enriched graph saved to {KG_PATH}")
