extends CharacterBody2D
class_name Player

const SPEED = 100.0
const JUMP_VELOCITY = -400.0
@onready var weapon = $Rifle
@onready var init_state = $StateMachine/Idle
@onready var state_machine:StateMachine = $StateMachine
var curr_exp:int = 0

func _ready():
	state_machine.init(init_state)
	pass

func _physics_process(delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	look_at(get_global_mouse_position())
	pass
	
func gain_exp(exp_gained:int):
	curr_exp += exp_gained
