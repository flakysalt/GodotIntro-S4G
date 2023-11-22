extends CharacterBody2D

@export var speed : float

var trailLengh = 10

@export var playerHealth = 3
@export var maxPlayerHealth = 3

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	velocity = Vector2(Input.get_axis("ui_left","ui_right"),Input.get_axis("ui_up","ui_down")) * speed
	
	$Sword.look_at(get_global_mouse_position())
	
	make_trail()
	move_and_slide()
	pass

func make_trail():
	var line = $Line2D
	var newPoint = $Sword/SwordArea/SwordSprite.global_position - $Line2D.global_position
	line.add_point(newPoint)
	if (line.get_point_count() > trailLengh):
		line.remove_point(0)

func _on_sword_area_body_entered(body):
	if body.has_method("hit"):
		body.hit()

func modifyHealth(mod):
	playerHealth += mod
	if(playerHealth == 0):
		print("Player Dead")

func _on_sword_area_area_entered(area):
	if area.has_method("hit"):
		area.hit()
