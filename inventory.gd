extends Resource
class_name Inventory

@export var wood := 0 :
	set(value) :
		wood = value
		wood_changed.emit(wood)
		pass

signal wood_changed(int)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
