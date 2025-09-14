extends Node2D
class_name Building

@export var needs : Inventory

func _ready() -> void:
	if not needs.negative.is_empty():
		modulate.a = 0.3
	
	
	pass
	
