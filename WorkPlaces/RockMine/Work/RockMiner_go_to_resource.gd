extends State
class_name RockMiner_go_to_resource

var resource: ExhaustibleResource

func enter():
	resource = character.workplace.resource
	
	if not resource:
		state_machine.change_state('RockMiner_idle')

func _process(delta: float) -> void:
	if resource:
		if character.walk_to(resource.global_position, delta) <= 10:
			state_machine.change_state('RockMiner_extract')
	pass
