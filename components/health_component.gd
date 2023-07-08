extends Node

signal on_death

@export var max_health:int
var current_health:int

# Called when the node enters the scene tree for the first time.
func _ready():
	current_health = max_health
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if current_health <= 0:
		emit_signal("on_death")
		get_parent().queue_free()
	pass

func take_damage(damage_taken:int):
	current_health -= damage_taken
