class_name Craft_UI extends Control

#Signals
signal crafting_mode_changed

#boolieans
var crafting : bool = false

#Other stuff
@onready var weaponInv : WeaponInv = %WeaponInv
##@onready var instantiatePos : Node3D = %InstantiatePos

#Crafting Variables
var selectedWeapon : StringName
var storedMatHand : Mat_Handler
var craftingMatHand : Mat_Handler
var selectedPart : StringName

func _ready():
	crafting_mode_changed.emit()

func _process(delta):
	pass

func weapon_update(id : StringName): #Loads the weapon and sets the craftingMatHand to whatever the ID is.
	if crafting:
		var newWeapon : Node3D
		newWeapon = WeaponLoad.weapons[id].weaponScene.instantiate()
		newWeapon.position = get_parent().position + (Vector3.FORWARD * 3)
		craftingMatHand = newWeapon.get_node("MatHandler")
	else:
		storedMatHand = weaponInv.weapons[id]
		storedMatHand.handlerName = storedMatHand.handlerName + " " + "stored" #MatHandler is stored in case player changes mind and doesn't modify their weapon.
		craftingMatHand = storedMatHand.duplicate()
		weaponInv.weapons[id] = craftingMatHand #Sets MatHandler of the weapon to the duplicated MatHandler
		print(storedMatHand.handlerName + " " + craftingMatHand.handlerName)

func material_update(id : StringName):
	if selectedPart == null || craftingMatHand == null:
		return
	craftingMatHand.slots[selectedPart] = MatLoad.mat_find(id) #Updates the slot with the same ID as the selectedPart to whatever material is selevted.
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
