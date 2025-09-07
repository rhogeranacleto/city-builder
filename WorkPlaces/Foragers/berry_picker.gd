extends Workplace
class_name BerryPicker

var berry_bushes : Array[Node2D] = []


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area not in berry_bushes:
		berry_bushes.append(area)
