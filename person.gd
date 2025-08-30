extends Node2D

var SPEED:= 200.0
var state: String = 'idle' :
	set = set_state

@export var target: Node2D
@export var work_place: Node2D

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
	if state == 'get_resource':
		walk_direction_target(delta)
	
	if state == 'drop_resource':
		walk_back_to_work_place(delta)

	pass

func set_state(new_state: String):
	state = new_state
	
	match new_state:
		'idle':
			action.text = "procurando madeira"
			lookForTree()
		'chopping':
			action.text = "Cortando"
			chop_timer.start()
		'drop_resource':
			chop_timer.stop()
			action.text = "Levando madeirada"
			target = null
	
	pass

func walk_direction_target(delta: float):
	if position.distance_to(target.global_position) > 10:
		global_position += position.direction_to(target.global_position) * SPEED * delta
	else:
		state = 'chopping'
		
	pass

func walk_back_to_work_place(delta: float):
	if position.distance_to(work_place.global_position) > 10:
		global_position += position.direction_to(work_place.global_position) * SPEED * delta
	else:
		state = 'idle'
		work_place.addResource(3)

func chop() -> void:
	var treeIsDown = target.chop()
	
	if treeIsDown:
		state = 'drop_resource'

	pass

func lookForTree() -> void:
	var trees = get_tree().get_nodes_in_group('tree')
	
	if not trees.is_empty():
		target = trees.get(0)
		
		state = 'get_resource'
	pass


func _on_chop_timer_timeout() -> void:
	chop()
	pass # Replace with function body.
