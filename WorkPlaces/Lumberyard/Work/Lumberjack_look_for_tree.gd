extends State
class_name Lumberjack_look_for_tree

func enter():
	print('entrou look')
	find_tree()
	pass

func find_tree():
	var trees = get_tree().get_nodes_in_group('tree')
	
	if not trees.is_empty():
		print(trees.get(0))

	pass
