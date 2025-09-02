extends Node
class_name StateMachine

@export var character: Character

var current_state: State
var states := {}
var context := {}

func add_state(state_script: Script):
	var state_name = state_script.get_global_name()
	var instance = state_script.new()
	
	instance.name = state_name
	instance.state_machine = self
	instance.character = character
	states[state_name] = instance
	add_child(instance)

func start(initial_state: String):
	change_state(initial_state)

func change_state(new_state: String):
	if current_state:
		current_state.exit()
		#remove_child(current_state)
	current_state = states[new_state]
	#add_child(current_state)
	current_state.enter()

func _process(delta):
	if current_state:
		current_state.update(delta)

func updateCollection(statesCollection : Array[Script]):
	for child in get_children():
		remove_child(child)
		child.queue_free()
	
	for newState in statesCollection:
		add_state(newState)
