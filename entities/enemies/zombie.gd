extends Node2D
class_name Zombie

signal award_exp(exp_amount:int)

@export var exp_reward:int
@onready var nav:NavigationAgent2D = $NavigationAgent2D
var next_position:Vector2
var target:Node2D
const SPEED = 75
var player_in_range = false

#change to be statemachine?

# Called when the node enters the scene tree for the first time.
func _ready():
	next_position = nav.get_next_path_position()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if nav.is_target_reachable() and not player_in_range:
		next_position = nav.get_next_path_position()
		var direction = global_position.direction_to(next_position)
		global_position += direction * delta * SPEED
	nav.target_position = target.global_position
	pass

func _on_health_component_on_death():
	emit_signal("award_exp", exp_reward)
	pass # Replace with function body.

func set_target(new_target:Node2D):
	self.target = new_target
	nav.target_position = target.global_position


func _on_area_2d_body_entered(body):
	player_in_range = true
	pass # Replace with function body.


func _on_area_2d_body_exited(body):
	player_in_range = false
	pass # Replace with function body.
