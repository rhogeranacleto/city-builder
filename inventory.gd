extends Resource
class_name Inventory

enum INVENTORY_ITEM_TYPE {
	wood,
	rock,
	berry
}

@export var items : Dictionary[INVENTORY_ITEM_TYPE, InventoryItem] = {}:
	set(value):
		items = value
		for inventory_item in value.values():
			inventory_item.value_changed.connect(emit_changed_any)

@export var wood := 0
@export var rock := 0
@export var berry := 0
@export var total : int :
	get():
		return items.values().reduce(func (acc, inventoryItem: InventoryItem): return inventoryItem.value + acc, 0) 

signal changed_any
signal wood_changed(int)
signal rock_changed(int)
signal berry_changed(int)

#func _init() -> void:
	#for inventory_item in items.values():
		#inventory_item.connect('value_changed', emit_changed_any)

func addItem(item: String, amount: int) -> void:
	self[item] = self[item] + amount
	
	emit_signal(item + "_changed", self[item])
	changed_any.emit()
	pass

func emit_changed_any():
	changed_any.emit()

func _set(property: StringName, value: Variant) -> bool:
	if INVENTORY_ITEM_TYPE.has(int(property)):
		if items.has(property):
			items.get(property).value = value
		else:
			var inventory_item = InventoryItem.new() 
			items.set(property, inventory_item)
			inventory_item.value = value
			inventory_item.value_changed.connect(emit_changed_any)
		return false
	return true

func transfer_to(inventory: Inventory, item: INVENTORY_ITEM_TYPE,amount: int):
	items[item].value -= amount
	inventory.set(str(item), inventory.items[item].value + amount)
