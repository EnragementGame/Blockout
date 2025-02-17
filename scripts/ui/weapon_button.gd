class_name Weapon_Button extends Button

var storedId : StringName
@onready var craftUi : Craft_UI = %CraftUI

func _ready():
	print(name + ": " + storedId)

func _pressed() -> void:
	craftUi.weapon_update(storedId)
