extends State

var enemy: FlippableCharacter

func _set_state_parent(parent: Node):
	enemy = parent as FlippableCharacter

func _physics_process(delta: float) -> void:
	if not enemy.is_on_floor():
		enemy.velocity += enemy.get_gravity() * delta

	if enemy.is_on_floor():
		enemy.velocity.y -= enemy.FOLLOW_JUMP

	var player_direction: Vector2 = enemy.player.global_position - enemy.global_position

	if player_direction.length() <= enemy.ATTACK_RANGE:
		state_machine.current_state = "Attack"

	enemy.current_direction = enemy.sign_to_facing_direction(sign(player_direction.x))

	enemy.velocity.x = enemy.facing_direction_to_sign(enemy.current_direction) * enemy.FOLLOW_SPEED
	enemy.move_and_slide()
