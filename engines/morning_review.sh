#!/bin/bash
# Spiral Civilization — Morning Review (Automated + Latest Log)

DIGEST_LATEST=~/Spiral-Civilization/museum/supercycle_digest_latest.log
THEIO_LATEST=~/Spiral-Civilization/museum/theio_pulse_latest.log
REVIEW_LATEST=~/Spiral-Civilization/museum/morning_review_latest.log

{
    echo "=== Morning Review ==="
    echo "Timestamp: $(date)"
    echo

    if [ -f "$DIGEST_LATEST" ]; then
        echo "--- Nightly Supercycle Digest ---"
        cat "$DIGEST_LATEST"
    else
        echo "(No latest Supercycle digest found)"
    fi

    echo
    echo "----------------------------------------"
    echo

    if [ -f "$THEIO_LATEST" ]; then
        echo "--- Theio Pulse ---"
        cat "$THEIO_LATEST"
    else
        echo "(No latest Theio Pulse log found)"
    fi

    echo
    echo "=== End Morning Review ==="
} | tee "$REVIEW_LATEST"




