def merge_fragments(fragments):
    sorted_fragments = sorted(fragments, key=lambda x: x['emotional_charge'], reverse=True)
    return [f for f in sorted_fragments if f['decay_profile'] != 'expired']
