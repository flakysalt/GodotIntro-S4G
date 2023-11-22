extends CharacterBody2D

@export var speed = 300.0
@export var accel = 7
@onready var nav: NavigationAgent2D = $NavigationAgent2D

var player : Node2D

func _physics_process(delta):

	var direction = Vector3()
	nav.target_position = player.global_position
	direction = (nav.get_next_path_position() - global_position).normalized()
	velocity = velocity.lerp(direction * speed, accel * delta)
	
	move_and_slide()
	
func hit():
	queue_free()

func _on_area_2d_body_entered(body):
	if body.has_method("modifyHealth"):
		body.modifyHealth(-1)
