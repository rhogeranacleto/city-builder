extends Resource
class_name InventoryItem

@export var value := 0 :
	set(newValue):
		value = newValue
		value_changed.emit(newValue)

signal value_changed(int)
