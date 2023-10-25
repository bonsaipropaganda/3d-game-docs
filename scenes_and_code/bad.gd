extends Area3D

var speed = 0
var score = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	position.y -= speed * delta


func _on_visible_on_screen_notifier_3d_screen_exited():
	speed = speed + .25
	global_position.y = 4
	global_position.x = randf_range(-2.5,2.5)
	score += 1
	$"../Label".text = "Score: " + str(score)


func _on_button_pressed():
	speed = 5
	$"../Button".visible = false
	score = 0


func _on_body_entered(body):
	speed = 0
	$"../Button".visible = true
