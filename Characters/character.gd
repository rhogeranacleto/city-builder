extends Node2D
class_name Character

var SPEED:= 200.0

@export var workplace : Workplace :
	set(newWorkplace) :
		if workplace:
			workplace.unregister_worker(self)
		
		workplace = newWorkplace
		
		if state_machine:
			register_to_workplace()

@onready var state_machine: StateMachine = $StateMachine

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if workplace:
		register_to_workplace()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func register_to_workplace():
	if workplace.register_worker(self):
		state_machine.updateCollection(workplace.job_resource.states_scripts)
		state_machine.start(workplace.job_resource.initial)

func walk_to(target: Vector2, delta: float) -> float:
	global_position += position.direction_to(target) * SPEED * delta
	
	return position.distance_to(target)
