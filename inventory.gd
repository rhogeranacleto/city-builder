extends Resource
class_name Inventory

enum INVENTORY_ITEM_TYPE {
	wood,
	rock,
	berry
}

@export var wood := 0:
	set(value): 
		wood = value
		wood_changed.emit(value);
		emit_changed()
@export var rock := 0:
	set(value): 
		rock = value
		rock_changed.emit(value)
		emit_changed()
@export var berry := 0:
	set(value): 
		berry = value
		berry_changed.emit(value)
		emit_changed()

@export var total : int :
	get():
		var sum = 0
		
		for prp in get_script().get_script_property_list():
			if prp.type == 2 and not prp.name == 'total':
				sum += self[prp.name]
		
		return sum

signal wood_changed(int)
signal rock_changed(int)
signal berry_changed(int)
