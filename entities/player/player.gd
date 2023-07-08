extends CharacterBody2D
class_name Player

const SPEED = 100.0
const JUMP_VELOCITY = -400.0
@onready var weapon = $Rifle
var curr_exp:int = 0

func _ready():
	pass

func _physics_process(delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var h_direction = Input.get_axis("move_left", "move_right")
	var v_direction = Input.get_axis("move_up", "move_down")
	look_at(get_global_mouse_position())
	if h_direction or v_direction:
		velocity.x = h_direction * SPEED
		velocity.y = v_direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)
	
	if Input.is_action_pressed("primary_fire"):
		weapon.action()
	
	move_and_slide()

func gain_exp(exp_gained:int):
	curr_exp += exp_gained
