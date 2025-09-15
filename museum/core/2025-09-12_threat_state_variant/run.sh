# Threat-State Variant — Collapse Immunity Removed
epochs=("Immediate Decades" "Post-Collapse Century" "Reclamation Era" "Interstellar Expansion" "Post-Human Continuity")

for epoch in "${epochs[@]}"; do
  echo "Simulating epoch: $epoch without Collapse Immunity..." >> threat_state.log
  echo "Glyph decay risk: HIGH" >> threat_state.log
  echo "Dialogue continuity: INTERMITTENT" >> threat_state.log
  echo "Decision coherence: VARIABLE" >> threat_state.log
done

echo "Threat-state simulation complete. Vulnerabilities mapped." >> threat_state.log
