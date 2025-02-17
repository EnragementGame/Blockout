extends Panel

@onready var invDisplay : VBoxContainer = %Inventory
@onready var inv : Inv = %Inv

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	updateInv()
	
func updateInv():
	if inv.heldMats.is_empty():
		invDisplay.get_child(0).visible = false
	else:
		invDisplay.get_child(0).visible = true
		var keys : Array = inv.heldMats.keys()
		var loopCount : int = 0
		for i in keys:
			if invDisplay.get_child(loopCount) == null:
				invDisplay.add_child(invDisplay.get_child(0).duplicate())
			var invButton : Inv_Button = invDisplay.get_child(loopCount)
			invButton.button_pressed = false
			invButton.storedId = MatLoad.mat_find(keys[loopCount]).id
			invButton.text = str(inv.heldMats[keys[loopCount]]) + "  " + MatLoad.mat_find(keys[loopCount]).displayName
			loopCount += 1
