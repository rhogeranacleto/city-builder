extends Building
class_name Workplace

@export var job_resource: Job
@export var inventory : Inventory
@export var amountIndicator : Label
@export var limit := 100 # move it to another place, the workspace doesnt need to know the limit of the inventary
@export var items : Array[String]

var workers: Array = []
var is_checked_to_a_inventory := false

func _ready() -> void:
	if not is_in_group('general_store') and inventory:
		inventory.changed.connect(inventory_changed)
	
	super._ready()
	pass

func register_worker(worker: Character) -> bool:
	if worker not in workers:
		workers.append(worker)
		return true
	return false

func unregister_worker(worker: Character):
	workers.erase(worker)
	worker.job = null

func updateAmountIndicator():
	amountIndicator.text = ', '.join(items.map(func(itemName): return str(itemName) + ': ' + str(inventory[itemName])))
	
	pass

func inventory_changed():
	if amountIndicator:
		updateAmountIndicator()
	
	var amount = items.map(func(itemName): return inventory[itemName]).max()
	
	if is_checked_to_a_inventory and amount == 0:
		is_checked_to_a_inventory = false
		
		get_tree().call_group('general_store', 'remove_workplace', self)
	elif not is_checked_to_a_inventory and amount > 0:
		is_checked_to_a_inventory = true
		var general_stores = get_tree().get_nodes_in_group('general_store')
		
		var nearest_store: Workplace = general_stores.get(0)
		
		for general_store in general_stores:
			var nearest_distance = nearest_store.global_position.distance_to(global_position)
			var distance = general_store.global_position.distance_to(global_position)
			if distance < nearest_distance:
				nearest_store = general_store
				nearest_distance = distance
		
		nearest_store.call('add_workplace', self)
	pass
