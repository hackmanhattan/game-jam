extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var anim = "empty"
	if roundi(rad_to_deg(linear_velocity.angle())) in range(-45,45): anim = "walk_right"
	if roundi(rad_to_deg(linear_velocity.angle())) in range(45,135): anim = "walk_down"
	if roundi(rad_to_deg(linear_velocity.angle())) in range(135,180): anim = "walk_left"
	if roundi(rad_to_deg(linear_velocity.angle())) in range(-180,-135): anim = "walk_left"
	if roundi(rad_to_deg(linear_velocity.angle())) in range(-135,-45): anim =  "walk_up"
	$AnimatedSprite2D.animation = anim
	$AnimatedSprite2D.play()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
