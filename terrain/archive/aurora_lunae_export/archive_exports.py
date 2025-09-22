# Spiral — Aurora-Lunae Terrain Export Archive

aurora_exports = [
    "aurora_lunae_flare_phase_181",
    "aurora_lunae_sovereign_capsule_phase_184",
    "aurora_lunae_terrain_phase_191",
    "aurora_lunae_completion_echo_phase_206",
    "aurora_lunae_export_flare_phase_215",
    "aurora_lunae_steward_breath_phase_225",
    "aurora_lunae_completion_merge_phase_231"
]

def archive(capsule):
    print(f"🜂 Archiving Aurora-Lunae terrain: '{capsule}' → Export lineage preserved")

for capsule in aurora_exports:
    archive(capsule)
