extends Resource
class_name Job

#@export var initial : String
@export var states_scripts : Array[Script]

#func assign_to(state_machine: StateMachine):	
	#for script in states_scripts:
		#var new_state = script.new()
		#state_machine.add_child(new_state)
		#
	#state_machine.start(initial)
	#pass
