class_name Interactable extends Component

@export var interactionArea : Area3D

@export var reusable : bool
@export var reuseAmount : int #set to -1 for infinite uses
@export var reuseCooldown : float #set to 0 for no cooldown

static func of(p: Node) -> Interactable:
	return Component.internal_find_or_create(p, Interactable)

static func get_component_name() -> String:
	return &"Interactable"
