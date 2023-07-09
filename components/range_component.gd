extends Node


@onready var range_indicator = $CollisionShape2D
# Called when the node enters the scene tree for the first time.
func _ready():
	print(range_indicator.get_shape().get_radius())
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
