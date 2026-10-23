# Paladin RP

## Beschreibung

Paladin RP enthält deutsche, englische und französische Rollenspieltexte zu
Segen, großen Segen, Auren, Siegeln, Fähigkeiten und Völkern.
`/prp <schlüssel>` versucht, einen zufälligen Text anhand der gespeicherten
Textchance und Abklingzeit auszugeben. Es gibt keine automatische Auslösung
durch Zauber und keine grafische Einstellungsoberfläche. Das AddOn benötigt
kein anderes AddOn.

Die öffentliche Schnittstelle bleibt `_G.PaladinRP.TryText(emote)`.
Beispiel für ein Makro nach dem Login:

```text
/run PaladinRP.TryText("HAMMER")
```

Die API liefert `true` nach einem erfolgreichen Chat-API-Aufruf, andernfalls
`false`. Vor `PLAYER_LOGIN` wird der Aufruf mit einer Meldung abgelehnt.
Nur Paladine können RP-Texte senden; andere Klassen können Hilfe und
Einstellungen verwenden.

## Dokumentation

[Sammlungsübersicht](../../README.md) · [Changelog](CHANGELOG.md) ·
[Texteditor und Handbuch](../../docs/RPTextStudio/HANDBUCH.md) ·
[Verpackung und gemeinsame Tests](../../docs/VERPACKUNG.md)

## Installation

Kopiere den Ordner `PaladinRP` in das Add-on-Verzeichnis des gewünschten
Clients:

```text
<WoW-Installationsordner>\<Client>\Interface\AddOns\PaladinRP
```

Aktiviere **Paladin RP** im AddOn-Menü. Änderungen an den Quelldateien erfordern
normalerweise `/reload` oder einen Neustart des Spiels. Die Ladeliste steht in
[PaladinRP.toc](PaladinRP.toc).
Das Installations-ZIP enthält Spieldateien, Dokumentation und Lizenz,
aber keine Tests, Git- oder Editor-Dateien.

## Schnellstart

Nach dem Login zeigt `/prp` die bisherige Kurzhilfe. Zum Ausprobieren:

```text
/prp chance 100
/prp cooldown 0
/prp hammer
/prp might
/prp greater_might
```

Die letzten beiden Aufrufe verwenden bei vorhandenem Ziel Zieltexte, soweit
der gewählte Pool diese anbietet. Stelle anschließend die gewünschten Werte
wieder ein, beispielsweise Chance 30 und Cooldown 20.

## Befehle

| Befehl | Bedeutung |
| --- | --- |
| `/prp` oder `/prp help` | Hilfe mit Beispielen |
| `/prp list` | Verfügbare Textschlüssel auflisten |
| `/prp status` | Aktuelle Einstellungen anzeigen |
| `/prp <schlüssel>` | Versucht die Ausgabe eines Textes |
| `/prp chance <0-100>` | Textchance als ganze Zahl einstellen |
| `/prp cooldown <0-3600>` | Abklingzeit in ganzen Sekunden einstellen |
| `/prp channel` | Aktuellen Kanal und Kanalbenutzung anzeigen |
| `/prp channel <kanal>` | `SAY`, `PARTY`, `RAID`, `INSTANCE_CHAT` oder `AUTO` einstellen |
| `/prp language [deDE\|enUS\|frFR]` | RP-Ausgabesprache anzeigen oder setzen |

Groß-/Kleinschreibung von Befehlen, Kanälen und Textschlüsseln ist unerheblich.
Beispiele für Schlüssel sind `MIGHT`, `WISDOM`, `PROTECTION`, `SALVATION`,
`FREEDOM`, `KINGS`, `GREATER_MIGHT`, `GREATER_WISDOM`, `GREATER_KINGS`,
`GREATER_SALVATION`, `DEVOTION`, `RETRIBUTION`, `CONCENTRATION`, `SHADOW`,
`FIRE`, `FROST`, `RIGHTEOUSNESS`, `COMMAND`, `LIGHT`, `CRUSADER`, `FURY`,
`HAMMER`, `LAYONHANDS` und `DIVINE_SHIELD`.

Ungültige Zahlen, Dezimalwerte und zusätzliche Argumente werden abgelehnt,
nicht begrenzt oder teilweise gelesen.

Texte zwischen `*Sternchen*` werden als `/me`-Emote ausgegeben; die
Sternchen werden entfernt. Diese Handlungen verwenden immer `EMOTE`,
unabhängig vom eingestellten Sprachkanal.

## Einstellungen

[config/Settings.lua](config/Settings.lua) enthält `addon.defaults`:

