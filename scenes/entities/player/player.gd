class_name Player extends FlippableCharacter


@export var speed = 130.0
@export var jump_velocity = -250.0

@export var attack: Attack

@onready var health: HealthComponent = get_node(^"%Health")

var input_direction: float = 0.0
var input_jump: bool = false
var input_attack: bool = false

func _ready() -> void:
	assert(attack, "Attack hasn't been asigned")

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	if input_jump and is_on_floor():
		velocity.y = jump_velocity


	if input_direction:
		velocity.x = input_direction * speed
		current_direction = sign_to_facing_direction(sign(input_direction))
	else:
		velocity.x = move_toward(velocity.x, 0, speed)

	move_and_slide()

	if input_attack:
		attack.attack()

	input_jump = false
	input_attack = false
	input_direction = 0.0
