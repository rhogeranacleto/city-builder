extends Node2D
class_name ExhaustibleResource

@export var total := 0
@export var left := 0
@export var amountIndicator : Label

func extract(amount: int) -> int:
	var extract_amount = min(amount, left);
	
	left -= extract_amount
	
	if left <= 0:
		queue_free()
	else:
		amountIndicator.text = str(left) + ' / ' + str(total)
	
	return extract_amount
