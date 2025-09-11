extends State
class_name RockMiner_deliver

var resource: ExhaustibleResource

func _process(delta: float) -> void:
	if character.walk_to(character.workplace.global_position, delta) < 10:
		var carring_rocks = character.inventory.rock
		
		character.workplace.inventory.rock += carring_rocks
		
		character.inventory.rock -= carring_rocks
		
		state_machine.change_state('RockMiner_idle')
