extends RayCast3D

@onready var inv : Node= %Inv

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	if is_colliding():
		if Input.is_action_just_pressed("Interact") && get_collider().get_parent().has_node("Interactable"):
			var interacted : Node3D = get_collider().get_parent()
			if interacted.has_node("MatItem"):
				inv.addMat(interacted, interacted.get_node("ItemBase").itemCount)
				interacted.visible = false
				print(inv.heldMats)
				interacted.queue_free()
				return
			
