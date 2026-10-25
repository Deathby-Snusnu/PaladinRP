"""Static integrity checks for the supplemental German PaladinRP vocabulary."""
from pathlib import Path
import unittest

ROOT = Path(__file__).resolve().parents[1]


class GrandLexiconTests(unittest.TestCase):
    def test_toc_load_order(self):
        toc = (ROOT / "PaladinRP.toc").read_text(encoding="utf-8")
        self.assertIn("locales\\deDE\\GrandLexicon.lua", toc)
        self.assertLess(toc.index("locales\\deDE\\AmbientRacial.lua"),
                        toc.index("locales\\deDE\\GrandLexicon.lua"))
        self.assertLess(toc.index("locales\\deDE\\GrandLexicon.lua"),
                        toc.index("locales\\deDE\\Expansion.lua"))

    def test_all_existing_rp_categories_and_supported_race_tokens(self):
        source = (ROOT / "locales/deDE/GrandLexicon.lua").read_text(encoding="utf-8")
        for race in ("Dwarf", "Human", "Undead", "BloodElf", "Draenei", "Tauren",
                     "NightElf", "Gnome", "Troll", "Orc", "Goblin", "Worgen",
                     "Pandaren", "Skyborne"):
            with self.subTest(race=race):
                self.assertIn("    " + race + " = {", source)
        for key in ("PRAYER", "OATH", "REFLECTION", "VIGIL", "BLESSING"):
            self.assertIn(key, source)
        self.assertIn('phrase:find("%s", 1, true)', source)
        self.assertIn('addUnique', source)
        self.assertIn('addon.localeData.deDE', source)

    def test_original_collections_still_loaded(self):
        toc = (ROOT / "PaladinRP.toc").read_text(encoding="utf-8")
        for name in ("Abilities", "Auras", "Blessings", "GreaterBlessings",
                     "Racial", "Seals", "Ambient", "AmbientRacial"):
            self.assertIn("locales\\deDE\\" + name + ".lua", toc)


if __name__ == "__main__":
    unittest.main()
