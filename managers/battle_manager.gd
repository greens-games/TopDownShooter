extends Node
class_name BattleManager

var player:Player
var enemies:Array

func init(player: Player):
	self.player = player
	pass

# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
	
func add_enemy(enemy):
	enemy.award_exp.connect(player_killed_enemy)
	enemies.append(enemy)

func player_killed_enemy(exp_amount:int):
	player.gain_exp(exp_amount)
