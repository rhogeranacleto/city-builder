extends State
class_name Builder_idle

func enter():
	var workplace = character.workplace as Constructor
	
	if workplace.building_pool.is_empty():
		workplace.new_construction.connect(_on_new_construction)
	else:
		
		pass
	
func _on_new_construction():
	pass
