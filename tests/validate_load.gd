extends SceneTree

func _initialize() -> void:
	var main_menu := load("res://ui/main_menu.tscn")
	if main_menu == null:
		push_error("Failed to load main menu")
		quit(1)
		return

	var game := load("res://scenes/game.tscn")
	if game == null:
		push_error("Failed to load game scene")
		quit(1)
		return

	var player_script := load("res://entities/player/player.gd")
	if player_script == null:
		push_error("Failed to load player script")
		quit(1)
		return

	print("Validation passed: main menu, game scene, and player script load successfully.")
	quit(0)
