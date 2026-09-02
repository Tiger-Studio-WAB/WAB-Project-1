extends CanvasLayer


func _ready() -> void:
	process_mode = Node.PROCESS_MODE_WHEN_PAUSED
	visible = false
	GameState.pause_changed.connect(_on_pause_changed)


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		GameState.toggle_pause()
		get_viewport().set_input_as_handled()


func _on_pause_changed(is_paused: bool) -> void:
	visible = is_paused


func _on_resume_pressed() -> void:
	GameState.set_paused(false)


func _on_menu_pressed() -> void:
	GameState.go_to_main_menu()
