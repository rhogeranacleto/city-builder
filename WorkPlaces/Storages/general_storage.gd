extends Node2D

@export var inventory : Inventory = preload("res://inventory.tres")

func addResource(type: String, amount: int) -> void:
	inventory[type] += amount
	pass

func removeResource(type: String, amount: int) -> void:
	inventory[type] -= amount
	pass
