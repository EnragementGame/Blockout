class_name Inv extends Node

var heldMats : Dictionary[StringName, int]
var heldRelics : Dictionary[StringName, int]
var heldConsume : Dictionary[StringName, int]

func addMat(item : Node3D, amount : int):
	var count : int = heldMats.get_or_add(item.get_node("MatItem").matId, 0)
	heldMats[item.get_node("MatItem").matId] = count + amount

func removeMat(item : Node3D, amount : int):
	var count : int = heldMats.get(item.get_node("MatItem").matId)
	if count - amount <= 0:
		heldMats.erase(item.get_node("MatItem").matId)
	else:
		heldMats[item.get_node("MatItem").matId] = count - amount
	
