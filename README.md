# Paladin RP

Paladin RP enthält Rollenspieltext-Sammlungen zu Segen, Auren, Siegeln,
Fähigkeiten und Völkern sowie Code für zufällige Textauswahl und Chat-Ausgabe.
Die Textchance und Abklingzeit lassen sich über Chatbefehle einstellen.

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

Vorgesehen ist, einen Schlüssel mit `/prp <schlüssel>` aufzurufen. Die
Textausgabe funktioniert derzeit jedoch nicht: Der
Slash-Handler ruft `PaladinRP_TryText` auf, die Funktion ist jedoch als
`PaladinRP.TryText` definiert. Der vorgesehene Chatkanal richtet sich nach dem
Gruppenstatus (Instanzgruppe, Schlachtzug, Gruppe oder ohne Gruppe `/say`).
Außerhalb einer Gruppe wird die für den Charakter verfügbare Volkssprache
verwendet.

Die Textchance und Abklingzeit sind pro Charakter gespeichert. Standardmäßig
beträgt die Textchance 65 Prozent und die Abklingzeit 12 Sekunden. Sie können
im Chat angepasst werden:

```text
/prp chance 65
/prp cooldown 12
```

Die Textchance wird auf einen Wert zwischen 0 und 100 begrenzt. Die Abklingzeit
kann nicht negativ sein und wird in Sekunden angegeben. Beide Einstellungs-
befehle funktionieren unabhängig von der derzeit nicht funktionierenden
Textausgabe.

## Projektstruktur

```text
PaladinRP/
├── README.md
├── CHANGELOG.md
├── LICENSE
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
  sowie den `/prp`-Befehl und die Einstellungen für Textchance und Abklingzeit.
- `data/` enthält die Textpools mit Schlüsseln wie `MIGHT`. Je nach Datenart
  liegen Texte in `ziel`-/`gruppe`-Listen oder in rassenspezifischen Listen.
  Neue Texte können durch Ergänzen der passenden Datenstruktur hinzugefügt
  werden.
- `ui/Settings.lua` ist für eine zukünftige Einstellungsoberfläche vorgesehen;
  eine Konfigurationsoberfläche ist derzeit noch nicht implementiert.

Textchance und Abklingzeit werden unter `PaladinRP_CharacterDB` pro Charakter
gespeichert.

## Tests

Das Projekt enthält derzeit keine automatisierte Testsuite. Die Einstellungs-
Slash-Befehle können im Spiel manuell ausprobiert werden. Die Textausgabe über
`/prp <schlüssel>` ist aufgrund des oben beschriebenen Aufrufnamensfehlers
derzeit nicht funktionsfähig.

## Lizenz

Dieses Projekt steht unter der MIT-Lizenz. Den vollständigen Lizenztext findest
du in der Datei [LICENSE](LICENSE).
