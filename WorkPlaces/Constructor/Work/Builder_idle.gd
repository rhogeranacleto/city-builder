extends State
class_name Builder_idle

func enter():
	var workplace = character.workplace as Constructor
	
	if workplace.building_pool.is_empty():
		workplace.new_construction.connect(_on_new_construction)
	else:
		var first_building = workplace.building_pool.get(0)
		
		character.state_machine.context.set('building', first_building)
		
		pass
	
func _on_new_construction():
	pass
