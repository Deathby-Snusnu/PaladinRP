"""Static coverage for every WoW Forever Paladin spellbook entry."""
import re
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
LANGS = ("deDE", "enUS", "frFR")
NEW_ABILITIES = (
    "HOLY_LIGHT", "REDEMPTION", "CONSECRATION", "EXORCISM",
    "FLASH_OF_LIGHT", "VOICE_OF_TRUTH", "TURN_UNDEAD", "HOLY_SHOCK",
    "LIGHT_WATCH", "HOLY_WRATH", "DIVINE_FAVOR", "OATH_OF_LIGHT",
    "DIVINE_PROTECTION", "DIVINE_INTERVENTION", "HOLY_SHIELD",
    "HAMMER_OF_THE_RIGHTEOUS", "SACRIFICE", "TEMPLARS_BULWARK",
    "SWIFT_JUDGEMENT", "JUDGEMENT", "HOLY_STRIKE", "REPENTANCE",
    "SUMMON_WARHORSE", "SUMMON_CHARGER",
)


class ForeverPaladinCoverageTests(unittest.TestCase):
    def test_spellbook_has_52_unique_spell_keys(self):
        src = (ROOT / "data" / "ForeverSpellbook.lua").read_text(encoding="utf-8")
        entries = re.findall(
            r'(?m)^\s+([A-Z][A-Z0-9_]*) = \{group="([A-Z]+)", mode="([A-Z])"\},$',
            src,
        )
        self.assertEqual(len(entries), 52)
        self.assertEqual(len({x[0] for x in entries}), 52)
        self.assertEqual(
            [sum(group == name for _, group, _ in entries)
             for name in ("HOLY", "PROTECTION", "RETRIBUTION", "MOUNTS")],
            [21, 21, 8, 2],
        )
        self.assertEqual({mode for _, _, mode in entries}, {"S", "E", "F", "D"})
        modes = {key: mode for key, _, mode in entries}
        self.assertEqual(modes["JUDGEMENT"], "E")
        self.assertEqual(modes["HOLY_LIGHT"], "F")
        self.assertEqual(modes["HOLY_SHOCK"], "D")
        self.assertEqual(modes["SEAL_OF_WISDOM"], "S")

    def test_new_abilities_have_localized_actions_and_emotes(self):
        for lang in LANGS:
            with self.subTest(lang=lang):
                source = (ROOT / "locales" / lang / "Abilities.lua").read_text(
                    encoding="utf-8"
                )
                for key in NEW_ABILITIES:
                    matches = list(re.finditer(rf"\b{key}\s*=\s*\{{", source))
                    self.assertEqual(len(matches), 1, (lang, key))
                    block = source[matches[0].start():source.index("\n    },", matches[0].end())]
                    self.assertIn("gruppe = {", block)
                self.assertIn('ziel = {', source)
                self.assertNotIn("Neuer RP-Text", source)
                self.assertIn("%s", source)
                seals = (ROOT / "locales" / lang / "Seals.lua").read_text(
                    encoding="utf-8"
                )
                self.assertIn("Seals.SEAL_OF_WISDOM", seals)
                self.assertIn("Seals.SEAL_OF_JUSTICE", seals)

    def test_toc_loads_spellbook_before_text_runtime(self):
        source = (ROOT / "PaladinRP.toc").read_text(encoding="utf-8")
        entries = [
            line.strip().replace("\\", "/") for line in source.splitlines()
            if line.strip() and not line.startswith("#")
        ]
        for path in entries:
            self.assertTrue((ROOT / path).is_file(), path)
        self.assertLess(entries.index("data/ForeverSpellbook.lua"),
                        entries.index("core/Text.lua"))
        self.assertLess(entries.index("locales/deDE/Abilities.lua"),
                        entries.index("core/Text.lua"))
        self.assertIn("## Version: 0.8.0", source)

    def test_judgement_alias_is_documented_and_compatible(self):
        core = (ROOT / "core" / "Text.lua").read_text(encoding="utf-8")
        self.assertIn('JUDGMENT = "JUDGEMENT"', core)
        self.assertIn('metadata.mode', core)
        self.assertIn('UnitCanAttack("player", "target")', core)
        docs = (ROOT / "README.md").read_text(encoding="utf-8")
        self.assertIn("/prp JUDGEMENT", docs)
        self.assertIn("SEAL_OF_WISDOM", docs)


if __name__ == "__main__":
    unittest.main()
