extends Node
class_name Workplace

@export var job_resource: Job
@export var inventory : Inventory
@export var amountIndicator : Label


var workers: Array = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if amountIndicator:
		inventory.wood_changed.connect(updateAmountIndicator)
	
	pass # Replace with function body.

#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass

func register_worker(worker: Character) -> bool:
	if worker not in workers:
		workers.append(worker)
		return true
	return false

func unregister_worker(worker: Character):
	workers.erase(worker)
	worker.job = null

func updateAmountIndicator(amount: int):
	amountIndicator.text = str(amount)
	pass
