class_name Player extends CharacterBody3D

@onready var stats := Player_Stat_Handler.of(self)
@export_category("Camera")
@export var sensitivity : float
@onready var head : Node3D = %Head
var camLimit : float = 89
@export var canMove : bool = true

var gravity: float = 5


func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion && canMove:
		rotate_y(-deg_to_rad(event.relative.x * sensitivity))
		head.rotate_x(-deg_to_rad(event.relative.y * sensitivity))
		head.rotation.x = clamp(head.rotation.x, deg_to_rad(-camLimit), deg_to_rad(camLimit))

func _physics_process(delta: float) -> void:
	move(delta)

func move(delta):
	
	if not is_on_floor():
		velocity.y -= gravity * delta

	if !canMove:
		return

	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = stats.jumpHeight

	var input_dir := Input.get_vector("Left", "Right", "Forward", "Backward")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * stats.speed
		velocity.z = direction.z * stats.speed
	else:
		velocity.x = move_toward(velocity.x, 0, stats.speed)
		velocity.z = move_toward(velocity.z, 0, stats.speed)

	move_and_slide()
