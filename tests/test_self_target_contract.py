"""Regression contract: self buffs must not speak the paladin's name."""
from pathlib import Path
import unittest

ROOT = Path(__file__).resolve().parents[1]

class SelfTargetContract(unittest.TestCase):
    def test_no_implicit_player_name(self):
        code = (ROOT / "core" / "Text.lua").read_text(encoding="utf-8")
        self.assertNotIn('return UnitName("player")', code)
        self.assertIn('UnitIsUnit("target", "player")', code)
        self.assertIn('if SELF_ONLY[key] then return nil end', code)

if __name__ == "__main__":
    unittest.main()
