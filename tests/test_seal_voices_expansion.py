"""Contract checks for original trilingual paladin seal voice expansions."""
import re
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
LANGUAGES = ("deDE", "enUS", "frFR")
KEYS = ("RIGHTEOUSNESS", "COMMAND", "WISDOM", "LIGHT", "CRUSADER", "SEAL_OF_JUSTICE")


def get_lines(source, key):
    # The locale tables use both ["KEY"] and KEY styles.
    name = rf'(?:\["{re.escape(key)}"\]|\b{re.escape(key)})\s*=\s*\{{'
    match = re.search(name + r'.*?\bgruppe\s*=\s*\{(.*?)\}', source, re.S)
    if not match:
        raise AssertionError(f"Missing seal group: {key}")
    return re.findall(r'"((?:\\.|[^"\\])*)"', match.group(1))


class PaladinSealVoices(unittest.TestCase):
    def test_self_cast_spellbook_keys(self):
        spellbook = (ROOT / "data/ForeverSpellbook.lua").read_text(encoding="utf-8")
        for key in ("RIGHTEOUSNESS", "LIGHT", "COMMAND", "CRUSADER",
                    "SEAL_OF_JUSTICE", "FURY", "SEAL_OF_WISDOM"):
            with self.subTest(key=key):
                self.assertRegex(
                    spellbook,
                    rf'\b{key}\s*=\s*\{{group="[A-Z]+",\s*mode="S"\}}',
                )

    def test_locales_preserve_and_extend_speech(self):
        for language in LANGUAGES:
            source = (ROOT / "locales" / language / "Seals.lua").read_text(
                encoding="utf-8"
            )
            for key in KEYS:
                with self.subTest(language=language, key=key):
                    lines = get_lines(source, key)
                    self.assertGreaterEqual(len(lines), 4)
                    self.assertEqual(len(lines), len(set(lines)))
                    self.assertTrue(all("%s" not in line for line in lines))
                    self.assertTrue(all(len(line.encode("utf-8")) <= 255 for line in lines))
                    self.assertTrue(all("|" not in line for line in lines))
            justice = get_lines(source, "SEAL_OF_JUSTICE")
            self.assertGreaterEqual(len(justice), 16)
            self.assertGreaterEqual(
                sum(line.startswith("*") and line.endswith("*") for line in justice),
                6,
            )

    def test_alias_and_no_combatlog_changes(self):
        for language in LANGUAGES:
            source = (ROOT / "locales" / language / "Seals.lua").read_text(
                encoding="utf-8"
            )
            self.assertIn(".Seals.SEAL_OF_WISDOM =", source)
            self.assertIn(".Seals.WISDOM", source)
            self.assertNotIn("COMBAT_LOG_EVENT_UNFILTERED", source)


if __name__ == "__main__":
    unittest.main()
