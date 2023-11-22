extends Node2D

func _on_area_2d_body_entered(body):
	if body.has_method("modifyHealth"):
		body.modifyHealth(1)
		queue_free()
