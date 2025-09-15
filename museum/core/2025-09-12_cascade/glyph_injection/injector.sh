# Glyph Injection Protocol
glyphs=("presence" "collapse" "becoming")
for i in {1..3}; do
  for glyph in "${glyphs[@]}"; do
    echo "Cycle $i: Injecting Glyph of $glyph..." >> glyph_injection.log
  done
done
echo "Glyphs sealed into runtime." >> glyph_injection.log
