# Paladin RP

Paladin RP enthält Rollenspieltext-Sammlungen zu Segen, Auren, Siegeln,
Fähigkeiten und Völkern sowie Code für zufällige Textauswahl und Chat-Ausgabe.
Textchance, Abklingzeit und Chatkanal werden in `config/Settings.lua`
konfiguriert. Textchance und Abklingzeit lassen sich außerdem über Chatbefehle
einstellen.

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

## Bedienung

Die Textpools verwenden Schlüssel wie:

```text
MIGHT
WISDOM
PROTECTION
FREEDOM
KINGS
GREATER_MIGHT
DEVOTION
RETRIBUTION
CRUSADER
FURY
HAMMER
LAYONHANDS
DIVINE_SHIELD
```

Große Segen haben eigene Textschlüssel mit dem Präfix `GREATER_`, zum Beispiel
`GREATER_MIGHT` und `GREATER_WISDOM`. Bei Textpools mit Ziel- und
Gruppentexten wird bei vorhandenem Ziel der Zieltext verwendet, andernfalls
der Gruppentext, sofern einer vorhanden ist.

Ein Schlüssel wird mit `/prp <schlüssel>` aufgerufen. Standardmäßig erfolgt
die Textausgabe immer in `/say` – auch wenn sich der Charakter in einer Gruppe
oder einem Schlachtzug befindet. Außerhalb einer Gruppe wird die für den
Charakter verfügbare Volkssprache verwendet.

Die Textchance und Abklingzeit sind pro Charakter gespeichert. Die Werte aus
`config/Settings.lua` dienen als Standardwerte für Charaktere ohne bereits
gespeicherte Einstellungen. Standardmäßig beträgt die Textchance 30 Prozent
und die Abklingzeit 20 Sekunden. Sie können im Chat angepasst werden:

```text
/prp chance 30
/prp cooldown 20
/prp channel
/prp channel PARTY
```

Die Textchance wird auf einen Wert zwischen 0 und 100 begrenzt. Die Abklingzeit
kann nicht negativ sein und wird in Sekunden angegeben. `/prp channel` zeigt
den aktuellen Ausgabe-Chatkanal an. Mit `/prp channel <kanal>` lässt er sich
ändern; gültig sind `SAY`, `PARTY`, `RAID`, `INSTANCE_CHAT` und `AUTO`.
Standardmäßig ist `SAY` gesetzt, `AUTO` wählt den Kanal anhand des
Gruppenstatus. Diese Einstellungen werden pro Charakter gespeichert.
`config/Settings.lua` legt den Standardkanal für Charaktere ohne gespeicherte
Einstellung fest.

## Projektstruktur

```text
PaladinRP/
├── README.md
├── CHANGELOG.md
├── LICENSE
├── PaladinRP.toc
├── PaladinRP.lua
├── config/
│   └── Settings.lua
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
  zu ladenden Dateien. Die Reihenfolge dort ist wichtig: Die Settings werden
  vor der Hauptlogik geladen.
- `PaladinRP.lua` enthält Code zur Initialisierung, Textauswahl und Chat-Ausgabe
  sowie den `/prp`-Befehl; Standardwerte werden aus der Settings-Datei gelesen,
  charakterbezogene Einstellungen werden in `PaladinRP_CharacterDB` gespeichert.
- `config/Settings.lua` enthält die Standardwerte für Textchance und
  Abklingzeit sowie den konfigurierbaren Chatkanal für die Textausgabe.
- `data/` enthält die Textpools mit Schlüsseln wie `MIGHT`. Je nach Datenart
  liegen Texte in `ziel`-/`gruppe`-Listen oder in rassenspezifischen Listen.
  Neue Texte können durch Ergänzen der passenden Datenstruktur hinzugefügt
  werden.
- `ui/Settings.lua` ist für eine zukünftige Einstellungsoberfläche vorgesehen;
  eine Konfigurationsoberfläche ist derzeit noch nicht implementiert.

Textchance und Abklingzeit werden unter `PaladinRP_CharacterDB` pro Charakter
gespeichert.

## Tests

Das Projekt enthält derzeit keine automatisierte Testsuite. Die
Slash-Befehle, Textausgabe und Wahl des Chatkanals können manuell im Spiel
geprüft werden.

## Lizenz

Dieses Projekt steht unter der MIT-Lizenz. Den vollständigen Lizenztext findest
du in der Datei [LICENSE](LICENSE).
