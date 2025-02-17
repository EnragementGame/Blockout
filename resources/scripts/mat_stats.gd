class_name Mat_Stats extends Resource

@export_category("Identification")
@export var displayName : String
@export var id : StringName
@export_category("Visuals")
@export var texture : Texture
@export_category("Combat")
@export var damageOne : int
@export var damageTwo : int
@export var damageBonus : int
@export var damageMulti : float
@export var attackSpeed : float
@export var reloadSpeed : float
@export var critChance : float
@export var critMulti : float
@export var critBonus : int
@export_category("Health")
@export var healthOne : int
@export var healthTwo : int
@export var hpRegen : float	
@export_category("Movement")
@export var speed : float
@export var staminaOne : int
@export var staminaTwo : int
@export var spRegen : float
@export_category("Traits")
@export var traits : Array[Trait_Identifier]
