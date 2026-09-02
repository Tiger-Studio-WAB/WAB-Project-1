extends Node2D

## Builds the starter level layout at runtime so the template stays easy to edit
## without hand-authoring TileMapLayer binary cell data.

const GROUND_TILE := Vector2i(0, 0)
const DECORATION_TILE := Vector2i(1, 0)

@onready var ground: TileMapLayer = $Ground
@onready var decorations: TileMapLayer = $Decorations


func _ready() -> void:
	_paint_ground()
	_paint_decorations()


func _paint_ground() -> void:
	for x in range(0, 45):
		ground.set_cell(Vector2i(x, 22), 0, GROUND_TILE)


func _paint_decorations() -> void:
	var decoration_columns := [6, 7, 8, 14, 15, 16, 24, 25, 26, 34, 35, 36]
	for x in decoration_columns:
		decorations.set_cell(Vector2i(x, 21), 0, DECORATION_TILE)


func get_spawn_position() -> Vector2:
	return $SpawnPoint.global_position
