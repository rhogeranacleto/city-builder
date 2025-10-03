extends Resource
class_name Inventory

enum INVENTORY_ITEM_TYPE {
	wood,
	rock,
	berry
}

signal wood_changed(int)

@export var wood := 0:
	set(value): 
		wood = value
		wood_changed.emit(value);
		emit_changed()

signal rock_changed(int)

@export var rock := 0:
	set(value): 
		rock = value
		rock_changed.emit(value)
		emit_changed()

signal berry_changed(int)

@export var berry := 0:
	set(value): 
		berry = value
		berry_changed.emit(value)
		emit_changed()


var total : int :
	get():
		var sum = 0
		
		for prp in get_script().get_script_property_list():
			if prp.type == 2 and not prp.name == 'total':
				sum += self[prp.name]
		
		return sum

func negative_items() -> Array[String] :
	var negative_keys : Array[String] = []

	for key in INVENTORY_ITEM_TYPE.keys():
		if self[key] < 0:
			negative_keys.append(key)
	
	return negative_keys

func transfer_to(inventory: Inventory, item: INVENTORY_ITEM_TYPE, amount: int):
	var key = INVENTORY_ITEM_TYPE.find_key(item)
	
	var max_amount = min(amount, self[key]);
	
	self[key] -= max_amount
	inventory[key] += max_amount
	pass

func find_available_items(items_list: Array[INVENTORY_ITEM_TYPE]) :
	return items_list.filter(func (item): return self[INVENTORY_ITEM_TYPE.find_key(item)] > 0)
