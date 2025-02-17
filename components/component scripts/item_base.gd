class_name Item_Base extends Component

@onready var interactable := Interactable.of(get_parent())

@export var itemCount : int

static func of(p: Node) -> Item_Base:
	return Component.internal_find_or_create(p, Item_Base)

static func get_component_name() -> String:
	return &"ItemBase"