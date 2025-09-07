extends State
class_name Stocker_go_to_workplace

func _process(delta: float) -> void:
	if character.walk_to(state_machine.context.get('target').global_position, delta) < 10:
		state_machine.change_state('Stocker_get_resource')
