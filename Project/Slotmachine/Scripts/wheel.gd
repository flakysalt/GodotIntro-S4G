extends Sprite2D

func spin():
	$AnimationPlayer.play("start_spin")

func stop_spinning():
	$AnimationPlayer.play("spin_stop")
	frame = randi_range(0,vframes-1)
