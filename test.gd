extends Node2D

@onready var rock_mine: RockMine = $RockMine


func _input(event: InputEvent) -> void:
	if event.is_action("tap"):
		rock_mine.inventory.wood += 1
		rock_mine.inventory.berry += 3
		print(rock_mine.inventory.wood)
		print(rock_mine.inventory.berry)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	rock_mine.inventory.changed.connect(func (): print('mudou', rock_mine.inventory.total))
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
