extends Area2D

@export var speed = 300.0
var player : Node2D
@export var projectile : PackedScene

var minDistance = 50

func _process(delta):
	var distance = player.global_position - global_position
	if(distance.length() > minDistance):
		translate(distance.normalized() * delta * speed)

func _on_timer_timeout():
	var newProjectile = projectile.instantiate()
	newProjectile.global_position = global_position
	newProjectile.look_at(player.global_position)
	get_tree().get_root().add_child(newProjectile)
	
func hit():
	queue_free()
