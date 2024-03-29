extends Node2D


@onready var player:Player = $Player
@onready var enemy = $zombie
@onready var battle_manager:BattleManager = $BattleManager
@onready var enemy_manager:EnemyManager = $EnemyManager
@onready var enemy_spawner:Timer = $EnemySpawner
@onready var enemies:Array
# Called when the node enters the scene tree for the first time.
func _ready():
	enemy_spawner.timeout.connect(spawn_new_enemy)
	enemy_spawner.start()
	enemies.append(enemy)
	battle_manager.init(player)
	battle_manager.add_enemy(enemy)
	enemy.set_target(player)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func spawn_new_enemy():
	pass
