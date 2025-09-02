extends State
class_name Forester_idle

func enter():
	await get_tree().create_timer(2.0).timeout
	
	state_machine.change_state('Forester_go_to_position')
	pass
