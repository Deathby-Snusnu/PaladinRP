# Changelog

## 0.2.0 - 2026-10-14
- Einheitliche Textauswahl und Fallback-Logik.
- Personaltexte blockieren Locale-Fallback nicht mehr.
- Erweiterter DE/EN/FR-Textvorrat.

Aenderungen an PaladinRP werden in dieser Datei dokumentiert.

## [Unreleased]

### Geaendert

- Gemeinsame Kernfunktionen in `TryText` auf `BuildText`, `SendText` und
  `CooldownReady` umgestellt; bisherige Funktionsnamen bleiben als Aliase.
- Dokumentation und Integrationstests um die projektweit einheitliche
  Kernmodulschnittstelle ergaenzt.
- Datenbank, Textauswahl, Chat, Cooldown und Befehle in eigene Core-Module
  ausgelagert. Die Hauptdatei enthaelt die oeffentliche API
  `PaladinRP.TryText` und das Login-Ereignis.
- Standardwerte nach `addon.defaults` und Textdaten in den privaten
  AddOn-Namespace verschoben. `RPChatMod_Settings` und globale Textcontainer
  werden nicht mehr benoetigt; `PaladinRP_CharacterDB` bleibt erhalten.
- TOC-Ladereihenfolge an die Module angepasst und den funktionslosen
  UI-Platzhalter aus der Ladeliste entfernt, ohne seine Datei zu loeschen.
- README mit deutschen Kapiteln, relativen Links, Modulbeschreibung und
  Verhaltensregeln aktualisiert.
- Zahlenargumente strikt als ganze Zahlen geprueft: Chance 0-100,
  Cooldown 0-3600.
- Beschaedigte Charakterdaten mit Meldung repariert, gueltige Werte erhalten.
- Explizit nicht verfuegbare Gruppenkanaele brechen ohne oeffentlichen
  SAY-Fallback ab.
- Erste Textausgabe ohne anfaengliche Cooldown-Sperre; RP-Ausgabe nur fuer
  Paladine.
- Literale Platzhalterersetzung und Textpruefung auf maximal 255 Bytes,
  Zeilenumbrueche und Chat-Markierungen.
- Sprachunabhaengige Volkssprach-IDs und Normalisierung von Scourge zu Undead.
- Mit `*...*` markierte Handlungstexte werden ohne Sternchen als `/me`-Emotes
  gesendet.
- Vor-Login-Aufrufe der API werden sicher abgelehnt; `PaladinRP.TryText`
  liefert einen booleschen Status.
- RP-Ausgabesprache pro Charakter (`deDE`, `enUS`, `frFR`) mit sofortiger
  Aktivierung nach dem Umschalten. Sprachdateien werden einzeln initialisiert;
  eine nicht geladene Sprache kann nicht aktiviert werden.

### Hinzugefuegt

- `/prp help`, `/prp list` und `/prp status`.
- TOC-gesteuerte Regressionstests in `tests/test_addon.lua` fuer Lua 5.1 und
  Lua 5.4 mit isolierten Mock-Umgebungen; nicht Bestandteil des Installations-ZIP.
- `/prp channel` zum Anzeigen und Aendern des Ausgabe-Chatkanals pro Charakter.
- SAY als Standardkanal unabhaengig vom Gruppenstatus; der Ausgabechat bleibt
  ueber `config/Settings.lua` konfigurierbar.
- Zusaetzliche Rollenspieltexte fuer Hammer des Zorns, Handauflegung und
  Goettlichen Schild.
- Zusaetzliche Gruppen- und Zieltexte fuer vorhandene Auren, normale Segen,
  grosse Segen und Siegel.
- Zusaetzliche zwergische und menschliche Rassentexte sowie zwergische Texte
  fuer Kreuzfahrer, Rechtschaffenheit und Furor.
- Eindeutige `GREATER_`-Textschluessel fuer grosse Segen zur Vermeidung von
  Namenskonflikten mit normalen Segen.

## [0.1.0] - 2026-10-06

### Hinzugefuegt

- Grundstruktur des WoW-Addons mit TOC-Metadaten und charakterbezogen
  gespeicherten Einstellungen.
- `/prp`-Befehl fuer zufaellige Rollenspieltexte.
- Textpools fuer Segen, grosse Segen, Auren, Siegel, Faehigkeiten und Voelker.
- Zielbezogene Texte mit `%s`-Ersetzung sowie Gruppentexte ohne Ziel.
- Einstellbare Textchance und Abklingzeit.
- Automatische Auswahl des Chatkanals abhaengig vom Gruppenstatus.
- Deutschsprachige Projektdokumentation in der README.

### Hinweis

- Die Datei fuer die Einstellungsoberflaeche ist vorhanden, eine grafische
  Konfigurationsoberflaeche ist jedoch nicht implementiert.
