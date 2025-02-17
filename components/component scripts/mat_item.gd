class_name Mat_Item extends Component

@onready var itemBase := Item_Base.of(get_parent())

var matId : StringName = &""

@onready var mesh : MeshInstance3D = get_parent().get_node("MeshInstance3D")
var material : StandardMaterial3D

func updateTexture():
	material = mesh.get_surface_override_material(0).duplicate()
	material.set("albedo_texture", MatLoad.mat_find(matId).texture)
	mesh.set_surface_override_material(0, material)

static func of(p: Node) -> Mat_Item:
	return Component.internal_find_or_create(p, Mat_Item)

static func get_component_name() -> String:
	return &"MatItem"
