extends BoxContainer

@export var inventory : Inventory = preload("res://inventory.tres")
@export var label := '';
@export var type : String

@onready var nameLabel: Label = $NameColumn/Label
@onready var valueLabel: Label = $ValueColumn/Label

func _ready() -> void:
	nameLabel.text = str(label)
	
	inventory.connect(type + "_changed", update_value)

func update_value(newValue: int):
	if valueLabel:
		valueLabel.text = str(newValue)
