extends Node

@export var player: Player

func _physics_process(delta: float) -> void:
	player.input_direction = Input.get_axis("move_left", "move_right")
	player.input_jump = Input.is_action_just_pressed("jump")
	player.input_attack = Input.is_action_just_pressed("attack")
