class_name Hitbox extends Area2D

@export var damage: float = 1

func _ready() -> void:
	area_entered.connect(_on_area_entered)

func _on_area_entered(area: Area2D):
	if area is Hurtbox:
		area.get_hurt(damage)
