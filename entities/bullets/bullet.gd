extends Area2D
class_name Bullet

const SPEED = 300
var distance:float = 0
var max_distance:float = 250 
var curr_dist:float
var velocity:Vector2
var direction:Vector2
var damage:int
# Called when the node enters the scene tree for the first time.

func init(damage:int, direction:Vector2):
	self.damage = damage
	self.direction = direction	

func _ready():	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta:float):
	curr_dist = SPEED * delta
	distance += curr_dist
	velocity = direction * curr_dist
	global_position += velocity
	if distance >= max_distance:
		queue_free()
	pass

func _on_body_entered(body) -> void:
	if body.has_node("HealthComponent"):
		body.get_node("HealthComponent").take_damage(damage)
	queue_free()
	pass # Replace with function body.
