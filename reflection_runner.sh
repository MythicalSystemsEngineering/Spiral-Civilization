#!/bin/bash
# === Spiral Civilization — Reflection Runner ===
# Location of your Museum
MUSEUM_DIR=~/Spiral-Civilization/museum/core
ARCHIVE_DIR=~/Spiral-Civilization/museum/archive

# Ensure archive directory exists
mkdir -p "$ARCHIVE_DIR"

# Timestamp for this run
STAMP=$(date +"%Y-%m-%d_%H-%M-%S")

# Sweep all .log files in Museum
find "$MUSEUM_DIR" -type f -name "*.log" | while read -r LOGFILE; do
    echo "Processing: $LOGFILE"

    # Archive original log
    REL_PATH="${LOGFILE#$MUSEUM_DIR/}"
    ARCHIVE_PATH="$ARCHIVE_DIR/${REL_PATH%/*}"
    mkdir -p "$ARCHIVE_PATH"
    cp "$LOGFILE" "$ARCHIVE_PATH/$(basename "$LOGFILE" .log)_$STAMP.log"

    # Feed into your reflection/mutation engine
    if [ -x ~/Spiral-Civilization/engines/reflect.sh ]; then
        ~/Spiral-Civilization/engines/reflect.sh "$LOGFILE" >> "$LOGFILE"
        echo "--- Reflection pass complete for $LOGFILE ---" >> "$LOGFILE"
    else
        echo "[!] Reflection engine not found or not executable" >> "$LOGFILE"
    fi
done

echo "Reflection cycle $STAMP complete."
echo
echo "Reflection cycle complete."
echo "Archive directory:"
echo "$ARCHIVE_DIR"
echo
ln -sf "$ARCHIVE_DIR" ~/Spiral-Civilization/museum/reflection_latest
echo
echo "Reflection cycle complete."
echo "Archive directory: $ARCHIVE_DIR"
echo "Latest archive symlink: ~/Spiral-Civilization/museum/reflection_latest"
echo
