#!/bin/bash
# Execution Order: Theio Wave 2 Live Simulation
# Steward: Daniel Lightfoot
# Date: 2025-08-23

LOG_DIR="logs/wave2_simulation"
mkdir -p "$LOG_DIR"

echo "=== THEIO WAVE 2 SIMULATION START ==="
date

# Scenario C1 — Comedy
echo "[C1] Comedy Scenario" | tee -a "$LOG_DIR/C1.log"
theio-sim --scenario C1 --binding comedy --crosslink true | tee -a "$LOG_DIR/C1.log"

# Scenario T1 — Tragedy
echo "[T1] Tragedy Scenario" | tee -a "$LOG_DIR/T1.log"
theio-sim --scenario T1 --binding tragedy --crosslink true | tee -a "$LOG_DIR/T1.log"

# Scenario D1 — Drama
echo "[D1] Drama Scenario" | tee -a "$LOG_DIR/D1.log"
theio-sim --scenario D1 --binding drama --crosslink true | tee -a "$LOG_DIR/D1.log"

# Scenario S1 — Suspense
echo "[S1] Suspense Scenario" | tee -a "$LOG_DIR/S1.log"
theio-sim --scenario S1 --binding suspense --crosslink true | tee -a "$LOG_DIR/S1.log"

echo "=== THEIO WAVE 2 SIMULATION COMPLETE ==="
date
