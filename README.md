# Paladin RP

Paladin RP ist ein World of Warcraft-Addon mit zufälligen Rollenspieltexten zu
Segen, Auren, Siegeln, Fähigkeiten und rassenspezifischen Texten. Die Texte
werden im Chat ausgegeben und können ein vorhandenes Ziel einbeziehen.

## Installation

Der Ordner `PaladinRP` muss im Addon-Verzeichnis des verwendeten WoW-Clients
liegen:

```text
World of Warcraft/_classic_beta_/Interface/AddOns/PaladinRP/
```

Das Addon wird über `PaladinRP.toc` geladen. Nach der Installation kann es im
Charakterauswahlbildschirm unter **AddOns** aktiviert werden. Änderungen an
Addon-Dateien erfordern üblicherweise einen `/reload` oder einen Neustart des
Spiels.

## Verwendung

Alle Befehle beginnen mit `/prp`. Ohne Argument zeigt das Addon eine kurze
Befehlsübersicht an. Beispiele:

```text
/prp might
/prp wisdom
/prp protection
/prp freedom
/prp kings
/prp devotion
/prp retribution
/prp crusader
/prp fury
```

Der Schlüssel des Befehls entspricht dem Textschlüssel in den Datendateien;
Groß- und Kleinschreibung ist beim Befehl unerheblich. Gibt es ein Ziel, kann
ein Text aus der `ziel`-Liste verwendet werden. `%s` wird dabei durch den
Zielnamen ersetzt. Ohne Ziel wird, sofern vorhanden, ein Text aus der
`gruppe`-Liste gewählt.

Für Siegel gibt es unter anderem die Befehle `crusader` (Siegel des
Kreuzfahrers) und `fury` (Siegel des Furors). Zwergische Paladine erhalten für
`crusader`, `righteousness` (Rechtschaffenheit) und `fury` zusätzlich
rassenspezifische Texte.

Die Textchance und die Abklingzeit lassen sich pro Charakter anpassen:

```text
/prp chance 65
/prp cooldown 12
```

Die Chance wird auf den Bereich 0–100 begrenzt. Die Abklingzeit wird in
Sekunden angegeben und kann nicht negativ sein. Standardwerte sind 65 Prozent
und 12 Sekunden. Bei automatischer Kanalauswahl verwendet das Addon
Instanzchat, Schlachtzug, Gruppe oder andernfalls /sagen, abhängig von der
aktuellen Gruppensituation.

## Projektstruktur

```text
PaladinRP/
├── PaladinRP.toc
├── PaladinRP.lua
├── data/
│   ├── Blessings.lua
│   ├── GreaterBlessings.lua
│   ├── Auras.lua
│   ├── Seals.lua
│   ├── Abilities.lua
│   └── Racial.lua
└── ui/
    └── Settings.lua
```

- `PaladinRP.toc` enthält die Metadaten des Addons und die Liste der vom Client
  zu ladenden Dateien. Die Reihenfolge dort ist wichtig: Die Textdaten werden
  vor der Hauptlogik geladen.
- `PaladinRP.lua` initialisiert die Charaktereinstellungen, wählt und sendet
  Texte und registriert den `/prp`-Befehl.
- `data/` enthält die Textpools. Jeder Eintrag verwendet einen Schlüssel wie
  `MIGHT` und kann `ziel`- und `gruppe`-Listen enthalten. Neue Texte können
  durch Ergänzen dieser Listen hinzugefügt werden.
- `ui/Settings.lua` ist für eine zukünftige Einstellungsoberfläche vorgesehen;
  eine Konfigurationsoberfläche ist derzeit noch nicht implementiert.

Die Einstellungen werden unter `PaladinRP_CharacterDB` pro Charakter
gespeichert.
