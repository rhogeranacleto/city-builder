extends Workplace
class_name MainStorage

var workplaces : Array[Workplace] = []

func add_workplace(workplace: Workplace):
	if workplace not in workplaces:
		workplaces.append(workplace)
	pass

func remove_workplace(workplace: Workplace):
	workplaces.erase(workplace)
	pass
