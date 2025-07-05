extends State

var enemy: FlippableCharacter

@export var attack: Attack
@export var animated: AnimatedSprite2D

func _set_state_parent(parent: Node):
	enemy = parent as FlippableCharacter

func _physics_process(delta: float) -> void:
	if not enemy.is_on_floor():
		enemy.velocity += enemy.get_gravity() * delta

	enemy.velocity.x = 0

	enemy.move_and_slide()

func _enter_state():
	animated.play(&"attack")
	await attack.attack()
	state_machine.current_state = "Follow"
	animated.play(&"idle")
