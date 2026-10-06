# Paladin RP

Paladin RP enthält Rollenspieltext-Sammlungen zu Segen, Auren, Siegeln,
Fähigkeiten und Völkern sowie Code für die Textauswahl und Chat-Ausgabe. Eine
reguläre Spielerbedienung ist derzeit nicht vorgesehen; die verbliebenen
`/prp`-Handler dienen höchstens zu Testzwecken.

## Installation

Der Ordner `PaladinRP` muss im Addon-Verzeichnis des verwendeten WoW-Clients
liegen. Verwende den Installationspfad des Clients, in dem das Addon aktiviert
werden soll:

```text
<WoW-Installationsordner>/Interface/AddOns/PaladinRP/
```

Das Projekt liegt derzeit im Ordner `_classic_beta_`; das ist ein Beispiel für
diesen Client und nicht zwingend der Installationspfad anderer WoW-Versionen.
Die TOC-Datei deklariert `Interface: 16001`. Die Kompatibilität mit dem
gewünschten Client sollte anhand dessen Addon-/Interface-Version geprüft
werden; weitere unterstützte Client-Versionen sind nicht festgelegt.

Das Addon wird über `PaladinRP.toc` geladen. Nach der Installation kann es im
Charakterauswahlbildschirm unter **AddOns** aktiviert werden. Änderungen an
Addon-Dateien erfordern üblicherweise einen `/reload` oder einen Neustart des
Spiels.

## Test- und Entwicklungsbefehle

Die im Code verbliebenen `/prp`-Slash-Handler bieten keine reguläre
Addon-Funktion mehr und dienen höchstens zu Testzwecken. Sie sind nicht als
unterstützte Bedienoberfläche gedacht; die folgenden Beispiele dokumentieren
lediglich vorhandene Testbefehle und müssen nicht zuverlässig funktionieren:

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

Im Handler sind außerdem Testparameter für Textchance und Abklingzeit
hinterlegt:

```text
/prp chance 65
/prp cooldown 12
```

Diese Parameter sind ebenfalls nicht als unterstützte Einstellungen für
Spieler gedacht.

Die Textauswahl unterscheidet große von normalen Segen über ein `GREATER_`-
Präfix, zum Beispiel `GREATER_MIGHT` und `GREATER_WISDOM`. Dies ist eine
Unterscheidung im internen Textschlüssel und keine Zusage, dass die
Test-Slash-Handler diese Eingaben zuverlässig verarbeiten.

## Projektstruktur

```text
PaladinRP/
├── README.md
├── CHANGELOG.md
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
- `PaladinRP.lua` enthält Code zur Initialisierung, Textauswahl und Chat-Ausgabe
  sowie die verbliebenen `/prp`-Testhandler. Diese sind keine reguläre
  Spielerfunktion.
- `data/` enthält die Textpools mit Schlüsseln wie `MIGHT`. Je nach Datenart
  liegen Texte in `ziel`-/`gruppe`-Listen oder in rassenspezifischen Listen.
  Neue Texte können durch Ergänzen der passenden Datenstruktur hinzugefügt
  werden.
- `ui/Settings.lua` ist für eine zukünftige Einstellungsoberfläche vorgesehen;
  eine Konfigurationsoberfläche ist derzeit noch nicht implementiert.

Die Einstellungen werden unter `PaladinRP_CharacterDB` pro Charakter
gespeichert.

## Tests

Das Projekt enthält derzeit keine automatisierte Testsuite. Die verbliebenen
Slash-Handler sind nicht als verlässlicher manueller Test vorgesehen.

## Lizenz

Im Projekt ist derzeit keine Lizenzdatei enthalten; eine Lizenz ist daher
nicht dokumentiert.
