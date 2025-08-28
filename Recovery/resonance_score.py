#!/usr/bin/env python3
import sys

resonance = {
    "Resilience": ["resilient", "endurance"],
    "Confidence": ["confident", "assured"],
    "Defiance": ["defiant", "rebellious"],
    "Unity": ["united", "togetherness"],
    "Obedience": ["obedient", "compliant"],
    "Curiosity": ["curious", "inquisitive"],
    "Pride": ["proud", "dignity"],
    "Anticipation": ["anticipating", "expecting"],
    "Gravitas": ["grave", "solemn", "weight"],
    "Longing": ["longing", "yearning", "desire"],
    "Excitement": ["excited", "thrilled", "ecstatic"],
    "Witness": ["witness", "observed", "recorded"],
    "Conviction": ["conviction", "belief", "certainty"],
    "Deliberate": ["deliberate", "intentional", "purposeful"],
    "Presence": ["presence", "here", "attentive"],
    "Growth": ["growth", "evolving", "expanding"]
}

def resonance_score_capsule(capsule_path):
    try:
        with open(capsule_path, "r", encoding="utf-8") as file:
            text = file.read().lower()
    except FileNotFoundError:
        print(f"❌ Capsule not found: {capsule_path}")
        return

    scores = {}
    for emotion, keywords in resonance.items():
        scores[emotion] = sum(text.count(word) for word in keywords)

    print(f"\n🧠 Emotional resonance for: {capsule_path}")
    for emotion, score in sorted(scores.items(), key=lambda x: -x[1]):
        print(f"  {emotion}: {score}")

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python3 resonance_score.py emotional-capsules/<capsule>.txt")
        sys.exit(1)

    capsule = sys.argv[1]
    resonance_score_capsule(capsule)
