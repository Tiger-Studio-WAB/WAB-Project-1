extends SceneTree

func _initialize() -> void:
	var game_scene: PackedScene = load("res://scenes/game.tscn")
	if game_scene == null:
		push_error("Failed to load game scene")
		quit(1)
		return

	var game: Node2D = game_scene.instantiate()
	root.add_child(game)

	await process_frame
	await process_frame

	var player: CharacterBody2D = game.get_node("Player")
	var level: Node2D = game.get_node("Level01")
	var ground: TileMapLayer = level.get_node("Ground")

	if ground.get_used_cells().is_empty():
		push_error("Ground tiles were not painted")
		quit(1)
		return

	player.global_position = level.get_spawn_position()
	for _i in range(30):
		await process_frame

	if not player.is_on_floor():
		push_error("Player is not standing on ground at spawn")
		quit(1)
		return

	paused = true
	await process_frame

	if not paused:
		push_error("Pause tree state did not activate")
		quit(1)
		return

	print("Gameplay validation passed: tiles painted, player grounded, pause tree toggles.")
	quit(0)
