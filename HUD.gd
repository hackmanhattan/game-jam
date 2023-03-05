extends CanvasLayer

signal start_game

func show_message(text):
	$Message.text = text
	$Message.show()
	$MessageTimer.start()

func show_game_over():
	show_message("Game Over")
	# Wait until the MessageTImer had counted down.
	await $MessageTimer.timeout
	get_tree().change_scene_to_file("res://startMnu.tscn")
	

func update_score(score):
	$ScoreLabel.text = str(score)
	
func _on_MessageTimer_timeout():
	$Message.hide()
	
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass



