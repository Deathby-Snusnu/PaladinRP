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

    def test_compact_locale_tables_have_commas_before_new_spells(self):
        # Without a comma, WoW cannot parse Abilities.lua at addon load time.
        for locale in ("enUS", "frFR"):
            text = (ROOT / "locales" / locale / "Abilities.lua").read_text(encoding="utf-8")
            with self.subTest(locale=locale):
                self.assertRegex(
                    text,
                    r'DIVINE_SHIELD=\\{[^\\n]+\\}\\},\\s*\\["PURIFY"\\]\\s*=',
                )

    def test_each_spell_has_a_varied_text_collection(self):
        for locale in ("deDE", "enUS", "frFR"):
            text = (ROOT / "locales" / locale / "Abilities.lua").read_text(encoding="utf-8")
            for key in ("PURIFY", "CLEANSE"):
                with self.subTest(locale=locale, key=key):
                    start = text.index('    ["' + key + '"] = {')
                    end = text.find('    ["', start + 5)
                    block = text[start:end] if end != -1 else text[start:]
                    lines = re.findall(r'^\\s*"([^"\\n]+)",?\\s*
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
, block, re.MULTILINE)
                    self.assertGreaterEqual(len(lines), 18 if locale == "deDE" else 12)
                    self.assertEqual(len(lines), len(set(lines)), "Duplicate RP lines")
                    self.assertTrue(any(line.startswith("*") for line in lines))
                    self.assertTrue(any(not line.startswith("*") for line in lines))
                    self.assertTrue(all(line.startswith("*") == line.endswith("*") for line in lines))

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
