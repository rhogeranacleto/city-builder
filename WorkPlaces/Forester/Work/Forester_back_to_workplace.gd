extends State
class_name Forester_back_to_workplace

func _process(delta: float) -> void:
	if character.walk_to(character.workplace.global_position, delta) < 10:
		state_machine.change_state('Forester_idle')
		
