extends Camera2D

@export var target_group: StringName
var target_node: Node2D

func _ready() -> void:
	_find_node.call_deferred()

func _find_node() -> void:
	target_node = get_tree().get_first_node_in_group(target_group)

func _process(delta: float) -> void:
	if target_node:
		self.position = target_node.position
