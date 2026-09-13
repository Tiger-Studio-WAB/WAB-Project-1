# Architektur

[English](ARCHITECTURE.md) · [中文](ARCHITECTURE.zh.md) · [Deutsch](ARCHITECTURE.de.md)

> **Entwurf:** Deutsche Fassung zur Prüfung durch Mingli29.

Überblick, wie die WAB-2D-Platformer-Vorlage organisiert ist.

## Designziele

- Feature-first-Ordner, Szenen und Skripte möglichst nebeneinander
- Input-Actions in den Projekteinstellungen, nicht als fest verdrahtete Tasten
- Kleine Autoload-Fläche (im Starterkit nur `GameState`)
- Klare Szenen-Verantwortlichkeiten für späteres Wachstum

## Ordnerkarte

| Pfad | Zweck |
|------|---------|
| `autoloads/` | Globale Singletons, überall verfügbar |
| `entities/` | Gameplay-Akteure (Spieler, später Gegner/Items) |
| `levels/` | Level-Szenen, Spawn-Punkte, Tilesets |
| `scenes/` | Übergeordnete Flow-Szenen (Spielwurzel) |
| `ui/` | Menüs und HUD |
| `assets/` | Roh-Art/Audio, nicht an eine einzelne Szene gebunden |
| `tests/` | Leichte Validierungshelfer |
| `docs/` | Menschenlesbare Projektdokumentation |

## Szenen-Verantwortung

| Szene | Verantwortlich für |
|-------|------|
| `ui/main_menu.tscn` | Menünavigation, App starten oder beenden |
| `scenes/game.tscn` | Verdrahtung einer Gameplay-Session (Level, Spieler, HUD, Pause) |
| `levels/level_01.tscn` | Levelgeometrie, Tile-Malerei, Einweg-Plattformen, Spawn-Punkt |
| `entities/player/player.tscn` | Bewegung, Kamera-Follow, lokaler Spielerzustand |
| `ui/hud.tscn` | Status auf dem Bildschirm und Steuerungshinweise |
| `ui/pause_menu.tscn` | Pause-Overlay und Aktionen Fortsetzen/Menü |

## Autoloads

### `GameState` (`autoloads/game_state.gd`)

Aufgaben:

- Pause / Pause aufheben (`get_tree().paused`)
- Szenenwechsel zwischen Hauptmenü und Spiel
- `pause_changed` für UI-Updates auslösen

Halte neue globale Systeme klein. Bevorzuge szenenlokale Logik, bis mehrere Szenen denselben Zustand brauchen.

## Physik-Layer

Konfiguriert in `project.godot` unter `[layer_names]`:

| Layer | Bit | Name | Verwendet von |
|-------|-----|------|---------|
| 1 | `1 << 0` | `world` | Bodentiles (TileMapLayer-Kollision) |
| 2 | `1 << 1` | `player` | Spielerkörper |
| 3 | `1 << 2` | `platforms` | Einweg-Plattformen zum Durchspringen |

Spieler `collision_mask = 5` (world + platforms).

## Input-Actions

| Action | Zweck |
|--------|---------|
| `move_left` | Horizontale Bewegung nach links |
| `move_right` | Horizontale Bewegung nach rechts |
| `jump` | Sprung / Jump Buffer |
| `pause` | Pause-Menü umschalten |

## Namenskonventionen

| Element | Konvention | Beispiel |
|------|------------|---------|
| Szenendateien | `snake_case.tscn` | `main_menu.tscn` |
| Skripte | `snake_case.gd` | `player.gd` |
| Knotennamen | `PascalCase` | `SpawnPoint` |
| Signale | `snake_case`-Verben | `pause_changed` |
| Konstanten | `UPPER_SNAKE_CASE` | `GROUND_TILE` |
| Exports | `snake_case` | `move_speed` |

## Hinweise zur Spielerbewegung

`entities/player/player.gd` implementiert:

- Horizontale Bewegung mit Beschleunigung (eigene Boden-/Luftwerte)
- Coyote Time nach dem Verlassen einer Plattform
- Jump Buffer vor der Landung
- Frühes Loslassen des Sprungs (variable Sprunghöhe)

Beim Prototyping exportierte Werte im Inspektor justieren, statt Konstanten zu ändern.

## Levelbau

`levels/level_01.gd` malt Tiles zur Laufzeit über `TileMapLayer.set_cell()`, damit die Vorlage lesbar bleibt, ohne binäre Tile-Daten von Hand zu editieren.

Einweg-Plattformen sind eigene `StaticBody2D`-Knoten und zeigen die gerichtete One-Way-Collision-API von Godot 4.7:

```gdscript
collision_shape.one_way_collision = true
collision_shape.one_way_collision_direction = Vector2(0, 1)
```

## Anti-Patterns vermeiden

- Tastatur-Scancodes fest in Gameplay-Skripten verdrahten
- Tiefe Knotenpfade wie `$"../../SomeNode"` über unverbundene Szenen
- `GameState` zu einem Sammel-Manager für jedes Feature aufblähen
- Menülogik in Spieler- oder Level-Skripte mischen

## Erweiterungspfade

Sinnvolle nächste Schritte nach dem Starterkit:

1. Sammelobjekte als `Area2D`-Szenen unter `entities/` hinzufügen
2. Leveldaten in `.tres`-Ressourcen oder zusätzliche `TileMapLayer`-Knoten aufteilen
3. Einen eigenen `AudioManager`-Autoload einführen, wenn SFX/Musik kommen
4. Export-Presets unter `export/` anlegen, wenn Desktop-/Mobile-Builds anstehen
