extends Control


func _on_start_pressed() -> void:
	GameState.start_game()


func _on_quit_pressed() -> void:
	GameState.quit_game()
