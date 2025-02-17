
extends Node3D

@onready var matItem : Mat_Item = get_node("MatItem")
@onready var itemBase : Item_Base = get_node("ItemBase")

@export var count: int = 1
@export var matId : StringName

func _ready():
	matItem.matId = matId
	itemBase.itemCount = count
	scale = scale + (Vector3(1,1,1) * ((count - 1) * 0.025))
	matItem.updateTexture()
