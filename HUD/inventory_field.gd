extends BoxContainer

@onready var nameLabel: Label = $NameColumn/Label
@onready var valueLabel: Label = $ValueColumn/Label
@export var inventory : Inventory

signal value_changed(int)

@export var label := '' :
	set(newLabel):
		label = newLabel

		pass
@export var value : int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	nameLabel.text = str(label)
	value = inventory.wood
	
	inventory.wood_changed.connect(update_value)
	
	#var storages = get_tree().get_nodes_in_group("storage_wood")
	#
	#get_tree()
	#
	#for storage in storages:
		#connect_to_storage(storage)

func update_value(newValue: int):
	value = newValue
	
	if valueLabel:
		valueLabel.text = str(newValue)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_value_changed(newValue: int) -> void:
	value = newValue
	pass # Replace with function body.

func connect_to_storage(node: Node2D):
	print(node.type)
	#node.connect('value_changed', Callable(self, 'update_value'))
	pass
