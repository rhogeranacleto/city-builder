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

var negative : Array[String] :
	get():
		var negative_keys : Array[String] = []
		for key in Inventory.INVENTORY_ITEM_TYPE.keys():
			if self[key] < 0:
				negative_keys.append(key)
		
		return negative_keys
