extends Node2D

var integrityLevel := 100.0 :
	set(value):
		integrityLevel = value
		integrityLabel.text = str(value)
		pass 

@onready var integrityLabel: Label = $IntegrityLabel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	integrityLabel.text = str(integrityLevel)
	pass # Replace with function body.


func chop() -> bool:
	integrityLevel -= 40
	
	var finished = integrityLevel <= 0
	
	if finished:
		queue_free()
		return true
	
	return false