- `outputLanguage = "deDE"`: RP-Ausgabesprache `deDE`, `enUS` oder `frFR`.
- `textChance = 30`: Wahrscheinlichkeit, ganze Zahl 0 bis 100.
- `cooldown = 20`: Mindestabstand, ganze Zahl 0 bis 3600 Sekunden.
- `chatChannel = "SAY"`: Standardkanal, auch in Gruppen und Schlachtzügen.

Die Einstellungen und persönlichen Texte bleiben unter
`PaladinRP_CharacterDB` pro Charakter gespeichert. Gültige gespeicherte
Werte bleiben erhalten; fehlende Felder werden ergänzt und beschädigte
Werte mit einer Meldung auf Standardwerte zurückgesetzt.
Die RP-Ausgabesprache lässt sich mit `/prp language deDE|enUS|frFR` setzen;
ohne Argument zeigt der Befehl die aktive Sprache. Fehlende ältere Textpools
fallen auf Deutsch zurück.

`AUTO` wählt zuerst die Instanzgruppe, dann den Schlachtzug, dann die Gruppe,
sonst `SAY`. Ein nicht verfügbarer expliziter Gruppen-, Raid- oder Instanzkanal
bricht die Ausgabe mit einer Meldung ab, ohne öffentlichen SAY-Fallback.
Bei `SAY` wird die bekannte Volkssprache anhand ihrer sprachunabhängigen ID
gewählt, falls der Charakter diese Sprache beherrscht.

Der erste Text ist sofort möglich, sofern die Textchance ihn auslöst.
Nach einem erfolgreichen Chat-API-Aufruf beginnt der Cooldown. Abgelehnte
Texte starten ihn nicht; eine serverseitige Zustellung wird nicht bestätigt.

## Eigene Texte

Bearbeite die passenden Dateien unter `locales/<locale>/`. Die Dateien
erhalten die private AddOn-Tabelle durch `local _, addon = ...`; die Textdaten
liegen je Sprache unter `addon.localeData.<locale>` in den Tabellen
`Blessings`, `GreaterBlessings`, `Auras`, `Seals`, `Abilities` und `Racial`.

Pools können einfache Listen oder Tabellen mit `ziel`- und `gruppe`-Listen sein.
`%s` wird durch den für den Schlüssel aufgelösten Namen ersetzt.
Die Ersetzung ist literal, keine `string.format`-Formatierung: andere
Prozentzeichen bleiben unverändert. Ohne aufgelösten Namen werden Texte mit
`%s` nicht ausgegeben. Nach der Ersetzung gelten maximal 255 Bytes, keine
Zeilenumbrüche und keine `|`-Chatmarkierungen.

Segen mit den Schlüsseln MIGHT, WISDOM, PROTECTION, SALVATION, FREEDOM,
KINGS sowie GREATER_MIGHT, GREATER_WISDOM, GREATER_KINGS,
GREATER_SALVATION und LAYONHANDS verwenden ein freundliches Ziel, sonst
den eigenen Charakter. DEVOTION, RETRIBUTION, CONCENTRATION, SHADOW, FIRE,
FROST, RIGHTEOUSNESS, COMMAND und DIVINE_SHIELD verwenden keinen Zielnamen.
Andere Schlüssel nutzen das aktuelle Ziel, sofern vorhanden.
Bei strukturierten Pools wird mit Namen zuerst `ziel`, danach `gruppe`
versucht; anschließend sind zielunabhängige Einträge aus `ziel` möglich.
Dies bestätigt keinen Zaubererfolg.

Persönliche Pools können zusätzlich unter
`PaladinRP_CharacterDB.personalTexts["SCHLÜSSEL"]` hinterlegt werden.
Beispiel nach dem Login:

```text
/run PaladinRP_CharacterDB.personalTexts.HAMMER={"Das Licht richtet, %s.","Das Licht richtet."}
```

Für die Auswahl gilt unverändert:

1. Nutzbarer persönlicher Text mit dem vollständigen Schlüssel.
2. Bei `GREATER_`: passender großer Segen ohne Präfix.
3. Rassenspezifischer Pool.
4. Normaler Segen.
5. Großer Segen.
6. Aura.
7. Siegel.
8. Sonstige Fähigkeit.

Beispielsweise hat der normale Segen `WISDOM` Vorrang vor dem gleichnamigen
Siegel. Ein unbrauchbarer persönlicher Pool verhindert die Locale-Auswahl
nicht. Innerhalb der Locale-Auswahl zählt dagegen der erste vorhandene Pool,
auch wenn er keinen nutzbaren Text liefert. Zuerst wird die gewählte Sprache,
bei fehlendem Pool Deutsch durchsucht.

## Projektstruktur

