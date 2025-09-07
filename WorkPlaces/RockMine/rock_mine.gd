extends Workplace
class_name RockMine

@export var resource: ExhaustibleResource

#@onready var area_2d: Area2D = $Area2D

func _on_area_2d_area_entered(area: ExhaustibleResource) -> void:
	resource = area
	pass # Replace with function body.
