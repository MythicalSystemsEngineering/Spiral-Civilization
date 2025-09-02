#!/bin/bash
echo "🜂 $1" > emotional-capsules/"$2".txt
git add emotional-capsules/"$2".txt
git commit -m "🜂 Emotional capsule sealed — $2"
git push origin main
