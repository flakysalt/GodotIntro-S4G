extends Node2D

@export var enemies: Array[PackedScene] 
@export var spawnTimer : Vector2

@export var player : Node2D

func _ready():
	
	$Timer.wait_time = randf_range(spawnTimer.x,spawnTimer.y)
	$Timer.start()

func _on_timer_timeout():
	$Timer.wait_time = randf_range(spawnTimer.x,spawnTimer.y)
	var newEnemy = enemies.pick_random().instantiate()
	newEnemy.player = player
	add_child(newEnemy)
	$Timer.start()
