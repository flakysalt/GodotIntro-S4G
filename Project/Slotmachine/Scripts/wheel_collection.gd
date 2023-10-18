extends Node2D

signal on_won()

func spin():
	$AnimationPlayer.play("spin_loop")

func stop_spinning():
	$AnimationPlayer.play("stop_spin")

func check_for_win():
	if ($Wheel.frame == $Wheel2.frame && $Wheel2.frame == $Wheel3.frame):
		emit_signal("on_won")

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "stop_spin":
		check_for_win()
