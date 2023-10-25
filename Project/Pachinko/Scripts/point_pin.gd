extends "res://Pachinko/Scripts/base_pin.gd"

signal point_pin_hit

func on_hit():
	super .on_hit()
	emit_signal("point_pin_hit")
