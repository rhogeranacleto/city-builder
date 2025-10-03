extends State
class_name Builder_gather_resource

var nearest_wareouse : Warehouse

func enter():
	var warehouses = get_tree().get_nodes_in_group('warehouse')
	nearest_wareouse = warehouses.reduce(find_nearest, warehouses.get(0))
	
	pass
	
func _process(delta: float) -> void:
	if character.walk_to(nearest_wareouse.global_position, delta) < 10:
		gather_resource()
	
func find_nearest (nearest: Warehouse, warehouse: Warehouse):
	var nearest_distance = nearest.global_position.distance_to(character.workplace.global_position)
	var current_distance = warehouse.global_position.distance_to(character.workplace.global_position)
	
	return nearest if nearest_distance < current_distance else warehouse

func gather_resource():
	var building = character.state_machine.context.get('building') as Building
	
	var first_item_list = building.needs.negative_items()
	
	nearest_wareouse.inventory.transfer_to(character.inventory, Inventory.INVENTORY_ITEM_TYPE[first_item_list], 1)
	
