extends State
class_name Stocker_go_to_workplace

func _process(delta: float) -> void:
	
	if character.walk_to(state_machine.context.get('target').global_position, delta) < 10:
		state_machine.change_state('Stocker_get_resource')

#func enter():
	#var workplaces : Array[Workplace] = character.workplace.workplaces
	#
	#print(workplaces)
	#
	#if workplaces.is_empty():
		#await get_tree().create_timer(5).timeout
		#
		#state_machine.change_state('Stocker_idle')
	#else:
		#var workplaces_with_total = workplaces.map(get_workplace_total)
		#
		#var fuller_workspace = workplaces_with_total.get(0)
		#
		#for workplace in workplaces_with_total:
			#if fuller_workspace.get('total') < workplace.get('total'):
				#fuller_workspace = workplace
				#
		#var workplace = fuller_workspace.get('workplace')
		#
		#state_machine.context.set('target', workplace)
	#
	#pass
#
#func get_workplace_total(workplace: Workplace):
	#var total = workplace.items.reduce(func(acc, itemName): return acc + workplace.inventory[itemName], 0)
	#
	#var dic = {}
	#
	#dic.set('workplace', workplace)
	#dic.set('total', total)
	#
	#return dic
	#
	#
