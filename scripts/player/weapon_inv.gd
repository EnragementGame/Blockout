class_name WeaponInv extends Node

var weapons : Dictionary[StringName, Mat_Handler]
var equiptWeapon : Mat_Handler

func _ready():
	weapons.get_or_add(get_parent().get_node("MatHandler").handlerName, get_parent().get_node("MatHandler"))
	print(weapons)

func add_weapon(weapon : Mat_Handler):
	weapons.get_or_add(weapon.handlerName, weapon)
