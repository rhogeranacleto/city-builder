extends State
class_name RockMiner_extract

var resource: ExhaustibleResource

func enter():
	resource = character.workplace.resource
	
	if not resource:
		state_machine.change_state('RockMiner_idle')
	else:
		await get_tree().create_timer(2.0).timeout
		
		var extracted = resource.extract(1)
		
		character.inventory.addItem('rock', extracted)
		
		state_machine.change_state('RockMiner_deliver')
