extends State

var enemy: FlippableCharacter

@export var attack: Attack

func _set_state_parent(parent: Node):
	enemy = parent as FlippableCharacter

func _physics_process(delta: float) -> void:
	if not enemy.is_on_floor():
		enemy.velocity += enemy.get_gravity() * delta

	enemy.velocity.x = 0

	enemy.move_and_slide()

func _enter_state():
	await attack.attack()
	state_machine.current_state = "Follow"
