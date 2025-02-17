class_name Craft_UI extends Control

signal crafting_mode_changed

var crafting : bool = false

@onready var weaponInv : WeaponInv = %WeaponInv
##@onready var instantiatePos : Node3D = %InstantiatePos

var selectedWeapon : StringName
var storedMatHand : Mat_Handler
var craftingMatHand : Mat_Handler
var selectedPart : StringName

func _ready():
	crafting_mode_changed.emit()

func _process(delta):
	pass

func weapon_update(id : StringName):
	if crafting:
		var newWeapon : Node3D
		newWeapon = WeaponLoad.weapons[id].weaponScene.instantiate()
		newWeapon.position = get_parent().position + (Vector3.FORWARD * 3)
		craftingMatHand = newWeapon.get_node("MatHandler")
	else:
		storedMatHand = weaponInv.weapons[id]
		storedMatHand.handlerName = storedMatHand.handlerName + " " + "stored"
		craftingMatHand = storedMatHand.duplicate()
		weaponInv.weapons[id] = craftingMatHand
		print(storedMatHand.handlerName + " " + craftingMatHand.handlerName)

func material_update(id : StringName):
	if selectedPart == null || craftingMatHand == null:
		return
	craftingMatHand.slots[selectedPart] = MatLoad.mat_find(id)
	craftingMatHand.updateRegion(selectedPart)

func _on_craft_toggled(toggled_on:bool) -> void:
	if(toggled_on):
		crafting = true
		crafting_mode_changed.emit()

func _on_modify_toggled(toggled_on:bool) -> void:
	if(toggled_on):
		crafting = false
		crafting_mode_changed.emit()

func _on_confirm_pressed() -> void:
	if crafting:
		pass
	pass
