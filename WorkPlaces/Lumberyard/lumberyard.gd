extends Workplace
class_name Lumberyard


func _ready() -> void:
	if amountIndicator:
		inventory.wood_changed.connect(updateAmountIndicator)
	
	pass
