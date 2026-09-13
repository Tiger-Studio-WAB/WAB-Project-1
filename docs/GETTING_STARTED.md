# Getting Started

[English](GETTING_STARTED.md) · [中文](GETTING_STARTED.zh.md) · [Deutsch](GETTING_STARTED.de.md)

This guide covers cloning the repository, opening the project in Godot 4.7, and running the starter template.

## Clone the repository

### HTTPS

```bash
git clone https://github.com/<org>/WAB-Project-1.git
cd WAB-Project-1
```

### SSH

```bash
git clone git@github.com:<org>/WAB-Project-1.git
cd WAB-Project-1
```

Replace `<org>` with your GitHub organization or username.

## Install Godot 4.7

1. Download Godot **4.7** from [godotengine.org/download](https://godotengine.org/download/).
2. Use the **Standard** build (not .NET) unless you plan to add C# support later.
3. For this 2D template, the project uses the **GL Compatibility** renderer for broad hardware support.

## Open the project

1. Launch Godot.
2. In the Project Manager, click **Import**.
3. Browse to the cloned folder and select `project.godot`.
4. Click **Import & Edit**.

Godot generates a local `.godot/` cache folder on first open. That folder is gitignored and should not be committed.

## Run the game

- Press **F5** or click the Play button.
- Main scene: `res://ui/main_menu.tscn`
- Click **Start Game** to load the sample level.

## First-open notes

| Topic | Notes |
|-------|-------|
| `.godot/` folder | Editor cache, import data, and local settings. Generated locally. |
| `.uid` files | Godot 4 resource IDs. Safe to commit; help keep references stable across the team. |
| Import time | First open may take a few seconds while textures import. |
| Input map | Defined in `project.godot` under `[input]`. Extend there instead of hardcoding keys in scripts. |

## Validate locally (optional)

If Godot is on your PATH:

```bash
godot --headless --path . --script res://tests/validate_load.gd
godot --headless --path . --script res://tests/validate_gameplay.gd
```

Expected output:

```text
Validation passed: main menu, game scene, and player script load successfully.
Gameplay validation passed: tiles painted, player grounded, pause tree toggles.
```

On macOS with the default app install:

```bash
/Applications/Godot.app/Contents/MacOS/Godot --headless --path . --script res://tests/validate_load.gd
```

## Troubleshooting

### Missing textures or pink materials

- Close Godot, delete `.godot/`, reopen the project, and let imports finish.

### Player falls through the floor

- Confirm `levels/tilesets/starter_tileset.tres` is assigned on the `Ground` `TileMapLayer`.
- Confirm physics layer `world` (layer 1) is enabled on ground collision.

### Pause menu does not appear

- Press `Esc` during gameplay.
- Confirm `GameState` autoload is registered in `project.godot`.

### Wrong Godot version

- This template targets Godot **4.7+**. Older 4.x versions may open the project but are not supported.

## Next steps

- Read [ARCHITECTURE.md](ARCHITECTURE.md) before adding features.
- Extend `levels/level_01.gd` or duplicate the level scene for new stages.
- Tune movement in `entities/player/player.gd` exports.
