extends Node
class_name StateMachine

@export var character: Character

var statesCollection : Array[StatesCollection] :
	set(newStates):
		for child in get_children():
			remove_child(child)
			child.queue_free()
		
		for newState in newStates:
			add_state(newState)
		
var current_state: State
var states := {}

func add_state(stateCollection: StatesCollection):
	var instance = stateCollection.actionState.new()
	instance.name = stateCollection.name
	instance.state_machine = self
	states[stateCollection.name] = instance
	add_child(instance)

func start(initial_state: String):
	change_state(initial_state)

func change_state(new_state: String):
	if current_state:
		current_state.exit()
		#remove_child(current_state)
	#current_state = states[new_state]
	#add_child(current_state)
	#current_state.enter()

func _process(delta):
	if current_state:
		current_state.update(delta)
