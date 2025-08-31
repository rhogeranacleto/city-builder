extends State
class_name Lumberjack_idle

func enter():
	print('entrou')
	await get_tree().create_timer(3.0).timeout
	
	#state_machine.change_state('look_for_tree')
	pass
