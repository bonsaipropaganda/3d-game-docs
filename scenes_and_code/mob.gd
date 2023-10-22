extends CharacterBody3D

var min_speed = 14
var max_speed = 18
signal score

# Called when the node enters the scene tree for the first time.
func mob_init(start_pos,player_pos):
	var speed = randi_range(min_speed,max_speed)
	
	velocity = Vector3.FORWARD * speed
	
	look_at_from_position(start_pos,Vector3(player_pos.x + randi_range(-10,10),player_pos.y,player_pos.z),Vector3.UP)
	# We then rotate the velocity vector based on the mob's Y rotation
	# in order to move in the direction the mob is looking.
	velocity = velocity.rotated(Vector3.UP, rotation.y)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if !is_on_floor():
		velocity.y -= 10
	move_and_slide()


func _on_hitbox_body_entered(body):
	score.emit()
	queue_free()
