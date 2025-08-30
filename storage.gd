extends Node2D

@export var type : String
@onready var storage_name: Label = $StorageName

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	storage_name.text = "Storage " + type
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
