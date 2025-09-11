extends Node2D
class_name ExhaustibleResource

@export var amountIndicator : Label
@export var inventory : Inventory

func extract(amount: int) -> int:
	var extract_amount = min(amount, inventory.rock);
	
	inventory.rock -= extract_amount
	
	if inventory.rock <= 0:
		queue_free()
	else:
		amountIndicator.text = str(inventory.rock)
	
	return extract_amount
