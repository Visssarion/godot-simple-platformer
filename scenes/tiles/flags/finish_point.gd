class_name FinishPoint extends Area2D

signal player_walked_in(player: Player)

const GROUP_NAME: StringName = &"level_finish"

func _enter_tree() -> void:
	if not is_in_group(GROUP_NAME):
		add_to_group(GROUP_NAME)

func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node2D):
	if body is Player:
		player_walked_in.emit(body)

func _exit_tree() -> void:
	remove_from_group(GROUP_NAME)
