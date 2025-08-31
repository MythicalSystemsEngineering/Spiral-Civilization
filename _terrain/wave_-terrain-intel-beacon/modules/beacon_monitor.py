#!/usr/bin/env python3
import time
import os
import datetime
import requests
import smtplib
from email.mime.text import MIMEText
from dotenv import load_dotenv

# ==== LOAD SECRETS ====
load_dotenv(os.path.expanduser("~/Spiral-Civilization/.env"))

LOG_PATH = os.path.expanduser("~/Spiral-Civilization/beacon.log")
ACTIONS_LOG = os.path.expanduser("~/Spiral-Civilization/pulse_actions.log")

# ==== TELEGRAM CONFIG ====
BOT_TOKEN = os.getenv("BOT_TOKEN") or "YOUR_BOT_TOKEN_HERE"
CHAT_ID = os.getenv("CHAT_ID") or "YOUR_CHAT_ID_HERE"
TELEGRAM_API = f"https://api.telegram.org/bot{BOT_TOKEN}/sendMessage"

# ==== EMAIL CONFIG ====
SMTP_SERVER = "smtp.office365.com"
SMTP_PORT = 587
EMAIL_USER = "millz.86@outlook.com"
EMAIL_PASS = os.getenv("OUTLOOK_PASS")

def send_telegram(message):
    try:
        requests.post(TELEGRAM_API, data={"chat_id": CHAT_ID, "text": message})
    except Exception as e:
        print(f"[Error] Telegram send failed: {e}")

def send_email(subject, body):
    try:
        msg = MIMEText(body)
        msg["Subject"] = subject
        msg["From"] = EMAIL_USER
        msg["To"] = EMAIL_USER
        with smtplib.SMTP(SMTP_SERVER, SMTP_PORT) as server:
            server.starttls()
            server.login(EMAIL_USER, EMAIL_PASS)
            server.send_message(msg)
    except Exception as e:
        print(f"[Error] Email send failed: {e}")

def do_microtask(pulse_line):
    now = datetime.datetime.now().isoformat()
    with open(ACTIONS_LOG, "a") as f:
        f.write(f"[{now}] Microtask triggered → {pulse_line}\n")
    alert_msg = f"🔥 Spiral Beacon Pulse @ {now} → {pulse_line}"
    send_telegram(alert_msg)
    send_email("Spiral Beacon Pulse", alert_msg)
    print(f"[Action] Logged + alerted via Telegram & Email at {now}")

def follow(file):
    file.seek(0, os.SEEK_END)
    while True:
        line = file.readline()
        if not line:
            time.sleep(1)
            continue
        yield line.strip()

def main():
    print("[Monitor] Watching beacon.log for live pulses…")
    if not os.path.exists(LOG_PATH):
        print(f"[Error] No beacon.log found at {LOG_PATH}")
        return
    with open(LOG_PATH, "r") as log:
        for line in follow(log):
            if "Terrain Initial Beacon: ONLINE" in line:
                print(f"[Monitor] Pulse detected → {line}")
                do_microtask(line)

if __name__ == "__main__":
    main()
