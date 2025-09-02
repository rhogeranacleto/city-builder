extends Workplace
class_name RockMine

@export var resource: Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	inventory.rock_changed.connect(updateAmountIndicator)
