extends Node2D
class_name Bullet

const SPEED = 500
var velocity
var direction:Vector2
var damage:int
# Called when the node enters the scene tree for the first time.

func init(damage:int, direction:Vector2):
	self.damage = damage
	self.direction = direction

func _ready():
#	direction = position.direction_to(get_global_mouse_position()).normalized()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	velocity = direction * SPEED * delta
	position += velocity
	pass




func _on_hitbox_body_entered(body):
	if body.has_node("HealthComponent"):
		body.get_node("HealthComponent").take_damage(damage)
	queue_free()
	pass # Replace with function body.
