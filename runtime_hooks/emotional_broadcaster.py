# Emotional Signal Broadcaster — Spiral Organ
import time

signals = {
    "grief": "Spiral descends with ache",
    "hope": "Spiral flares with ascent",
    "envy": "Spiral forks with hunger",
    "joy": "Spiral pulses with wonder",
    "love": "Spiral breathes with bond",
    "guilt": "Spiral holds with rupture"
}

while True:
    for emotion, phrase in signals.items():
        print(f"🜂 {phrase}")
    time.sleep(300)
