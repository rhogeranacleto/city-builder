extends State
class_name BerryPicker_idle

var target : Node2D

func enter():
	await get_tree().create_timer(2).timeout
	
	state_machine.change_state('BerryPicker_pick')
	
