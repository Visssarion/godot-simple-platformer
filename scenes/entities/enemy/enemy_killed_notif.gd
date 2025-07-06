extends Node


func _on_health_component_death() -> void:
	get_tree().call_group(&"enemy_killed_observer", &"on_enemy_killed")
