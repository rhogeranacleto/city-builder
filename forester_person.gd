extends Node2D

var SPEED:= 200.0
var state: String = 'idle' :
	set = set_state

@export var target: Vector2
@export var work_place: Node2D
@export var area_radius := 200

@onready var action: Label = $Action
@onready var plant_timer: Timer = $PlantTimer

const TREE = preload("res://Resources/Tree/tree.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	lookForPlaceToPlant()
	pass # Replace with function body.

#func _input(event: InputEvent) -> void:
	#if event.is_action('tap'):
		#target = event.position
	#pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if state == 'going_to_place':
		walk_direction_target(delta)
	
	if state == 'back_to_work_place':
		walk_back_to_work_place(delta)

	pass

func set_state(new_state: String):
	state = new_state
	
	match new_state:
		'idle':
			action.text = "descansando"
			#lookForPlaceToPlant()
		'going_to_place':
			action.text = "indo ate la"
			#chop_timer.start()
		'back_to_work_place':
			#chop_timer.stop()
			action.text = "indo descnaca"
		'planting':
			action.text = "plantnad"
			plant()
	
	pass

func walk_direction_target(delta: float):
	if position.distance_to(target) > 10:
		global_position += position.direction_to(target) * SPEED * delta
	else:
		state = 'planting'
		
	pass

func walk_back_to_work_place(delta: float):
	if position.distance_to(work_place.global_position) > 10:
		global_position += position.direction_to(work_place.global_position) * SPEED * delta
	else:
		state = 'idle'
		

func plant() -> void:
	var newTree = TREE.instantiate()
	
	get_tree().root.add_child(newTree)
	newTree.global_position = target
	
	state = 'back_to_work_place'

	pass

func lookForPlaceToPlant() -> void:
	#var trees = get_tree().get_nodes_in_group('tree')
	#
	#if not trees.is_empty():
		#target = trees.get(0)
		#
		#state = 'get_resource'
	
	target = get_point_arount_work_place()
	
	print(target)
	
	state = 'going_to_place'
	
	pass

func get_point_arount_work_place() -> Vector2:
	var angle = randf() * TAU
	var r = sqrt(randf()) * area_radius
	return work_place.global_position + Vector2(cos(angle), sin(angle)) * r

func _on_plant_timer_timeout() -> void:
	lookForPlaceToPlant()
	pass # Replace with function body.
