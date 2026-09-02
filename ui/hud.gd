extends CanvasLayer


func _ready() -> void:
	GameState.pause_changed.connect(_on_pause_changed)
	_on_pause_changed(GameState.is_paused)


func _on_pause_changed(is_paused: bool) -> void:
	$MarginContainer/Panel/VBoxContainer/StatusLabel.text = "Paused" if is_paused else "Running"
