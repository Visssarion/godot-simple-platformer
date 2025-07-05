extends AnimationPlayer


func _on_health_component_damage_received(_amount: float) -> void:
	play(&"get_damage")
