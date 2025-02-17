#Code was made with help from https://github.com/CatCatDeluxe
#Thank you Syly!!!! :3

extends Node

var weapons : Dictionary[StringName, Weapon_Identifier]

func _ready() -> void:
	reload_weapons_list()
	print(weapons.size())

func fix_filename(filename: String) -> String:
	return filename.replace(".remap", "").replace(".import", "")

func reload_weapons_list() -> void:
	for raw_filename in DirAccess.get_files_at("res://resources/weapons/"):
		var filename := fix_filename(raw_filename)
		if not filename.ends_with(".tres"):
			push_warning("Stupid idiot! Non-Resource file in weapons directory.")
			continue
		var weapon := load("res://resources/weapons/" + filename) as Weapon_Identifier
		if not weapon: continue # Could not load the resource or is wrong type
		weapons[weapon.id] = weapon
		print(weapons)

func mat_find(id: StringName) -> Weapon_Identifier:
	if id in weapons:
		return weapons[id]
	push_warning(id + " is not a valid ID, returning Pistol.")
	return weapons["pistol"]
