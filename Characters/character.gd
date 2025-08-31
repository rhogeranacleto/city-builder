extends Node2D
class_name Character

@export var workplace : Workplace :
	set(newWorkplace) :
		workplace.unregister_worker(self)
		
		workplace = newWorkplace
		
		workplace.register_worker(self)

var job : Job


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
