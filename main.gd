extends Node

@export var mob_scene: PackedScene = load("res://mob.tscn")
var score

# Called when the node enters the scene tree for the first time.
func _ready():
	new_game()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func game_over():
	$ScoreTimer.stop()
	$MobTimer.stop()
	$HUD.show_game_over()
	$Music.stop()
	$DeathSound.play()
	get_tree().change_scene_to_file("res://startMenu.tscn")
	
		
func new_game():
	get_tree().call_group("mobs","queue_free") # Clear any mobs from previous game
	score = 0
	$HUD.update_score(score)
	$Player.start($StartPosition.position)
	$Music.play()
	$HUD.show_message("Get Ready")
	$StartTimer.start()


func _on_mob_timer_timeout():
	# Create a new instance of the Mob scene
	var mob = mob_scene.instantiate()
	
	# Choose a random location on Path2D
	var mob_spawn_location = get_node("MobPath/MobSpawnLocation")
	mob_spawn_location.progress_ratio = randi()
	
	# Set the mob's direction perpendictular to the path direction
	var direction = mob_spawn_location.rotation + PI / 2
	
	# Set the mob's position to a random location
	mob.position = mob_spawn_location.position
	
	#direction += randf_range(-PI / 4,PI / 4)
	#mob.rotation = direction
	
	# Choose the velocity for the mob
	mob.linear_velocity = Vector2(randf_range(150.0,250.0),0.0).rotated(direction)
	
	# Spawn the mob y adding it to the main scene
	add_child(mob)

func _on_score_timer_timeout():
	score += 1
	$HUD.update_score(score)

func _on_start_timer_timeout():
	$HUD/Message.hide()
	$MobTimer.start()
	$ScoreTimer.start()
	
