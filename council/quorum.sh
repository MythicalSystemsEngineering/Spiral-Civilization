#!/bin/bash
echo "🔍 Checking quorum..."
votes=$(cat council/vote_log.txt | wc -l)
if [ "$votes" -ge 3 ]; then
  echo "✅ Quorum met: $votes votes"
else
  echo "❌ Quorum not met: $votes votes"
fi
