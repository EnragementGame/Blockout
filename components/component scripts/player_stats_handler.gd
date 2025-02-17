class_name Player_Stat_Handler extends Component

@onready var hpMan := Health_Man.of(get_parent())
@onready var matHand := Mat_Handler.of(get_parent())

@export_category("Health")
var baseHp : int = 10
@export var maxHp : int
@export var hpRegen : int
@export_category("Stamina")
var baseSp : int = 10
@export var maxSp : int
@export var spRegen : int
@export_category("Movement")
@export var speed : float
@export var jumpHeight : float
@export_category("Unarmed Combat")
@export var attackSpeed : float
@export var fistDamage : int
@export var stompDamage : int

static func of(p: Node) -> Player_Stat_Handler:
	return Component.internal_find_or_create(p, Player_Stat_Handler)

static func get_component_name() -> String:
	return &"PlayerStatsHandler"

func stats_recalculate() -> void:
	var realCount : int

	maxHp = baseHp 
	for i in matHand.mats.size():
		realCount = i-1
		if realCount < 3:
			maxHp += matHand.mats[realCount].healthOne
		else:
			maxHp += matHand.mats[realCount].healthTwo

func set_health() -> void:
	if maxHp != hpMan.maxHp:
		hpMan.maxHp = maxHp
	if hpRegen != hpMan.regen:
		hpMan.regen = hpRegen
