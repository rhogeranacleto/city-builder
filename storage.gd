extends Node2D

var total := 0 :
	set(value) :
		total = value
		
		storage_name.text = "Storage " + type +  " " + str(total) + " / " + str(limit)
		pass

var limit := 100

@export var type : String
@onready var storage_name: Label = $StorageName


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	storage_name.text = "Storage " + type + "0 / " + str(limit)
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func addResource(amount: int) -> void:
	total += amount
	
	pass
