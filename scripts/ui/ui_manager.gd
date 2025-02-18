extends Node

#UI Elements
@onready var hud : Control = %HUD
@onready var crafting : Control = %CraftUI
var containerOpen : Control ##Gonna be implimented later maybe
#Toggle Elements
@onready var player : Player = get_parent()
@onready var craftingCam : Camera3D = %CraftViewCam
@onready var playerCam : Camera3D = %Cam
#Booleans
var isCrafting : bool

func _process(delta):
	if Input.is_action_just_pressed("Close_UI"):
		if isCrafting:
			closeCrafting()
	
	if Input.is_action_just_pressed("Open_Mod_UI"):
		if isCrafting:
			closeCrafting()
		else:
			openCrafting()

func openCrafting():
	isCrafting = true
	playerCam.current = false
	craftingCam.current = true
	crafting.visible = true
	hud.visible = false
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	player.canMove = false

func closeCrafting():
	isCrafting = false
	playerCam.current = true
	craftingCam.current = false
	crafting.visible = false
	hud.visible = true
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	player.canMove = true
