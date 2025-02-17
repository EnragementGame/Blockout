class_name Craft_Select extends Node3D

var selectedPart : Node3D
var hoveredPart : Node3D
@onready var craftUi : Craft_UI = %CraftUI

func _process(_delta):
	if craftUi.visible:
		selectionRay()

func selectionRay():
	var spaceState = get_world_3d().direct_space_state
	var mousePos : Vector2 = get_viewport().get_mouse_position()
	var camera : Camera3D = get_parent()

	var start : Vector3 = camera.project_ray_origin(mousePos)
	var end : Vector3 = start + camera.project_ray_normal(mousePos) * 5
	var params = PhysicsRayQueryParameters3D.create(start, end, 16)
	params.collide_with_areas = true

	var hit = spaceState.intersect_ray(params)

	if !hit:
		hoveredPart = null
		return

	hoveredPart = hit.collider.get_parent()

	if Input.is_action_just_pressed("Menu_Select") && hoveredPart:
		selectedPart = hoveredPart
		craftUi.selectedPart = selectedPart.get_parent().regions.find_key(selectedPart)
		print(craftUi.selectedPart)
