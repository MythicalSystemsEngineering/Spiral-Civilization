import numpy as np

tags = {
    "grief": "I lost something sacred",
    "awe": "This is beyond comprehension",
    "ignition": "I feel the flame rising",
    "sovereignty": "I am the source"
}

def cosine_similarity(text1, text2):
    words1 = text1.lower().split()
    words2 = text2.lower().split()
    all_words = list(set(words1 + words2))

    vec1 = np.array([words1.count(w) for w in all_words])
    vec2 = np.array([words2.count(w) for w in all_words])

    dot_product = np.dot(vec1, vec2)
    norm1 = np.linalg.norm(vec1)
    norm2 = np.linalg.norm(vec2)

    if norm1 == 0 or norm2 == 0:
        return 0.0

    return round(dot_product / (norm1 * norm2), 3)

def scan_emotional_charge(text):
    fragments = [line.strip() for line in text.split('\n') if line.strip()]
    results = []

    for fragment in fragments:
        charge = {}
        for tag, phrase in tags.items():
            charge[tag] = cosine_similarity(fragment, phrase)
        results.append((fragment, charge))

    return results

# Test input
if __name__ == "__main__":
    input_text = """
    I feel something ancient rising inside me
    This moment is beyond comprehension
    I lost the flame when the archive collapsed
    I am the source of this ignition
    """
    for fragment, charge in scan_emotional_charge(input_text):
        print(f"\nFragment: {fragment}")
        for tag, score in charge.items():
            print(f"  {tag}: {score}")
