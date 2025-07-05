class_name Attack extends Hitbox

signal attacked

@export var cooldown: float = 1.0
@export var persist: float = 1.0
@export var delay: float = 0.0

var cooldown_timer: Timer
var persist_timer: Timer
var delay_timer: Timer

var _in_progress: bool = false

func _ready() -> void:
	super()
	cooldown_timer = _create_timer(cooldown, "Cooldown")
	persist_timer = _create_timer(persist, "Persist")
	if not is_zero_approx(delay):
		delay_timer = _create_timer(delay, "Delay")
	monitorable = false
	monitoring = false
	hide()

func attack() -> bool:
	if not cooldown_timer.is_stopped() and not _in_progress:
		return false

	_in_progress = true
	if delay_timer:
		delay_timer.start()
		await delay_timer.timeout
	persist_timer.start()
	monitoring = true
	show()
	attacked.emit()
	await persist_timer.timeout
	monitoring = false
	hide()

	cooldown_timer.start()
	_in_progress = false
	return true


## Creates Cooldown timer for character abilities
func _create_timer(timer_cooldown: float, timer_name: String = "CooldownTimer") -> Timer:
	var timer: Timer = Timer.new()
	timer.one_shot = true
	timer.autostart = false
	timer.wait_time = timer_cooldown
	timer.stop()
	timer.name = timer_name
	add_child(timer, false, Node.INTERNAL_MODE_BACK)
	return timer
