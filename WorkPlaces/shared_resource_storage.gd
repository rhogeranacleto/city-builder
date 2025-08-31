extends Node2D

@export var type : String
@export var limit := 0
@export var indicator := Label
@export var inventory : Inventory


func addResource(addAmount: int) -> void:
	var current = inventory[type]
	
	var updated = current + addAmount
	
	inventory[type] = updated
	
	indicator.text = updated + " / " + limit
	pass
	
func removeResource(removeAmount: int) -> void:
	var current = inventory[type]
	
	var updated = current - removeAmount
	
	inventory[type] = updated
	
	indicator.text = updated + " / " + limit
	pass
