# Erste Schritte

[English](GETTING_STARTED.md) · [中文](GETTING_STARTED.zh.md) · [Deutsch](GETTING_STARTED.de.md)

> **Entwurf:** Deutsche Fassung zur Prüfung durch Mingli29.

Dieser Leitfaden erklärt das Klonen des Repositories, das Öffnen des Projekts in Godot 4.7 und das Starten der Startervorlage.

## Repository klonen

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

Ersetze `<org>` durch deine GitHub-Organisation oder deinen Benutzernamen.

## Godot 4.7 installieren

1. Lade Godot **4.7** von [godotengine.org/download](https://godotengine.org/download/) herunter.
2. Nutze den **Standard**-Build (nicht .NET), sofern du später kein C# ergänzen willst.
3. Für diese 2D-Vorlage verwendet das Projekt den Renderer **GL Compatibility**, damit mehr Hardware mitkommt.

## Projekt öffnen

1. Starte Godot.
2. Klicke im Project Manager auf **Import**.
3. Navigiere zum geklonten Ordner und wähle `project.godot`.
4. Klicke auf **Import & Edit**.

Beim ersten Öffnen erzeugt Godot einen lokalen `.godot/`-Cache-Ordner. Dieser Ordner ist gitignored und soll nicht committed werden.

## Spiel starten

- Drücke **F5** oder klicke auf Play.
- Hauptszene: `res://ui/main_menu.tscn`
- Klicke auf **Start Game**, um das Beispiel-Level zu laden.

## Hinweise zum ersten Öffnen

| Thema | Hinweise |
|-------|-------|
| `.godot/`-Ordner | Editor-Cache, Importdaten und lokale Einstellungen. Wird lokal erzeugt. |
| `.uid`-Dateien | Godot-4-Ressourcen-IDs. Sicher zu committen; halten Referenzen im Team stabil. |
| Importzeit | Das erste Öffnen kann ein paar Sekunden dauern, während Texturen importiert werden. |
| Input Map | Definiert in `project.godot` unter `[input]`. Dort erweitern, statt Tasten in Skripten fest zu verdrahten. |

## Lokal validieren (optional)

Wenn Godot auf deinem PATH liegt:

```bash
godot --headless --path . --script res://tests/validate_load.gd
godot --headless --path . --script res://tests/validate_gameplay.gd
```

Erwartete Ausgabe:

```text
Validation passed: main menu, game scene, and player script load successfully.
Gameplay validation passed: tiles painted, player grounded, pause tree toggles.
```

Auf macOS mit der Standard-App-Installation:

```bash
/Applications/Godot.app/Contents/MacOS/Godot --headless --path . --script res://tests/validate_load.gd
```

## Fehlerbehebung

### Fehlende Texturen oder pinke Materialien

- Godot schließen, `.godot/` löschen, Projekt erneut öffnen und Importe abschließen lassen.

### Spieler fällt durch den Boden

- Prüfe, dass `levels/tilesets/starter_tileset.tres` auf dem `Ground`-`TileMapLayer` zugewiesen ist.
- Prüfe, dass Physik-Layer `world` (Layer 1) auf der Bodenkollision aktiv ist.

### Pause-Menü erscheint nicht

- Drücke `Esc` während des Spiels.
- Prüfe, dass der `GameState`-Autoload in `project.godot` registriert ist.

### Falsche Godot-Version

- Diese Vorlage zielt auf Godot **4.7+**. Ältere 4.x-Versionen können das Projekt öffnen, sind aber nicht unterstützt.

## Nächste Schritte

- Lies [ARCHITECTURE.de.md](ARCHITECTURE.de.md), bevor du Features hinzufügst.
- Erweitere `levels/level_01.gd` oder dupliziere die Levelszene für neue Stages.
- Justiere die Bewegung über die Exports in `entities/player/player.gd`.
