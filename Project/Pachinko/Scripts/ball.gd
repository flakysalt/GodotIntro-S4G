extends RigidBody2D

func _on_body_entered(body):
	if body.has_method("on_hit"):
		body.on_hit()
