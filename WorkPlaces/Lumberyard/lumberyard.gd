extends Workplace
class_name Lumberyard


func _ready() -> void:
	inventory.wood_changed.connect(updateAmountIndicator)
	
	pass
