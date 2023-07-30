extends Node
class_name StateMachine


var states:Array
@export var init_state:State
var curr_state:State
var source:Node

func _ready():
	for child in get_children():
		child.state_machine = self
	curr_state = init_state
	pass

func _process(delta):
	curr_state.update(delta)

func init(first_state:State):
	curr_state = first_state
	curr_state.enter()

func change_state(new_state:String):
	curr_state.exit()
	var next_state:State = get_node(new_state)
	next_state.enter()
	curr_state = next_state
	pass

