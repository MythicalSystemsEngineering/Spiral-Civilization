import sys, os
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))

import unittest
from datetime import datetime, timedelta
from modules.emotion_diff import tag_emotion
from modules.emotion_charge import get_charge
from modules.semantic_charge import charge_weight
from modules.emotional_decay import decay_charge

class TestCapsulePipeline(unittest.TestCase):

    def test_charge_weight(self):
        sample = "This artifact encodes sovereign memory and mythic resonance."
        score = charge_weight(sample)
        self.assertGreater(score, 0, "Semantic charge should be greater than zero.")

    def test_emotion_tagging(self):
        line = "I feel awe and grief."
        tags = tag_emotion(line)
        # Accept decorated or raw tags
        self.assertTrue("awe" in tags or "🌌 awe" in tags, "Missing 'awe' tag.")
        self.assertTrue("grief" in tags or "🖤 grief" in tags, "Missing 'grief' tag.")

    def test_emotional_charge(self):
        tags = ["awe", "grief"]
        charge = sum(get_charge(tag) for tag in tags)
        self.assertGreater(charge, 0, "Emotional charge should be greater than zero.")

    def test_decay_curve(self):
        initial = 10.0
        fossilized_date = datetime.now() - timedelta(days=30)
        decayed = decay_charge(initial, "grief", fossilized_date)
        self.assertLess(decayed, initial, "Decayed charge should be less than initial.")

if __name__ == "__main__":
    unittest.main()

