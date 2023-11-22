extends Node2D

@export var speed = 200

func _on_timer_timeout():
	queue_free()

func _process(delta):
	translate(transform.x * delta * speed)

func _on_area_2d_body_entered(body):
	if body.has_method("modifyHealth"):
		body.modifyHealth(-1)
		queue_free()
