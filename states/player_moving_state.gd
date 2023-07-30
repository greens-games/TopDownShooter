extends State
class_name PlayerMovingState

var player:Player

func _ready():
	player = owner as Player
	pass

func update(delta):
	var h_direction = Input.get_axis("move_left", "move_right")
	var v_direction = Input.get_axis("move_up", "move_down")
	if h_direction or v_direction:
		player.velocity.x = h_direction * player.SPEED
		player.velocity.y = v_direction * player.SPEED
	else:
		player.velocity.x = move_toward(player.velocity.x, 0, player.SPEED)
		player.velocity.y = move_toward(player.velocity.y, 0, player.SPEED)
		state_machine.change_state("Idle")

	player.move_and_slide()


func exit():
	print("leaving moving")
