extends State
class_name Lumberjack_look_for_tree

func enter():
	print('entrou look')
	find_tree()
	pass

func find_tree():
	var trees = get_tree().get_nodes_in_group('tree')
	
	if not trees.is_empty():
		state_machine.context.set('target_tree', trees.get(0))
		
	pass

func update(delta: float):
	var tree_target = state_machine.context.get('target_tree') as Node2D
	
	if tree_target:
		if character.walk_to(tree_target.global_position, delta) < 10:
			state_machine.change_state('Lumberjack_chop')
		pass
