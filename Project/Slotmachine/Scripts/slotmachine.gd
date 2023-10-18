extends Sprite2D

var attempts = 10

func _ready():
	randomize()
	$Label.text = str(attempts)

func _on_start_delay_timeout():
	$StopButton.disabled = false

func _on_stop_delay_timeout():
	$StartButton.disabled = false

func _on_stop_button_pressed():
	$WheelCollection.stop_spinning()
	$StopButton.disabled = true
	$StopDelay.start()

func _on_start_button_pressed():
	if attempts <= 0:
		return
	
	attempts-= 1
	$Label.text = str(attempts)
	$WheelCollection.spin()
	$StartButton.disabled = true
	$StartDelay.start()

func _on_wheel_collection_on_won():
	print ("i won")
