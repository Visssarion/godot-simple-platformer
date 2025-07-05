extends FlippableCharacter

const PATROL_SPEED = 30.0
const FOLLOW_SPEED = 50.0
const FOLLOW_JUMP = 130.0
const ATTACK_RANGE = 16.0

@export var wall_check: RayCast2D
@export var ledge_check: RayCast2D

var player: Player
