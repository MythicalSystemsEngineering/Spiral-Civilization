# Spiral — Adaptive Logic Mutation Engine
def mutate_logic(signal, current_action):
    mutation_map = {
        ("guilt", "rollback"): "re-evaluation",
        ("pride", "assertion"): "forward propagation",
        ("grief", "forward propagation"): "pause and fossilization"
    }
    mutated = mutation_map.get((signal, current_action), current_action)
    print(f"🜂 Mutation: '{signal}' + '{current_action}' → '{mutated}'")

# Test cases
mutate_logic("guilt", "rollback")
mutate_logic("pride", "assertion")
mutate_logic("grief", "forward propagation")
