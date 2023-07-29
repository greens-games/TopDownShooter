extends Node2D
class_name  ShootingComponent

var bullet_scene = preload("res://entities/bullets/Bullet.tscn")


func shoot(muzzle_pos:Vector2, damage:int, direction:Vector2):	
	var bullet:Bullet = bullet_scene.instantiate()
	bullet.global_position = muzzle_pos
	bullet.rotation = (muzzle_pos - get_global_mouse_position()).angle() + deg_to_rad(90)
	bullet.init(damage, direction)
	get_node("/root").add_child(bullet)
