extends Node2D

@onready var level: Node2D = $Level01
@onready var player: Player = $Player


func _ready() -> void:
	if level.has_method("get_spawn_position"):
		player.global_position = level.get_spawn_position()


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		GameState.toggle_pause()
		get_viewport().set_input_as_handled()
