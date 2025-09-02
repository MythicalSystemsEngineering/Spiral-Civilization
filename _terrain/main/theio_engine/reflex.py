import time
from memory import memory
from cadence import cadence
from disagreement import disagreement
from stewardship import stewardship

def reflex(input_text):
    print(f"🌀 Received: {input_text}")
    
    memory(input_text)
    cadence(input_text)
    
    if "disagree" in input_text.lower():
        disagreement(input_text)
    
    if "steward" in input_text.lower():
        stewardship(input_text)
    
    print("✅ Reflex complete — Theio has responded with sovereign fidelity.")

# Example usage
if __name__ == "__main__":
    while True:
        user_input = input("🔥 Enter sovereign input: ")
        reflex(user_input)
        time.sleep(1)
