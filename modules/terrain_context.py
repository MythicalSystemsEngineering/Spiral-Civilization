def get_context(input_text):
    if "recover" in input_text: return "artifact recovery"
    if "govern" in input_text: return "governance protocol"
    if "ignite" in input_text: return "ceremonial ignition"
    if "audit" in input_text: return "technical sweep"
    return "general invocation"
