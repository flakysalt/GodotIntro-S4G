extends Node2D

@export var ballTemplate : PackedScene
@export var initialVelocity: float

var allowShoot = true

var trajectory_points = 20

signal on_shot

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if((global_position - get_global_mouse_position()).normalized().y < 0 ):
		$Sprite2D.look_at(get_global_mouse_position())
		
	#advanced trajectory display
	update_trajectory(delta)
	
	if(Input.is_action_just_pressed("ui_accept") && allowShoot):
		on_shot.emit()
		var newBall = ballTemplate.instantiate()
		newBall.linear_velocity = Vector2(initialVelocity, 0).rotated($Sprite2D.rotation)
		add_child(newBall)
		return
	pass

func update_trajectory(delta):
	$Line2D.clear_points()
	var pos = Vector2.ZERO
	var velocity = Vector2(initialVelocity, 0).rotated($Sprite2D.rotation);
	var gravity_magnitude : int = ProjectSettings.get_setting("physics/2d/default_gravity")
	for i in trajectory_points:
		$Line2D.add_point(pos)
		velocity.y += gravity_magnitude * delta
		pos += velocity * delta
