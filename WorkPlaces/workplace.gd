extends Node2D
class_name Workplace

@export var job_resource: Job
@export var inventory : Inventory
@export var amountIndicator : Label
@export var limit := 100 # move it to another place, the workspace doesnt need to know the limit of the inventary

var workers: Array = []


func register_worker(worker: Character) -> bool:
	if worker not in workers:
		workers.append(worker)
		return true
	return false

func unregister_worker(worker: Character):
	workers.erase(worker)
	worker.job = null

func updateAmountIndicator(amount: int):
	amountIndicator.text = str(amount) + ' / ' + str(limit)
	pass
