# Mitwirken

[English](CONTRIBUTING.md) · [中文](CONTRIBUTING.zh.md) · [Deutsch](CONTRIBUTING.de.md)

> **Entwurf:** Deutsche Fassung zur Prüfung durch Mingli29.

Danke, dass du zur WAB-2D-Platformer-Vorlage beiträgst.

## Wichtig: Lizenz und Zugang

Dieses Repository ist **All Rights Reserved** (siehe [LICENSE](LICENSE)). Die Beitragsregeln hier gelten für **eingeladene Mitarbeitende**, die mit Tiger Studio / Wab arbeiten. Gehe nicht davon aus, dass du das Projekt forken, weitergeben oder Assets außerhalb der mit dem Studio vereinbarten Nutzung verwenden darfst.

Wenn du keine eingeladene mitarbeitende Person bist, kontaktiere die Maintainers, bevor du Änderungen einreichst.

## Verhaltenskodex

Die Teilnahme unterliegt [CODE_OF_CONDUCT.de.md](CODE_OF_CONDUCT.de.md).

## Entwicklungsumgebung

1. Klone das Repository (siehe [docs/GETTING_STARTED.de.md](docs/GETTING_STARTED.de.md)).
2. Öffne das Projekt in Godot **4.7+**.
3. Führe das optionale Validierungsskript aus:

```bash
godot --headless --path . --script res://tests/validate_load.gd
```

## Branching

- Basis-Branch: `main`
- Feature-Branches: `feature/<short-description>`
- Bugfixes: `fix/<short-description>`

Halte Pull Requests auf ein Anliegen begrenzt.

## GDScript-Stil

- Nutze typisiertes GDScript, wo sinnvoll (`var speed: float = 220.0`)
- Bevorzuge `@export` für designerseitig justierbare Gameplay-Werte
- Verwende Input-Map-Actions; verdrahte keine Tastenkonstanten im Gameplay-Code
- Übernimm die vorhandene Einrückung (Tabs für `.gd`-Dateien)
- Kurze Doc-Kommentare an öffentlichen Autoload-APIs und wiederverwendbaren Klassen

## Szenen- und Asset-Richtlinien

- Halte Szenen klein und kombinierbar
- Lege Skripte möglichst neben ihre Hauptszene
- Neue Gameplay-Akteure unter `entities/`
- Neue Level unter `levels/`
- Committe keinen `.godot/`-Editor-Cache und keine Export-Binaries

## Pull-Request-Checkliste

- [ ] Projekt öffnet in Godot 4.7 ohne Fehler
- [ ] Ablauf Hauptmenü → Spiel → Pause → Fortsetzen funktioniert
- [ ] Spieler kann laufen, springen und auf Boden sowie Einweg-Plattformen landen
- [ ] Keine fremden Dateien (OS-Müll, lokale Editor-Einstellungen, Geheimnisse)
- [ ] Docs aktualisiert, wenn Ordnerlayout, Steuerung oder Architektur geändert wurden

## Commit-Nachrichten

Klare, imperative Betreffzeilen:

- `Add double-jump prototype to player controller`
- `Fix pause menu input when tree is paused`
- `Document physics layer setup in ARCHITECTURE.md`

## Issues melden

Nutze GitHub Issues mit den vorhandenen Vorlagen:

- Fehlermeldungen: Godot-Version, OS, Reproduktionsschritte, erwartet vs. tatsächlich
- Feature-Wünsche: zuerst das Problem beschreiben, dann die vorgeschlagene Lösung

## Sicherheit

Öffne keine öffentlichen Issues für Sicherheitslücken. Siehe [SECURITY.de.md](SECURITY.de.md).

## Fragen

Öffne ein GitHub Issue mit dem Label **Question** oder kontaktiere die Tiger-Studio-Maintainers direkt.
