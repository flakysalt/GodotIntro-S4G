extends StaticBody2D

@export var hitColor : Color
@export var baseColor : Color

signal special_pin_hit

func _ready():
	baseColor = modulate

func on_hit():
	special_pin_hit.emit()
	modulate = hitColor
	if($Timer.is_stopped()):
		$Timer.start()

func _on_timer_timeout():
		modulate = baseColor
