# Architecture

Overview of how the WAB 2D Platformer Template is organized.

## Design goals

- Feature-first folders with scenes and scripts co-located where practical
- Input actions defined in the project settings, not hardcoded keys
- Small autoload surface (`GameState` only in the starter kit)
- Clear scene ownership boundaries for future growth

## Folder map

| Path | Purpose |
|------|---------|
| `autoloads/` | Global singletons available everywhere |
| `entities/` | Gameplay actors (player, future enemies/items) |
| `levels/` | Level scenes, spawn points, tilesets |
| `scenes/` | Top-level flow scenes (game root) |
| `ui/` | Menus and HUD |
| `assets/` | Raw art/audio not tied to a single scene |
| `tests/` | Lightweight validation helpers |
| `docs/` | Human-readable project docs |

## Scene ownership

| Scene | Owns |
|-------|------|
| `ui/main_menu.tscn` | Menu navigation, starting or quitting the app |
| `scenes/game.tscn` | Gameplay session wiring (level, player, HUD, pause) |
| `levels/level_01.tscn` | Level geometry, tile painting, one-way platforms, spawn point |
| `entities/player/player.tscn` | Movement, camera follow, local player state |
| `ui/hud.tscn` | On-screen status and control hints |
| `ui/pause_menu.tscn` | Pause overlay and resume/menu actions |

## Autoloads

### `GameState` (`autoloads/game_state.gd`)

Responsibilities:

- Pause / unpause (`get_tree().paused`)
- Scene transitions between main menu and game
- Emitting `pause_changed` for UI updates

Keep new global systems small. Prefer scene-local logic until multiple scenes need the same state.

## Physics layers

Configured in `project.godot` under `[layer_names]`:

| Layer | Bit | Name | Used by |
|-------|-----|------|---------|
| 1 | `1 << 0` | `world` | Ground tiles (TileMapLayer collision) |
| 2 | `1 << 1` | `player` | Player body |
| 3 | `1 << 2` | `platforms` | One-way jump-through platforms |

Player `collision_mask = 5` (world + platforms).

## Input actions

| Action | Purpose |
|--------|---------|
| `move_left` | Horizontal movement left |
| `move_right` | Horizontal movement right |
| `jump` | Jump / jump buffer |
| `pause` | Toggle pause menu |

## Naming conventions

| Item | Convention | Example |
|------|------------|---------|
| Scene files | `snake_case.tscn` | `main_menu.tscn` |
| Scripts | `snake_case.gd` | `player.gd` |
| Node names | `PascalCase` | `SpawnPoint` |
| Signals | `snake_case` verbs | `pause_changed` |
| Constants | `UPPER_SNAKE_CASE` | `GROUND_TILE` |
| Exports | `snake_case` | `move_speed` |

## Player movement notes

`entities/player/player.gd` implements:

- Acceleration-based horizontal movement (separate ground/air values)
- Coyote time after leaving a platform
- Jump buffer before landing
- Early jump release (variable jump height)

Tune exported values in the inspector rather than editing constants when prototyping.

## Level construction

`levels/level_01.gd` paints tiles at runtime via `TileMapLayer.set_cell()` so the template stays readable without hand-editing binary tile data.

One-way platforms are separate `StaticBody2D` nodes demonstrating Godot 4.7's directional one-way collision API:

```gdscript
collision_shape.one_way_collision = true
collision_shape.one_way_collision_direction = Vector2(0, 1)
```

## Anti-patterns to avoid

- Hardcoding keyboard scancodes in gameplay scripts
- Deep node paths like `$"../../SomeNode"` across unrelated scenes
- Growing `GameState` into a catch-all manager for every feature
- Mixing menu logic into player or level scripts

## Extension paths

Reasonable next steps beyond the starter kit:

1. Add collectibles as `Area2D` scenes under `entities/`
2. Split level data into `.tres` resources or additional `TileMapLayer` nodes
3. Introduce a dedicated `AudioManager` autoload when SFX/music ship
4. Add export presets under `export/` when targeting desktop/mobile builds
