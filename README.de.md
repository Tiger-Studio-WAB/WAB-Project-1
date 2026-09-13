# WAB 2D-Platformer-Vorlage

[English](README.md) · [中文](README.zh.md) · [Deutsch](README.de.md)

> **Entwurf:** Deutsche Fassung zur Prüfung durch Mingli29.

Godot-**4.7**-Startervorlage für Tiger Studio / Wab. Eine spielbare 2D-Platformer-Grundlage mit Bewegung, einem TileMapLayer-Level, Einweg-Plattformen, Kamera-Follow, HUD und Pause-Ablauf.

## Voraussetzungen

- [Godot 4.7+](https://godotengine.org/download/) (getestet mit 4.7.2)
- Git

## Funktionen

- Hauptmenü mit Start / Beenden
- Spielersteuerung (`CharacterBody2D`): Laufen, Springen, Coyote Time, Jump Buffer, variable Sprunghöhe
- Startlevel mit `TileMapLayer` und einem gemeinsamen `TileSet`
- Einweg-Plattformen über Godot 4.7 `CollisionShape2D.one_way_collision` + `one_way_collision_direction`
- `Camera2D`-Follow mit Glättung
- HUD mit Steuerungshinweis und Pause-Status
- Pause-Menü (Fortsetzen / Hauptmenü)

## Steuerung

| Aktion | Tasten |
|--------|------|
| Nach links | `A` oder Pfeil links |
| Nach rechts | `D` oder Pfeil rechts |
| Springen | `Space`, `W` oder Pfeil hoch |
| Pause | `Esc` |

## Schnellstart

```bash
git clone https://github.com/<org>/WAB-Project-1.git
cd WAB-Project-1
```

1. Installiere [Godot 4.7](https://godotengine.org/download/).
2. Öffne den Godot Project Manager → **Import** → wähle `project.godot`.
3. Drücke **F5** (Play), um vom Hauptmenü zu starten.

Siehe [docs/GETTING_STARTED.de.md](docs/GETTING_STARTED.de.md) für Klon-Optionen, Hinweise zum ersten Öffnen und Fehlerbehebung.

## Projektstruktur

```
project.godot
autoloads/              # Globale Singletons (GameState)
entities/player/        # Spielerszene + Controller
levels/                 # Level-Szenen + Tilesets
scenes/                 # Szenen für den übergeordneten Spielfluss
ui/                     # Hauptmenü, HUD, Pause-Menü
assets/tiles/           # Platzhalter-Tile-Atlas
docs/                   # Setup- und Architektur-Notizen
tests/                  # Leichtes Validierungsskript
```

Siehe [docs/ARCHITECTURE.de.md](docs/ARCHITECTURE.de.md) für Szenen-Verantwortung, Physik-Layer und Namensregeln.

## Mitwirken

Dieses Repository ist **All Rights Reserved**. Die Beitragsdokumente gelten für eingeladene Studio-Mitarbeitende.

Lies [CONTRIBUTING.de.md](CONTRIBUTING.de.md), bevor du einen Pull Request öffnest.

## Lizenz

Copyright (c) Tiger Studio / Wab. All Rights Reserved.

Siehe [LICENSE](LICENSE).

## Sicherheit

Melde Sicherheitsbedenken privat. Siehe [SECURITY.de.md](SECURITY.de.md).
