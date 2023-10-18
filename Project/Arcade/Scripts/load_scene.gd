extends BaseButton

@export var scene_path: String

func _ready():
	disabled = scene_path.is_empty()

func _on_pressed():
	get_tree().change_scene_to_file(scene_path)
	pass 
