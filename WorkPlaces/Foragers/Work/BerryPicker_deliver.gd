extends State
class_name BerryPicker_deliver

func _process(delta: float) -> void:
	if character.walk_to(character.workplace.global_position, delta) < 5:
		state_machine.change_state('BerryPicker_idle')
	pass
	
func exit():
	character.inventory.addItem('berry', -1)
	character.workplace.inventory.addItem('berry', 1)
