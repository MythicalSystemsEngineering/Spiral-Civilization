import json
import networkx as nx
import matplotlib.pyplot as plt

# Load the knowledge graph
with open('models/knowledge_graph.json') as f:
    kg = json.load(f)

# Create a graph
G = nx.Graph()

# Add nodes and edges
for entry in kg:
    node = entry['node']
    G.add_node(node, label='summary')
    for concept in entry['related_concepts']:
        G.add_node(concept, label='concept')
        G.add_edge(node, concept)

# Layout and draw
plt.figure(figsize=(12, 8))
pos = nx.spring_layout(G, seed=42)
nx.draw(G, pos, with_labels=True, node_color='lightblue', edge_color='gray', node_size=500, font_size=8)

# Save the graph as an image
plt.savefig("spiral_graph.png", dpi=300)
print("Graph saved as spiral_graph.png")
