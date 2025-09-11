extends State
class_name Lumberjack_chop

func enter():
	print('entrou Lumberjack_chopping')
	chop()
	pass

func chop():
	var tree_target = state_machine.context.get('target_tree') as Node
	
	if tree_target:
		var finished = tree_target.chop()
		
		if finished:
			character.inventory.wood += 1
			state_machine.change_state('Lumberjack_deliver')
			state_machine.context.erase('target_tree')
		else:
			await get_tree().create_timer(1.0).timeout
			chop()
