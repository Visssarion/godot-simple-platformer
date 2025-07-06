extends State

var enemy: FlippableCharacter

func _set_state_parent(parent: Node):
	enemy = parent as FlippableCharacter

func _physics_process(delta: float) -> void:
	if not enemy.is_on_floor():
		enemy.velocity += enemy.get_gravity() * delta

	if enemy.wall_check.is_colliding() or not enemy.ledge_check.is_colliding():
		enemy.current_direction = enemy.flip_direction(enemy.current_direction)

	enemy.velocity.x = enemy.facing_direction_to_sign(enemy.current_direction) * enemy.patrol_speed
	enemy.move_and_slide()


func _on_search_area_body_found(body: Node2D) -> void:
	enemy.player = body
	state_machine.current_state = "Follow"
