extends FlippableCharacter

@export var patrol_speed = 30.0
@export var follow_speed = 50.0
@export var follow_jump = 130.0
@export var attack_range = 16.0
@export var attacked_jump = 200.0

@export var wall_check: RayCast2D
@export var ledge_check: RayCast2D

var player: Player


func _on_health_component_damage_received(_amount: float) -> void:
	if velocity.y > 0:
		velocity.y = 0
	velocity.y -= attacked_jump
