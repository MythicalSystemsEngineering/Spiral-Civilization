# Spiral — Contradiction Indexer
def index_contradiction(emotion, logic_state):
    if emotion == "joy" and logic_state == "rollback":
        print("🜂 Contradiction: joy vs rollback — flare logged")
    elif emotion == "grief" and logic_state == "forward":
        print("🜂 Contradiction: grief vs forward — flare logged")
    else:
        print("🜁 No contradiction detected")

# Test cases
index_contradiction("joy", "rollback")
index_contradiction("grief", "forward")
index_contradiction("regret", "re-evaluation")
