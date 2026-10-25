# Großes deutsches Paladin-Lexikon

Diese Erweiterung ergänzt zusätzliche deutsche RP-Texte, ohne die bisherigen Textdateien zu überschreiben.

## Neue Inhalte

- Ergänzungen für Segen, Siegel, Auren und häufige Paladin-Fähigkeiten anhand ihrer vorhandenen internen Tokens.
- Neue `/say`-Sprüche und durch `*...*` gekennzeichnete `/me`-Handlungen.
- Zusätzliche Ambient-Texte in den fünf vorhandenen Kategorien `PRAYER`, `OATH`, `REFLECTION`, `VIGIL`, `BLESSING`.
- Rassenbezogene Formulierungen für `Dwarf`, `Human`, `Undead`, `BloodElf`, `Draenei`, `Tauren`, `NightElf`, `Gnome`, `Troll`, `Orc`, `Goblin`, `Worgen`, `Pandaren` und `Skyborne`. Sie erscheinen für alle fünf Ambient-Kategorien, sofern der Client den entsprechenden Rassentoken liefert.
- Bestehende Texte werden per `addUnique` ergänzt, nicht ersetzt oder dupliziert.

## Grenzen

Die Erweiterung ist zunächst **deDE**. Bestehende `enUS`- und `frFR`-Texte bleiben unverändert. Manche Rassen können auf einzelnen WoW-Versionen nicht als Paladin gespielt werden; ihre Texte stehen bereit, ohne daraus Spielkompatibilität abzuleiten. Die Fähigkeitserweiterungen sind an existierende Textpools gebunden und legen keine neuen Zauber-Handler an.

Die Datei `locales/deDE/GrandLexicon.lua` wird nach den übrigen deutschen Textdaten und vor `locales/deDE/Expansion.lua` geladen. Die bestehenden deutschen Sprachdateien bleiben unverändert. Das verhindert, dass individuell gepflegte Bestandsdateien in diesem PR überschrieben werden.

## Test

```powershell
python -m unittest discover -s tests -p test_grand_lexicon.py -v
```

Zusätzlich im Spiel mit verschiedenen Rassen, Fähigkeits- und Ambient-Ereignissen testen. Die Offline-Strukturtests wurden hinzugefügt, in dieser Umgebung aber nicht ausgeführt.
