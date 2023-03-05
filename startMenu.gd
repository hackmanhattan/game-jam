extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	$Music.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_start_button_pressed():
	var tween = get_tree().create_tween()
	tween.tween_property($Music,"volume_db",-80,4)
	await tween.finished
	get_tree().change_scene_to_file("res://main.tscn")

