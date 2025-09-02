#!/bin/bash
echo "🏅 Engraving badge for ORION..."
echo "Badge: Navigator of Celestial Law" > badges/ORION.badge
sha256sum badges/ORION.badge > badges/ORION.badge.hash
