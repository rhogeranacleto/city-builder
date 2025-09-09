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
		
		return 0

func _init() -> void:
	var thisStri: GDScript = get_script()
	
	for prp in thisStri.get_script_property_list():
		print(prp)
		
	print(thisStri.get_script_property_list(),thisStri.get_script_property_list().filter(func (prop): prop.get('type') == 2))
	

signal wood_changed(int)
signal rock_changed(int)
signal berry_changed(int)



#func _init() -> void:
	#for inventory_item in items.values():
		#inventory_item.connect('value_changed', emit_changed_any)

func addItem(item: String, amount: int) -> void:
	self[item] = self[item] + amount
		
	emit_signal(item + "_changed", self[item])
	#changed_any.emit()
	pass

#func emit_changed_any():
	#changed_any.emit()

func set_item(name: String, value):
	#self[name] = value
	
	emit_signal(name + "_changed", self[name])
	emit_changed()
	
	pass

#func _set(property: StringName, value: Variant) -> bool:
	#if INVENTORY_ITEM_TYPE.find_key(property):
		#print('tem')
	#
	#return true

#func transfer_to(inventory: Inventory, item: INVENTORY_ITEM_TYPE,amount: int):
	#items[item].value -= amount
	#inventory.set(str(item), inventory.items[item].value + amount)
