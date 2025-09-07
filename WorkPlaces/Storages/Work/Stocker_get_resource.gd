extends State
class_name Stocker_get_resource

var item_to_get : String
var amount : int

func enter():
	var target : Workplace = state_machine.context.get('target')
	
	var item_to_get_index = target.items.find_custom(func(item): return target.inventory[item] > 0)
	
	item_to_get = target.items.get(item_to_get_index)
	
	amount = min(target.inventory[item_to_get], 1)
	
	target.inventory.addItem(item_to_get, -amount)
	character.inventory.addItem(item_to_get, amount)
	
	pass

func _process(delta: float) -> void:
	if character.walk_to(character.workplace.global_position, delta) < 10:
		state_machine.change_state('Stocker_idle')

func exit():
	character.inventory.addItem(item_to_get, -amount)
	character.workplace.inventory.addItem(item_to_get, amount)
