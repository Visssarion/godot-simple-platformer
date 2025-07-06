extends CanvasLayer

@onready var health_bar: TextureProgressBar = get_node(^"%HealthBar")
@onready var enemies_killed_label: Label = get_node(^"%EnemiesKilled")
@onready var restart: Control = get_node(^"%RestartPanel")
@onready var game_over: Control = get_node(^"%GameOverPanel")
@onready var win: Control = get_node(^"%WinPanel")

var player: Player

var enemies_killed: int = 0

func _ready() -> void:
	_connect_signals.call_deferred()

func _connect_signals():
	player = get_tree().get_first_node_in_group(&"player")

	var level_finish: FinishPoint = get_tree().get_first_node_in_group(&"level_finish")

	player.health.health_updated.connect(health_bar.set_value)
	player.health.max_health_updated.connect(health_bar.set_max)
	health_bar.value = player.health.health
	health_bar.max_value = player.health.max_health
	player.health.death.connect(restart.show)
	player.health.death.connect(game_over.show)
	level_finish.player_walked_in.connect(func(_player): restart.show(); win.show())



func on_enemy_killed():
	enemies_killed += 1
	enemies_killed_label.text = str(enemies_killed)


func _on_restart_button_pressed() -> void:
	get_tree().reload_current_scene()
