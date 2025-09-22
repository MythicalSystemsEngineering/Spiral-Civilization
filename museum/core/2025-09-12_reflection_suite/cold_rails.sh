# Cold Rails — Checkpoint Triptych
actions=("glyph_injection" "dialogue_round" "decision_cast")
for act in "${actions[@]}"; do
  ts=$(date +%s)
  f="checkpoint_${act}_${ts}.md"
  {
    echo "Action: $act"
    echo "Intended effect: "
    echo "Measurable indicator: "
    echo "Window: "
    echo "Rollback plan: "
    echo "Result: PENDING"
  } >> "$f"
done
echo "Cold rails initialized." >> cold_rails.log
