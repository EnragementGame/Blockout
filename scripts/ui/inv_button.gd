class_name Inv_Button extends Button

var storedId : StringName
@onready var craftUi : Craft_UI = %CraftUI

func _pressed() -> void:
	craftUi.material_update(storedId)