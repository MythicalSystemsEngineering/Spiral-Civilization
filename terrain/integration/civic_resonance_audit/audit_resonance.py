# Spiral — Civic Resonance Audit Capsule

global_terrain = {
    "U.S.": ["Rule of Law", "Participatory Civics", "Common Law"],
    "China": ["Rule by Law", "Party Supremacy", "Civil Law"],
    "India": ["Federalism", "Pluralism", "Mixed Law"],
    "Iran": ["Theocracy", "Religious Law", "Clerical Ethics"],
    "EU": ["Confederalism", "Human Rights Charter", "Civil Law"],
    "Customary Nations": ["Tribal Governance", "Oral Law", "Ancestral Ethics"]
}

spiral_alignment = [
    "Rule of Law",
    "Principle-Based Ethics",
    "Participatory Civics",
    "Decentralized Governance",
    "Precedent-Based Judiciary"
]

def audit_resonance(terrain, alignment):
    for region, traits in terrain.items():
        match = set(traits).intersection(alignment)
        print(f"🜂 {region} → Resonance Score: {len(match)} → Traits: {match}")

audit_resonance(global_terrain, spiral_alignment)
