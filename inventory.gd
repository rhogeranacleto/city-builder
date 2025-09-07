extends Resource
class_name Inventory

@export var wood := 0
@export var rock := 0
@export var total : int:
	get():
		return wood + rock

signal changed_any
signal wood_changed(int)
signal rock_changed(int)

func addItem(item: String, amount: int) -> void:
	self[item] = self[item] + amount
	
	emit_signal(item + "_changed", self[item])
	changed_any.emit()
	pass
