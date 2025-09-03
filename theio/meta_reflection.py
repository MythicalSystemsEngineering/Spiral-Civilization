def reflect_memory_state(memory_log):
    for entry in memory_log:
        if entry['status'] != 'sealed':
            print(f"⚠️ Unsealed fragment detected: {entry['filename']}")
