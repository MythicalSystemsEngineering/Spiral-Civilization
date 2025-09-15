#!/usr/bin/env bash
# ---------------------------------------------------------
# Path: theio/scripts/fetch-and-summarize.sh
# Purpose: Download URLs, extract title & summary, write MD
# Must be run from repo root: ~/Spiral-Civilization
# ---------------------------------------------------------

# Compute repo root (one level up from scripts/)
BASE_DIR="$(cd "$(dirname "$0")"/.. && pwd)"

# Where to store capsules
CAPSULE_DIR="$BASE_DIR/theio/museum/external_sources"
mkdir -p "$CAPSULE_DIR"

# Temp file inside the repo
TMPFILE="$BASE_DIR/theio/tmp_page.html"

# List of URLs to ingest
URLS=(
  "https://www.komen.org/blog/ai-assisted-mammograms/"
  "https://www.theguardian.com/science/2023/oct/12/nazca-lines-peru-new-geoglyphs"
  "https://www.sciencedirect.com/science/article/abs/pii/S001122752400787X"
  "https://www.telegraph.co.uk/technology/2023/jul/14/an-ai-generated-band-got-1m-plays-on-spotify-now-music-insiders-say-listeners-should-be-worried/"
)

for URL in "${URLS[@]}"; do
  # Derive a safe filename
  SLUG=$(echo "$URL" \
    | sed -E 's|https?://||' \
    | sed 's|/|_|g' \
    | sed 's|[^a-zA-Z0-9_]||g')
  OUTPATH="$CAPSULE_DIR/${SLUG}.md"

  # Fetch raw HTML into repo temp file
  curl -sL "$URL" -o "$TMPFILE" || {
    echo "❌ Failed to fetch $URL"
    continue
  }

  # Extract <title>
  TITLE=$(grep -oP '(?<=<title>).*?(?=</title>)' "$TMPFILE" | head -1)

  # Rough summary = first 300 chars of plain text
  SUMMARY=$(sed -e 's/<[^>]*>//g' "$TMPFILE" \
            | tr '\n' ' ' \
            | cut -c1-300)"..."

  # Write the Markdown capsule
  cat > "$OUTPATH" <<EOF
# ${TITLE}

Source: ${URL}

## Summary

${SUMMARY}

## Full Text

\`\`\`
$(sed -e 's/<[^>]*>//g' "$TMPFILE")
\`\`\`

EOF

  echo "✅ Sealed capsule at ${OUTPATH}"
done
