extends State
class_name Lumberjack_deliver

func update(delta: float):
	if character.walk_to(character.workplace.global_position, delta) < 10:
		character.workplace.inventory.addItem('wood', 3)
		
		print('otro', character.workplace.inventory.wood)
		print('2', character.workplace.inventory.rock)
		
		state_machine.change_state('Lumberjack_idle')
