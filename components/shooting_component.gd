extends Node2D
class_name  ShootingComponent

var bullet_scene = preload("res://entities/bullets/Bullet.tscn")
@onready var muzzle = $Muzzle

func shoot(muzzle_pos:Vector2, damage:int):	
	var bullet:Bullet = bullet_scene.instantiate()
	bullet.init(damage)
	bullet.global_position = muzzle_pos
	bullet.rotation = (get_global_mouse_position() - bullet.global_position).angle() + deg_to_rad(90)
	get_node("/root").add_child(bullet)
