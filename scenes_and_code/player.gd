extends CharacterBody3D

var speed = 14
var fall_acceleration = 75
var target_velocity = Vector3.ZERO

func _physics_process(delta):
	var direction = Vector3.ZERO
	
	if Input.is_action_pressed("ui_right"):
		direction.x -= 1
	if Input.is_action_pressed("ui_left"):
		direction.x += 1
	
	if Input.is_action_pressed("ui_up"):
		direction.z += 1
	if Input.is_action_pressed("ui_down"):
		direction.z -= 1
	
	# normalize the vector
	# point the player in the right direction
	if !direction == Vector3.ZERO:
		direction = direction.normalized()
		$Pivot.look_at(position + direction, Vector3.UP)
	
	target_velocity.x = direction.x * speed
	target_velocity.z = direction.z * speed

	if !is_on_floor():
		target_velocity.y = target_velocity.y - (fall_acceleration * delta)
	
	velocity = target_velocity
	move_and_slide()