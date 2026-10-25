"""Guard new paladin dispel text pools across all supported locales."""
from pathlib import Path
import re
import unittest

ROOT = Path(__file__).resolve().parents[1]


class DispelTextsTests(unittest.TestCase):
    def test_all_locales_have_dedicated_purify_and_cleanse_pools(self):
        for locale in ("deDE", "enUS", "frFR"):
            text = (ROOT / "locales" / locale / "Abilities.lua").read_text(encoding="utf-8")
            for key in ("PURIFY", "CLEANSE"):
                with self.subTest(locale=locale, key=key):
                    match = re.search(r'\["' + key + r'"\]\s*=\s*\{', text)
                    self.assertIsNotNone(match)
                    excerpt = text[match.start():]
                    self.assertIn("ziel = {", excerpt)
                    self.assertIn("gruppe = {", excerpt)
                    self.assertGreaterEqual(excerpt.count("%s"), 4)
                    self.assertIn("*", excerpt)

    def test_target_resolution_and_runtime_lookup(self):
        source = (ROOT / "core/Text.lua").read_text(encoding="utf-8")
        self.assertIn("PURIFY=true", source)
        self.assertIn("CLEANSE=true", source)
        self.assertIn('"Abilities"', source)

    def test_all_locale_files_loaded(self):
        toc = (ROOT / "PaladinRP.toc").read_text(encoding="utf-8")
        for locale in ("deDE", "enUS", "frFR"):
            self.assertIn("locales\\" + locale + "\\Abilities.lua", toc)


if __name__ == "__main__":
    unittest.main()
