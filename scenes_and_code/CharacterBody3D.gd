extends CharacterBody3D

var speed = 250

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if Input.is_action_pressed("ui_left"):
		velocity.x = -speed * delta
	elif Input.is_action_pressed("ui_right"):
		velocity.x = speed * delta
	else:
		velocity.x = 0
	
	
	move_and_slide()
