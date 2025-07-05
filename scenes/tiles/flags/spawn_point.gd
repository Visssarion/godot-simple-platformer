extends Area2D

const GROUP_NAME: StringName = &"player_spawn"

var player_prefab: PackedScene = preload("uid://oco65wgyrrsr")

func _enter_tree() -> void:
	if not is_in_group(GROUP_NAME):
		add_to_group(GROUP_NAME)
	assert(get_tree().get_nodes_in_group(GROUP_NAME).size() == 1, "There are multiple Player Spawn nodes on the scene")

func _exit_tree() -> void:
	remove_from_group(GROUP_NAME)

func _ready() -> void:
	_spawn_player()

func _spawn_player() -> void:
	var player = player_prefab.instantiate()
	add_sibling(player)
