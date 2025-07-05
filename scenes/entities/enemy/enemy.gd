extends FlippableCharacter

const PATROL_SPEED = 30.0
const FOLLOW_SPEED = 50.0
const FOLLOW_JUMP = 130.0
const ATTACK_RANGE = 16.0
const ATTACKED_JUMP = 200.0

@export var wall_check: RayCast2D
@export var ledge_check: RayCast2D

var player: Player


func _on_health_component_damage_received(_amount: float) -> void:
	if velocity.y > 0:
		velocity.y = 0
	velocity.y -= ATTACKED_JUMP
