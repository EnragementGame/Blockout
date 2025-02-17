extends Panel

@onready var craftUi : Craft_UI = %CraftUI
@onready var weaponInv : WeaponInv = %WeaponInv
@onready var craftList : VBoxContainer = %CraftList
@onready var modList : VBoxContainer = %ModList

func _ready() -> void:
	craftList.visible = false
	modList.visible = true
	updateModList()

func updateCraftList():
		var loopCount : int = 0
		var keys : Array[StringName] = WeaponLoad.weapons.keys()
		print(keys)
		for weapon in WeaponLoad.weapons:
			if craftList.get_child(loopCount) == null:
				craftList.add_child(craftList.get_child(0).duplicate())
			var craftButton : Weapon_Button = craftList.get_child(loopCount)
			craftButton.storedId = WeaponLoad.weapons[keys[loopCount]].id
			craftButton.text = WeaponLoad.weapons[keys[loopCount]].defaultName
			print("Craft list " + craftButton.name + ": " + craftButton.storedId)
			loopCount += 1
		print(craftList.get_children())

func updateModList():
	var loopCount : int = 0
	var keys : Array[StringName] = weaponInv.weapons.keys()
	print(keys)
	for weapon in weaponInv.weapons:
		if modList.get_child(loopCount) == null:
			modList.add_child(craftList.get_child(0).duplicate())
		var craftButton : Weapon_Button = craftList.get_child(loopCount)
		craftButton.storedId = weaponInv.weapons[keys[loopCount]].handlerName
		craftButton.text = weaponInv.weapons[keys[loopCount]].handlerName
		print("Mod list " + craftButton.name + ": " + craftButton.storedId)
		loopCount += 1
	print(modList.get_children())

func _on_craft_ui_crafting_mode_changed() -> void:
	print(craftUi.crafting)
	if craftUi.crafting:
		craftList.get_parent().visible = true
		modList.get_parent().visible = false
		updateCraftList()
	else:
		craftList.get_parent().visible = false
		modList.get_parent().visible = true
		updateModList()
	print(craftList.get_parent().visible)
