class_name Player extends FlippableCharacter


const SPEED = 130.0
const JUMP_VELOCITY = -250.0

@export var attack: Attack


func _ready() -> void:
	assert(attack, "Attack hasn't been asigned")

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY


	var direction := Input.get_axis("move_left", "move_right")

	if direction:
		velocity.x = direction * SPEED
		current_direction = sign_to_facing_direction(sign(direction))
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

	if Input.is_action_just_pressed("attack") and is_on_floor():
		attack.attack()
