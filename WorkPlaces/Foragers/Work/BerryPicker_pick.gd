extends State
class_name BerryPicker_pick

var target : Node2D

func enter():
	var berry_bushes : Array[Node2D] = character.workplace.berry_bushes
	
	target = berry_bushes.pick_random()
	
	pass
	
func _process(delta: float) -> void:
	if character.walk_to(target.global_position, delta) < 5:
		state_machine.change_state('BerryPicker_deliver')
	pass
	
func exit():
	character.inventory.berry += 1
	
