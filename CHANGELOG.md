# Changelog

Änderungen an Paladin RP werden in dieser Datei dokumentiert.

## [Unreleased]

### Hinzugefügt

- Neue Siegeltexte für den Kreuzfahrer und den Furor.
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
