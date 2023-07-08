extends Node2D
class_name Zombie

signal award_exp(exp_amount:int)

@export var exp_reward:int
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_health_component_on_death():
	emit_signal("award_exp", exp_reward)
	pass # Replace with function body.
