extends Node2D

var SPEED:= 100.0
var state: String = 'idle'

@export var target: Node2D
@export var workPlace: Node2D

@onready var action: Label = $Action
@onready var chop_timer: Timer = $ChopTimer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	lookForTree()
	pass # Replace with function body.

#func _input(event: InputEvent) -> void:
	#if event.is_action('tap'):
		#target = event.position
	#pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if state == 'walking':
		if target:
			walk_direction_target(delta)
		else:
			walk_back_to_work_place(delta)

	pass

func walk_direction_target(delta: float):
	if position.distance_to(target.global_position) > 10:
		global_position += position.direction_to(target.global_position) * SPEED * delta
	else:
		state = 'chopping'
		chop_timer.start()
	pass

func walk_back_to_work_place(delta: float):
	if position.distance_to(workPlace.global_position) > 10:
		global_position += position.direction_to(workPlace.global_position) * SPEED * delta

func chop() -> void:
	action.text = "Cortando"
	
	var finished = target.chop()
	
	if finished:
		print('cabo')
		chop_timer.stop()
		action.text = "Levando madeirada"
		target = null
		state = 'walking'
	
	pass

func lookForTree() -> void:
	var firstTree = get_tree().get_nodes_in_group('tree').get(0)
	
	target = firstTree
	
	state = 'walking'
	pass


func _on_chop_timer_timeout() -> void:
	chop()
	pass # Replace with function body.
