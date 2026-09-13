# WAB 2D Platformer Template

[English](README.md) · [中文](README.zh.md) · [Deutsch](README.de.md)

Godot **4.7** starter template for Tiger Studio / Wab. A playable 2D platformer foundation with movement, a TileMapLayer level, one-way platforms, camera follow, HUD, and pause flow.

## Requirements

- [Godot 4.7+](https://godotengine.org/download/) (tested with 4.7.2)
- Git

## Features

- Main menu with start / quit
- Player controller (`CharacterBody2D`): run, jump, coyote time, jump buffer, variable jump height
- Starter level built with `TileMapLayer` and a shared `TileSet`
- One-way platforms via Godot 4.7 `CollisionShape2D.one_way_collision` + `one_way_collision_direction`
- `Camera2D` follow with smoothing
- HUD with controls hint and pause status
- Pause menu (resume / main menu)

## Controls

| Action | Keys |
|--------|------|
| Move left | `A` or Left Arrow |
| Move right | `D` or Right Arrow |
| Jump | `Space`, `W`, or Up Arrow |
| Pause | `Esc` |

## Quick start

```bash
git clone https://github.com/<org>/WAB-Project-1.git
cd WAB-Project-1
```

1. Install [Godot 4.7](https://godotengine.org/download/).
2. Open Godot Project Manager → **Import** → select `project.godot`.
3. Press **F5** (Play) to run from the main menu.

See [docs/GETTING_STARTED.md](docs/GETTING_STARTED.md) for clone options, first-open notes, and troubleshooting.

## Project layout

```
project.godot
autoloads/              # Global singletons (GameState)
entities/player/        # Player scene + controller
levels/                 # Level scenes + tilesets
scenes/                 # Top-level game flow scenes
ui/                     # Main menu, HUD, pause menu
assets/tiles/           # Placeholder tile atlas
docs/                   # Setup and architecture notes
tests/                  # Lightweight validation script
```

See [docs/ARCHITECTURE.md](docs/ARCHITECTURE.md) for scene ownership, physics layers, and naming rules.

## Contributing

This repository is **All Rights Reserved**. Contribution docs exist for invited studio collaborators.

Read [CONTRIBUTING.md](CONTRIBUTING.md) before opening a pull request.

## License

Copyright (c) Tiger Studio / Wab. All Rights Reserved.

See [LICENSE](LICENSE).

## Security

Report security concerns privately. See [SECURITY.md](SECURITY.md).
