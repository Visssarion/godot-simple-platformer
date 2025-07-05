class_name FlippableCharacter extends CharacterBody2D

enum FacingDirection {RIGHT = 1, LEFT = -1}

var current_direction: FacingDirection = FacingDirection.RIGHT:
	set(value):
		if (current_direction != value):
			print(value)
			current_direction = value
			if current_direction == FacingDirection.RIGHT:
				rotation = 0
				scale = Vector2(1,1)
			else:
				rotation = PI
				scale = Vector2(1,-1)

static func sign_to_facing_direction(sign: float) -> FacingDirection:
	if sign == -1:
		return FacingDirection.LEFT
	else:
		return FacingDirection.RIGHT

static func facing_direction_to_sign(direction: FacingDirection) -> float:
	return direction

static func flip_direction(direction: FacingDirection) -> FacingDirection:
	if direction == FacingDirection.RIGHT:
		return FacingDirection.LEFT
	else:
		return FacingDirection.RIGHT
