extends Resource
class_name Job

@export var initial : String
@export var states : Array[StatesCollection]

func assign_to(state_machine: StateMachine):	
	for state in states:
		var new_state = state.actionState.new()
		state_machine.add_child(new_state)
		
	state_machine.start(initial)
	pass
