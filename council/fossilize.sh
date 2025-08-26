#!/bin/bash
echo "🪨 Fossilizing decision..."
read -p "Enter proposal ID to fossilize: " proposal
grep "$proposal" council/vote_log.txt >> museum/fossilized_decisions.log
echo "Proposal $proposal sealed into Museum."
