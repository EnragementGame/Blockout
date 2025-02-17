#Code was made with help from https://github.com/CatCatDeluxe
#Thank you Syly!!!! :3

extends Node

var mats : Dictionary[StringName, Mat_Stats]

func _ready() -> void:
	reload_mats_list()
	print(mats.size())

func fix_filename(filename: String) -> String:
	return filename.replace(".remap", "").replace(".import", "")

func reload_mats_list() -> void:
	for raw_filename in DirAccess.get_files_at("res://resources/materials"):
		var filename := fix_filename(raw_filename)
		if not filename.ends_with(".tres"):
			push_warning("Stupid idiot! Non-Rescource file in materials directory.")
			continue
		var mat := load("res://resources/materials/" + filename) as Mat_Stats
		if not mat: continue # Could not load the resource or is wrong type
		mats[mat.id] = mat
		print(mats)

func mat_find(id: StringName) -> Mat_Stats:
	if id in mats:
		return mats[id]
	push_warning(id + " is not a valid ID, setting to null.")
	return mats["null"]
