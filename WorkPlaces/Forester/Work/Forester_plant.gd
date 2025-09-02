extends State
class_name Forester_plant

const TREE = preload("res://Resources/Tree/tree.tscn")

func enter():
	var newTree = TREE.instantiate()
	
	get_tree().root.add_child(newTree)
	
	newTree.global_position = character.global_position
	
	state_machine.change_state('Forester_back_to_workplace')

	pass
