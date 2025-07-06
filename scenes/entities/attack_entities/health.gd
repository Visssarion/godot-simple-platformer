class_name HealthComponent
extends Node

signal health_updated(health: float)
signal max_health_updated(max_health: float)
signal damage_received(amount: float)
signal death

@export var max_health : float :
	set(new_value):
		max_health = new_value
		if(health>max_health):
			health = max_health
			health_updated.emit(health)
		max_health_updated.emit(max_health)
	get:
		return max_health

@onready var health : float = max_health :
	set(new_value):
		if new_value < health:
			damage_received.emit(health-new_value)
		health = clamp(new_value, 0, max_health)
		health_updated.emit(health)
		if(health == 0):
			print("DEAD")
			death.emit()
	get:
		return health

func damage(damage_amount: float):
	health -= damage_amount

func heal(heal_amount: float):
	health += heal_amount

func _ready() -> void:
	max_health_updated.emit(max_health)
