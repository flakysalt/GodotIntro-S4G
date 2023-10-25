extends StaticBody2D

@export var hitColor : Color

func on_hit():
	modulate = hitColor
	if($Timer.is_stopped()):
		$Timer.start()

func _on_timer_timeout():
	queue_free()
