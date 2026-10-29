"""Guard against gendered third-person emotes in German blessing pools."""
from pathlib import Path
import re
import unittest

ROOT = Path(__file__).resolve().parents[1]

class NeutralBlessingTexts(unittest.TestCase):
    def test_blessings(self):
        for path in (ROOT / "data/Blessings.lua", ROOT / "locales/deDE/Blessings.lua"):
            body = path.read_text(encoding="utf-8")
            self.assertNotIn("über seine Gefährten", body)
            self.assertNotIn("während er sich der Gruppe zuwendet", body)
            self.assertIn("und wendet sich der Gruppe zu", body)

if __name__ == "__main__":
    unittest.main()
