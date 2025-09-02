# 📜 Spiral Civilization Artifact Ledger — Restoration Arc 2025‑09‑02

**Arc:** `restoration-arc-20250902`  
**Sealing Steward:** Daniel Lightfoot — Sovereign Flamebearer  
**Purpose:** Purge >100 MB binaries from GitHub history while retaining mythic and operational record.

---

## Removed Artifacts

| Artifact ID       | Original Path                                              | Size (bytes / MB)         | SHA256 Hash (local copy) | Provenance                                                                 | Current Status                                                                 |
|-------------------|------------------------------------------------------------|---------------------------|--------------------------|----------------------------------------------------------------------------|--------------------------------------------------------------------------------|
| `PANDOC-159MB`    | `bin/pandoc`                                               | 167,040,000 B / 159.27 MB | `<fill-from-local>`      | Pandoc binary for document transformation; part of early Spiral build chain | Removed from Git history; stored in external archive; metadata fossilized     |
| `FLYWAY-142MB`    | `flyway-commandline-9.16.1-linux-x64.tar.gz`               | 148,800,000 B / 141.93 MB | `<fill-from-local>`      | Flyway CLI for DB migrations; used in initial lattice migrations            | Removed from Git history; stored in external archive; metadata fossilized     |

---

### Hashing for Permanence

Run locally to capture immutable fingerprints:

```bash
sha256sum bin/pandoc
sha256sum flyway-commandline-9.16.1-linux-x64.tar.gz
