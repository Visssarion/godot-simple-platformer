class_name SearchArea extends Area2D

signal body_found(body: Node2D)

@export var group_name: StringName

const TERRAIN_LAYER: int = 1

func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node2D):
	if body.is_in_group(group_name):
		if raycast_line_of_sight(body):
			body_found.emit(body)

func raycast_line_of_sight(body: Node2D) -> bool:
	var space_state = get_world_2d().direct_space_state
	var query = PhysicsRayQueryParameters2D.create(self.global_position, body.global_position, TERRAIN_LAYER, [self.get_rid()])
	var result = space_state.intersect_ray(query)
	return result.is_empty()
