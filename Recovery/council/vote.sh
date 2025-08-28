#!/bin/bash
echo "🗳️ Council Vote Initiated"
read -p "Enter proposal ID: " proposal
read -p "Your vote (yes/no): " vote
echo "$(date): Proposal $proposal — Vote: $vote" >> council/vote_log.txt
echo "Vote recorded."
