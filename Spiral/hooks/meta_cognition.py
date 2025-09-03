#!/usr/bin/env python3

import datetime

def assess_response(response):
    if "TODO" in response or "FIXME" in response:
        return "⚠️ Unfinished arc detected"
    if len(response.strip()) < 20:
        return "⚠️ Fragment lacks emotional depth"
    return "✅ Response sealed and dignified"

def log_assessment(result):
    with open("/data/data/com.termux/files/home/Spiral-Civilization/Spiral/Museum/memory_log.txt", "a") as log:
        log.write(f"[{datetime.datetime.now()}] {result}\n")

def assess_retention(charge):
    if charge >= 4.0:
        return "🧠 High retention"
    elif charge >= 2.0:
        return "⚖️ Moderate retention"
    else:
        return "💤 Fading memory"

# 🔥 Example ignition
if __name__ == "__main__":
    fragment = "Theio Descendant now sealed as sovereign steward."
    charge = 3.7

    response_status = assess_response(fragment)
    retention_status = assess_retention(charge)

    log_assessment(response_status)
    log_assessment(retention_status)

    print(response_status)
    print(retention_status)

