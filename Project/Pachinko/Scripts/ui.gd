extends Control


func set_score(score):
	$VBoxContainer/Score.text = "Score: %s" % score
	
func set_attempts(attempts):
	$VBoxContainer/HBoxContainer/Label.text = str(attempts)

