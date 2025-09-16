extends Node2D
class_name Building

enum ConstructionState {
	up_to_build,
	built
}

@export var needs : Inventory
@export var construction_state : ConstructionState :
	set(value):
		construction_state = value
		
		if value == ConstructionState.up_to_build:
			modulate.a = 0.3
		else :
			modulate.a = 1.0
@export var nearest_constructor : Constructor

func _ready() -> void:
	if not is_in_group('constructor'):
		set_nearest_constructor()
	
	if not needs.negative.is_empty():
		construction_state = ConstructionState.up_to_build
	
	needs.changed.connect(_on_needs_changes)
	
	pass

func _on_needs_changes():
	if needs.negative :
		nearest_constructor.register_building(self)
	
	pass

func set_nearest_constructor():
	var constructor_nodes = get_tree().get_nodes_in_group('constructor')
	
	nearest_constructor = constructor_nodes.reduce(func (nearest, current): 
		return nearest if \
			global_position.distance_to(nearest.global_position) < global_position.distance_to(current.global_position) \
			else current
	)
	
	
