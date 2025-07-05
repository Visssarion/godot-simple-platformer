class_name StateMachine extends Node

@export var starting_state: State

var states: Dictionary[String, State]

var current_state: String:
	set(value):
		if states.has(value) and current_state != value:
			if states.has(current_state):
				states[current_state]._exit_state()
				states[current_state].process_mode = Node.PROCESS_MODE_DISABLED
				prints("exited", current_state)
			current_state = value
			states[current_state]._enter_state()
			states[current_state].process_mode = Node.PROCESS_MODE_INHERIT
			prints("entered", current_state)


func _ready() -> void:
	var parent = get_parent()

	states = {}
	for child in get_children():
		if child is State:
			child._set_state_parent(parent)
			states[child.name] = child
			child.process_mode = Node.PROCESS_MODE_DISABLED
			child.state_machine = self

	#starting_state.process_mode = Node.PROCESS_MODE_INHERIT
	current_state = starting_state.name
