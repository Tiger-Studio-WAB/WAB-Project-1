class_name Player
extends CharacterBody2D

@export var move_speed: float = 220.0
@export var acceleration: float = 1400.0
@export var air_acceleration: float = 900.0
@export var jump_velocity: float = -420.0
@export var coyote_time: float = 0.1
@export var jump_buffer_time: float = 0.1
@export var gravity_multiplier: float = 1.0
@export var jump_cut_multiplier: float = 0.55

@onready var sprite: ColorRect = $Visual
@onready var camera: Camera2D = $Camera2D

var _coyote_timer: float = 0.0
var _jump_buffer_timer: float = 0.0


func _ready() -> void:
	camera.make_current()


func _physics_process(delta: float) -> void:
	_apply_gravity(delta)
	_handle_jump_timers(delta)
	_handle_horizontal_movement(delta)
	move_and_slide()
	_update_facing()


func _apply_gravity(delta: float) -> void:
	if not is_on_floor():
		velocity.y += get_gravity().y * gravity_multiplier * delta


func _handle_jump_timers(delta: float) -> void:
	if is_on_floor():
		_coyote_timer = coyote_time
	else:
		_coyote_timer = maxf(_coyote_timer - delta, 0.0)

	if Input.is_action_just_pressed("jump"):
		_jump_buffer_timer = jump_buffer_time
	else:
		_jump_buffer_timer = maxf(_jump_buffer_timer - delta, 0.0)

	if _jump_buffer_timer > 0.0 and _coyote_timer > 0.0:
		velocity.y = jump_velocity
		_coyote_timer = 0.0
		_jump_buffer_timer = 0.0

	if Input.is_action_just_released("jump") and velocity.y < 0.0:
		velocity.y *= jump_cut_multiplier


func _handle_horizontal_movement(delta: float) -> void:
	var direction := Input.get_axis("move_left", "move_right")
	var target_speed := direction * move_speed
	var accel := acceleration if is_on_floor() else air_acceleration
	velocity.x = move_toward(velocity.x, target_speed, accel * delta)


func _update_facing() -> void:
	if absf(velocity.x) > 1.0:
		sprite.scale.x = signf(velocity.x)
