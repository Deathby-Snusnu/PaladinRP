"""Validate the additive Seal of Fury text pools in all supported locales."""
import re
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]

class SealOfFuryVoicesTests(unittest.TestCase):
    def test_spellbook_self_cast_and_locale_pools(self):
        spellbook = (ROOT / "data/ForeverSpellbook.lua").read_text(encoding="utf-8")
        self.assertRegex(spellbook, r'\bFURY\s*=\s*\{group="PROTECTION",\s*mode="S"\}')
        self.assertIn('RIGHTEOUS_FURY', spellbook)
        for lang in ("deDE", "enUS", "frFR"):
            with self.subTest(lang=lang):
                source = (ROOT / "locales" / lang / "Seals.lua").read_text(encoding="utf-8")
                match = re.search(r'\[?"?FURY"?\]?\s*=\s*\{\s*name\s*=.*?gruppe\s*=\s*\{(.*?)\}', source, re.S)
                self.assertIsNotNone(match)
                texts = re.findall(r'"((?:[^"\\]|\\.)*)"', match.group(1))
                self.assertGreaterEqual(len(texts), 17)
                self.assertGreaterEqual(sum(t.startswith("*") and t.endswith("*") for t in texts), 4)
                for line in texts:
                    self.assertLessEqual(len(line.encode("utf-8")), 255)
                    self.assertNotIn("%s", line)
                    self.assertNotIn("|", line)
                    if line.startswith("*"):
                        self.assertTrue(line.endswith("*"))

if __name__ == "__main__":
    unittest.main()
