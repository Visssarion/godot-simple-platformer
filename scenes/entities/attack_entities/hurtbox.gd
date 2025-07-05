class_name Hurtbox extends Area2D

signal on_get_hurt(damage: float)

func get_hurt(_damage: float):
	print("ouch")
	on_get_hurt.emit()
