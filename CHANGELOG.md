# Changelog

Änderungen an Paladin RP werden in dieser Datei dokumentiert.

## [Unreleased]

### Hinzugefügt

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
