extends State
class_name Lumberjack_deliver

func _process(delta: float) -> void:
	if character.walk_to(character.workplace.global_position, delta) < 10:
		var wood = character.inventory.wood
		
		character.workplace.inventory.wood += wood
		character.inventory.wood -= wood
		
		print('otro', character.workplace.inventory.wood)
		print('2', character.workplace.inventory.rock)
		
		state_machine.change_state('Lumberjack_idle')