```text
PaladinRP/
├── PaladinRP.toc
├── PaladinRP.lua
├── config/Settings.lua
├── locales/
│   ├── Init.lua
│   ├── deDE/, enUS/, frFR/
│   └── Finalize.lua
├── core/
│   ├── Database.lua
│   ├── Text.lua
│   ├── Chat.lua
│   ├── Cooldown.lua
│   └── Commands.lua
├── ui/Settings.lua
├── tests/test_addon.lua
├── README.md
├── CHANGELOG.md
└── LICENSE
```

- [PaladinRP.lua](PaladinRP.lua): Login und globale öffentliche API.
- [core/Database.lua](core/Database.lua): Initialisierung und Validierung der Charakterdaten.
- [core/Text.lua](core/Text.lua): Poolpriorität, Auswahl und Textaufbereitung.
- [core/Chat.lua](core/Chat.lua): Kanal, Volkssprache und Chat-Ausgabe.
- [core/Cooldown.lua](core/Cooldown.lua): Gemeinsamer Cooldown-Zustand.
- [core/Commands.lua](core/Commands.lua): Registrierung und Verarbeitung von `/prp`.
- [ui/Settings.lua](ui/Settings.lua): Platzhalter nur im Quellprojekt, nicht in TOC oder ZIP.
- `locales/`: Laufzeittexte je Sprache. Die parallel vorhandenen Dateien unter
  `data/` sind nicht in der TOC-Ladefolge enthalten.
- `locales/<locale>/Expansion.lua`: zusätzliche geladene Textbestände,
  die RP Text Studio nicht bearbeitet.

Die Kernmodule verwenden `BuildText`, `SendText`, `CooldownReady` und
`StartCooldown`, wie die anderen AddOns. Die bisherigen Namen `BuildRPText`,
`SendRPText` und `IsCooldownReady` bleiben als Aliase erhalten.
`PaladinRP.TryText` ist die öffentliche manuelle Schnittstelle.

Die TOC lädt zunächst Konfiguration und Sprachdaten, dann die Kernmodule und
zuletzt die Hauptdatei. Interne Funktionen und Daten teilen ausschließlich
die private AddOn-Tabelle; die globalen Datencontainer und
`RPChatMod_Settings` entfallen. Extern bleiben `PaladinRP.TryText` und die
charakterbezogene DB erreichbar.

## Tests

[tests/test_addon.lua](tests/test_addon.lua) ist eine source-only Testsuite.
Sie gehört nicht zur TOC und wird im Spiel nicht geladen. Die Tests benötigen
einen eigenständigen Lua-Interpreter, aber keinen WoW-Client und keine
zusätzliche Bibliothek.

Aus dem Ordner `PaladinRP` jeweils mit Lua 5.1 und Lua 5.4 ausführen:

```text
lua tests\test_addon.lua
```

Der ausführbare Name kann lokal abweichen; unter Windows kann stattdessen der
vollständige Pfad zur jeweiligen `lua.exe` verwendet werden.

Jeder Test lädt die Dateien anhand der TOC in eine neue Mock-Umgebung mit
eigener privater AddOn-Tabelle, DB und Client-Zustand. Geprüft werden
Namespace-Isolation, öffentliche API, Login, DB-Erhalt, Textdaten und
Poolpriorität einschließlich `GREATER_`, Ziel-/Gruppentexte, Kanal- und
Sprachwahl, Chance, Cooldown, Slash-Befehle, strikte Eingabeprüfung,
Klassenbeschränkung, Textgrenzen und Fehlerfälle. Die Tests sind nur im
Quellprojekt vorhanden, nicht im Installations-ZIP.

## Kompatibilität

Die TOC deklariert `Interface: 16001` und Version `0.2.0`. Prüfe die passende
Interface-Version für deinen Client; weitere unterstützte Client-Versionen
sind nicht festgelegt.

Für den Versand wird `C_ChatInfo.SendChatMessage` vorausgesetzt; es gibt
keinen Legacy-Fallback. Die Lua-Tests ersetzen die verwendeten WoW-APIs durch
Mocks und belegen deshalb keine vollständige Ingame-Kompatibilität.

## Lizenz

Dieses AddOn verwendet eine **geteilte Lizenzierung nach Dateityp**:

- Programmcode: **Mozilla Public License 2.0 (MPL-2.0)**, siehe
  [LICENSE](./LICENSE).
- RP-Dialoge, Emote-/Ambient-Texte und Übersetzungen: **CC BY-SA 4.0**, siehe
  [LICENSE-TEXTS](./LICENSE-TEXTS).
- Die verbindliche Zuordnung einer Lua-Datei steht in ihrem
  `SPDX-License-Identifier`.

Weitere Hinweise und der Markenhinweis stehen in [NOTICE](./NOTICE).

## Ambient-Erweiterung (21.10.2026)

Klassen- und rassenspezifisches, dreisprachiges Ambient-System; Konfiguration mit `/prp ambient`. Details in `AMBIENT.md`.
