"""Contracts for self-only Righteous Fury and friendly-target Redemption RP text."""
import re
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
LANGS = ("deDE", "enUS", "frFR")


class RighteousFuryRedemptionTests(unittest.TestCase):
    def test_spellbook_target_modes(self):
        src = (ROOT / "data/ForeverSpellbook.lua").read_text(encoding="utf-8")
        self.assertRegex(src, r'RIGHTEOUS_FURY\s*=\s*\{group="PROTECTION", mode="S"\}')
        self.assertRegex(src, r'REDEMPTION\s*=\s*\{group="HOLY", mode="F"\}')
        self.assertRegex(src, r'\bFURY\s*=\s*\{group="PROTECTION", mode="S"\}')

    def test_original_pools_and_additive_variants(self):
        for lang in LANGS:
            with self.subTest(lang=lang):
                content = (ROOT / "locales" / lang / "Abilities.lua").read_text(encoding="utf-8")
                anchor = "-- Additional trilingual protection and resurrection voice variants."
                self.assertEqual(content.count(anchor), 1)
                before, after = content.split(anchor)
                self.assertIn('["RIGHTEOUS_FURY"]', before)
                self.assertIn('REDEMPTION = {', before)
                for key, scope, count in (
                    ("RIGHTEOUS_FURY", "gruppe", 12),
                    ("REDEMPTION", "gruppe", 5),
                    ("REDEMPTION", "ziel", 8),
                ):
                    pattern = rf'local pool = addon\.localeData\.{lang}\.Abilities\.{key}\.{scope}\s*for _, line in ipairs\(\{{(.*?)\}}\)'
                    found = re.search(pattern, after, re.S)
                    self.assertIsNotNone(found, (lang, key, scope))
                    lines = re.findall(r'"((?:\\.|[^"\\])*)"', found.group(1))
                    self.assertEqual(len(lines), count)
                    self.assertEqual(len(lines), len(set(lines)))
                    for text in lines:
                        self.assertLessEqual(len(text.encode("utf-8")), 255)
                        self.assertNotIn("|", text)
                        if key == "RIGHTEOUS_FURY":
                            self.assertNotIn("%s", text)
                        if scope == "ziel":
                            self.assertIn("%s", text)
                    if scope == "gruppe":
                        self.assertFalse(any("%s" in t for t in lines))
                self.assertNotIn("COMBAT_LOG_EVENT_UNFILTERED", after)
                self.assertNotIn("SendChatMessage", after)


if __name__ == "__main__":
    unittest.main()
