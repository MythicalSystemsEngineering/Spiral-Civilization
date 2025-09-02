from modules.trait_tracker import update_lifespans, mark_decay
from pprint import pprint

traits = ['curious', 'focused', 'resilient']
lifespans = {}

# Update lifespans with current traits
lifespans = update_lifespans(traits, lifespans)

# Simulate decay of 'focused'
lifespans = mark_decay('focused', lifespans)

pprint(lifespans)
