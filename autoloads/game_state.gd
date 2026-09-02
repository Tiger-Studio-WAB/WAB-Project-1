extends Node

## Global game flow state for the starter template.
## Tracks pause state and scene transitions between menu and gameplay.

signal pause_changed(is_paused: bool)

var is_paused: bool = false


func set_paused(value: bool) -> void:
	if is_paused == value:
		return
	is_paused = value
	get_tree().paused = value
	pause_changed.emit(value)


func toggle_pause() -> void:
	set_paused(not is_paused)


func go_to_main_menu() -> void:
	set_paused(false)
	get_tree().change_scene_to_file("res://ui/main_menu.tscn")


func start_game() -> void:
	set_paused(false)
	get_tree().change_scene_to_file("res://scenes/game.tscn")


func quit_game() -> void:
	get_tree().quit()
