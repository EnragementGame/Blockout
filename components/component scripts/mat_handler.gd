class_name Mat_Handler extends Component

@export_category("Identification")
@export var slots : Dictionary[StringName, Mat_Stats]
@export var handlerName : StringName
@export_category("Texture Groups")
@export var regions : Model_Regions
var traits : Array[Trait]

static func of(p: Node) -> Mat_Handler:
	return Component.internal_find_or_create(p, Mat_Handler)

static func get_component_name() -> String:
	return &"MatHandler"

func _ready() -> void:
	for slot in slots:
		updateMat(slot, MatLoad.mat_find(&"null"))
		updateRegion(slot)

func updateMat(slot : StringName, mat : Mat_Stats):
	slots[slot] = mat

func updateRegion(region : StringName):
	for child in regions.regions[region].get_children():
		if child is Node3D:
			for mesh in child.get_children():
				if mesh is MeshInstance3D:
					mesh.mesh.surface_get_material(0).set("albedo_texture", slots[region].texture)
