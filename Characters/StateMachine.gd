extends Node
class_name StateMachine

var character: Character
var states := {}
var current_state: State

func add_state(state_name: String, scene: PackedScene):
	var instance = scene.instantiate()
	instance.name = state_name
	instance.state_machine = self
	states[state_name] = instance

func start(initial_state: String):
	change_state(initial_state)

func change_state(new_state: String):
	if current_state:
		current_state.exit()
		remove_child(current_state)
	current_state = states[new_state]
	add_child(current_state)
	current_state.enter()

func _process(delta):
	if current_state:
		current_state.update(delta)
