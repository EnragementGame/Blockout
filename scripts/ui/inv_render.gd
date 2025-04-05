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
		var keys : Array = inv.heldMats.keys() #Stores heldMats' keys for later
		var loopCount : int = 0
		for i in keys: #loops through all stored items in the keys array
			if invDisplay.get_child(loopCount) == null: #If the current child node we are trying to find does not exist,
				invDisplay.add_child(invDisplay.get_child(0).duplicate()) #copy the first node and add it to the parent
			var invButton : Inv_Button = invDisplay.get_child(loopCount)
			invButton.button_pressed = false
			invButton.storedId = MatLoad.mat_find(keys[loopCount]).id
			invButton.text = str(inv.heldMats[keys[loopCount]]) + "  " + MatLoad.mat_find(keys[loopCount]).displayName #Sets the display to show how many of a mat we have and the mats name
			loopCount += 1
