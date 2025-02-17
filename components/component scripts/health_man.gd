class_name Health_Man extends Component

@export var maxHp : int
var hp : int
var regen : int
var regenTimer : float
var regenTimerMax : float
var canRegen : bool
@export var oneShotProtection : bool
var osp : bool
var ospGracePeriod : float

static func of(p: Node) -> Health_Man:
	return Component.internal_find_or_create(p, Health_Man)

static func get_component_name() -> String:
	return &"HealthMan"

func _process(delta):
	if ospGracePeriod > 0:
		ospGracePeriod -= (1 * delta)
	osp_toggler()

func take_damage(damage : int) -> void:
	if ospGracePeriod > 0:
		return
	
	if osp && (hp - damage) > int(hp * 0.80):
		hp = int(hp * 0.80)
		ospGracePeriod = 0.5
		return
	
	hp -= damage

func osp_toggler():
	if oneShotProtection:
		if hp >= int(maxHp * 0.85):
			osp = true
