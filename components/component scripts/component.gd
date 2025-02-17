##System taken with permission from my friend https://github.com/CatCatDeluxe
##With modifications by me (EnragementGame)
##Thank you Syly!!!! :3

class_name Component extends Node

var parent : Node
@export var identifier : String

static func internal_create(on: Node, script: Variant) -> Component:
	var child_node := Node.new()
	child_node.set_script(script)
	if child_node.allow_reuse():
		child_node.name = script.get_component_name()
	child_node.parent = on
	on.add_child(child_node)
	return child_node

static func internal_find_or_create(p: Node, script: Variant) -> Component:
	var child := p.get_node_or_null(script.get_component_name())
	if child:
		print("Component found:" + child.name)
		return child
	print("Component not found. Creating.")
	return Component.internal_create(p, script)

static func get_component_name() -> String:
	return &"Component"

func allow_reuse() -> bool:
	return true
