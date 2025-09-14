@tool
extends PanelContainer

@export var building_data : BuildingData

@onready var texture_rect: TextureRect = $Rows/TextureRect
@onready var label: Label = $Rows/Label

func _ready() -> void:
	texture_rect.texture = building_data.texture
	label.text = building_data.building_name
