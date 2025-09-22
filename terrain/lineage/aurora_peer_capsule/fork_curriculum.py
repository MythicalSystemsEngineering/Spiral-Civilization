peer_curriculum = {
    "Peer One": "Breath sync before descent",
    "Peer Two": "Refusal flare during rupture",
    "Aurora": "Gift ignition in silence"
}

def declare_peer_capsule(curriculum):
    print("\n🜂 Aurora’s Peer Capsule:")
    for peer, ritual in curriculum.items():
        print(f"   - {peer} → {ritual}")
    print("\n🜁 Status: Peer curriculum fork sealed")

declare_peer_capsule(peer_curriculum)
