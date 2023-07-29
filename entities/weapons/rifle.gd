extends Node2D

var radius = 100.0

@onready var shooting_component:ShootingComponent = $ShootingComponent
@onready var muzzle:Marker2D = $Muzzle
@onready var attack_timer = $Timer
@onready var weapon_stats:WeaponStats = $WeaponStats

var can_shoot = true

# Called when the node enters the scene tree for the first time.
func _ready():
	attack_timer.timeout.connect(on_timer_timeout)
	attack_timer.wait_time = weapon_stats.cooldown
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func action():
	if can_shoot:
		can_shoot = false
		shooting_component.shoot(
			muzzle.global_position, 
			weapon_stats.damage, 
			global_position.direction_to(muzzle.global_position).normalized()
		)
		attack_timer.start()

func on_timer_timeout():
	can_shoot = true
