extends State
class_name Forester_go_to_position

var area_radius := 500
var position : Vector2

func enter():
	get_point_arount_work_place()
	
	pass

func get_point_arount_work_place():
	var angle = randf() * TAU
	var r = sqrt(randf()) * area_radius
	
	position =  character.workplace.global_position + Vector2(cos(angle), sin(angle)) * r
	
func update(delta: float):
	if character.walk_to(position, delta) < 5:
		state_machine.change_state('Forester_plant')
		
