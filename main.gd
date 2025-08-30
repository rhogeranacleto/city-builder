extends Node2D

var Storage = load("res://storage.tscn")

@onready var marker_2d: Marker2D = $Marker2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	var storage = Storage.instantiate()
	
	storage.type = "Otro"
	
	marker_2d.add_child(storage)

	
	
	
	pass # Replace with function body.
