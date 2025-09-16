extends Workplace
class_name Constructor

var building_pool : Array[Building] = []

signal new_construction

func register_building(building: Building):
	if building not in building_pool:
		building_pool.append(building)
		new_construction.emit()

func unregister_building(building: Building):
	building_pool.erase(building)
