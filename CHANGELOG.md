# Changelog

Änderungen an Paladin RP werden in dieser Datei dokumentiert.

## [Unreleased]

### Geändert

- Gemeinsame Kernfunktionen in `TryText` auf `BuildText`, `SendText` und
  `CooldownReady` umgestellt; bisherige Funktionsnamen bleiben als Aliase.
- Dokumentation und Integrationstests um die projektweit einheitliche
  Kernmodulschnittstelle ergänzt.
- Bestehende Logik in `core/Database.lua`, `core/Text.lua`, `core/Chat.lua`,
  `core/Cooldown.lua` und `core/Commands.lua` aufgeteilt. Die Hauptdatei
  enthält die öffentliche API `PaladinRP.TryText` und das Login-Ereignis.
- Standardwerte nach `addon.defaults` und Textdaten in den privaten
  AddOn-Namespace verschoben; `RPChatMod_Settings` und globale Textcontainer
  werden nicht mehr benötigt. `PaladinRP_CharacterDB` bleibt erhalten.
- TOC-Ladereihenfolge an die Module angepasst und den funktionslosen
  UI-Platzhalter aus der Ladeliste entfernt, ohne seine Datei zu löschen.
- README mit einheitlichen deutschen Kapiteln, relativen Links,
  Modulbeschreibung und Hinweisen zu den vereinbarten Verhaltensregeln
  aktualisiert.
- Zahlenargumente vollständig und strikt geprüft: Chance 0–100,
  Cooldown 0–3600, ausschließlich ganze Zahlen.
- Beschädigte Charakterdaten mit Meldung repariert, gültige Werte erhalten.
- Explizit nicht verfügbare Gruppenkanäle brechen die Ausgabe ab,
  ohne öffentlichen SAY-Fallback.
- Erste Textausgabe ohne anfängliche Cooldown-Sperre; RP-Ausgabe nur für Paladine.
- Literale Platzhalterersetzung und Prüfung auf maximal 255 Bytes,
  Zeilenumbrüche und Chat-Markierungen.
- Sprachunabhängige Volkssprach-IDs und Normalisierung von Scourge zu Undead.
- `*...*`-markierte Handlungstexte ohne Sternchen als `/me`-Emotes senden.
- Sichere Vor-Login-Aufrufe und boolesche Rückgabe von `PaladinRP.TryText`.

### Hinzugefügt

- `/prp help`, `/prp list` und `/prp status`.

- TOC-gesteuerte Regressionstests in `tests/test_addon.lua` für Lua 5.1
  und Lua 5.4 mit isolierten Mock-Umgebungen. Die Tests sind nur für den
  Quellcode vorgesehen und werden nicht vom Client geladen.
- `/prp channel` zum Anzeigen und Ändern des Ausgabe-Chatkanals pro Charakter.
- `/say` als Standardkanal für Rollenspieltexte, unabhängig vom Gruppenstatus;
  der Ausgabechat bleibt über `config/Settings.lua` konfigurierbar.
- Zusätzliche Rollenspieltexte für Hammer des Zorns, Handauflegung und
  Göttlichen Schild.
- Zusätzliche Gruppentexte für alle vorhandenen Auren.
- Zusätzliche Ziel- und Gruppentexte für alle normalen Segen.
- Zusätzliche Ziel- und Gruppentexte für alle großen Segen.
- Zusätzliche zwergische und menschliche Rassentexte.
- Zusätzliche Gruppentexte für alle vorhandenen Siegel.
- Zwergische Rassentexte für den Kreuzfahrer, die Rechtschaffenheit und den
  Furor.
- Eindeutige `GREATER_`-Textschlüssel für die Auswahl großer Segen, die
  Namenskonflikte mit normalen Segen vermeiden.

## [0.1.0] - 2026-10-06

### Hinzugefügt

- Grundstruktur des World of Warcraft-Addons mit TOC-Metadaten und
  charakterbezogen gespeicherten Einstellungen.
- `/prp`-Befehl zum Ausgeben zufälliger Rollenspieltexte.
- Textpools für Segen, große Segen, Auren, Siegel, Fähigkeiten und Rassen.
- Zielbezogene Texte mit Ersetzung des Platzhalters `%s` durch den Zielnamen
  sowie Gruppentexte ohne Ziel.
- Einstellbare Textchance (`/prp chance`) und Abklingzeit
  (`/prp cooldown`).
- Automatische Auswahl des Chatkanals abhängig vom Gruppenstatus.
- Deutschsprachige Projektdokumentation in der README.

### Hinweis

- Die Datei für die Einstellungsoberfläche ist vorhanden, eine grafische
  Konfigurationsoberfläche ist jedoch noch nicht implementiert.
