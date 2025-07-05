extends Hurtbox

@export var health: HealthComponent

func get_hurt(damage: float):
	super(damage)
	health.damage(damage)
