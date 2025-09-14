extends Node2D
class_name Building

var construction_progress := 0.0

@export var needs : Inventory

func _ready() -> void:
	modulate.a = construction_progress
