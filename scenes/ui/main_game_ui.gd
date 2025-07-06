extends CanvasLayer

@onready var health_bar: TextureProgressBar = get_node(^"%HealthBar")
var player: Player

func _ready() -> void:
	_connect_signals.call_deferred()

func _connect_signals():
	player = get_tree().get_first_node_in_group("player")

	player.health.health_updated.connect(health_bar.set_value)
	player.health.max_health_updated.connect(health_bar.set_max)
	health_bar.value = player.health.health
	health_bar.max_value = player.health.max_health
