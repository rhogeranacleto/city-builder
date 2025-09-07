extends State
class_name Stocker_idle

func enter():
	var workplaces : Array[Workplace] = character.workplace.workplaces
		
	if workplaces.is_empty():
		await get_tree().create_timer(5).timeout
		
		state_machine.change_state('Stocker_idle')
	else:
		var fuller_workspace = workplaces.get(0)
		
		for workplace in workplaces:
			if fuller_workspace.inventory.total < workplace.inventory.total:
				fuller_workspace = workplace
				
		state_machine.context.set('target', fuller_workspace)
		state_machine.change_state('Stocker_go_to_workplace')
	
	pass
