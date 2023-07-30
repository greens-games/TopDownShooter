extends State
class_name PlayerIdleState

func update(delta):
	#Check for any movement input
	#If moving change to movement
	var inputs:Array = ["move_up", "move_down", "move_right", "move_left"]
	if inputs.any(check_inputs):
		state_machine.change_state("Moving")

func check_inputs(input:String):
	return Input.is_action_pressed(input)

func enter():
	print("entering idle")