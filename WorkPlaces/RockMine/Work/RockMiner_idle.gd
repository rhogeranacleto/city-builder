extends State
class_name RockMiner_idle

func enter():
	await get_tree().create_timer(2).timeout
	
	state_machine.change_state('RockMiner_go_to_resource')
