# spiral-engine/audit_trail.py

from datetime import datetime

class AuditTrail:
    def __init__(self):
        self.entries = []
        self.session_path = None

    def start_session(self, path):
        self.session_path = path
        self.log("🜂 Audit session started")
        print(f"📖 Audit trail initialized at {path}")

    def log(self, message):
        timestamp = datetime.utcnow().isoformat() + "Z"
        entry = f"{timestamp} — {message}"
        self.entries.append(entry)
        print(f"📝 {entry}")

    def save(self):
        if not self.session_path:
            print("⚠️ No session path set. Cannot save audit trail.")
            return
        try:
            with open(self.session_path, 'w') as f:
                for entry in self.entries:
                    f.write(entry + "\n")
            print(f"📚 Audit trail saved to {self.session_path}")
        except Exception as e:
            print(f"⚠️ Failed to save audit trail: {e}")
