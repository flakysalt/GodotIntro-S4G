extends Node2D

var score = 0
var neededPoints = 0

@export var max_attempts = 0
var attempts_left = 0

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	attempts_left = max_attempts
	neededPoints = $Pins/PointPins.get_child_count()
	$UICanvas/UI.set_attempts(attempts_left)

func _process(delta):
	if(Input.is_key_pressed(KEY_CTRL)):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	else :
		Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

func _on_point_pin_hit():
	score += 1
	$UICanvas/UI.set_score(score)
	if score >= neededPoints:
		print("Game Won")

func _on_pointer_shot():
	attempts_left -= 1
	$UICanvas/UI.set_attempts(attempts_left)
	$Pointer.allowShoot = false

func _on_special_action_pin_hit():
	$Background/CanvasModulate.visible = !$Background/CanvasModulate.visible
	$CanvasModulate.visible = !$CanvasModulate.visible

func _on_bottom_area_body_entered(body):
	if(attempts_left > 0):
		$Pointer.allowShoot = true
	body.queue_free()
	
func _exit_tree():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
