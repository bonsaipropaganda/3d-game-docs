extends Node3D

var mob_scene = preload("res://scenes_and_code/mob.tscn")
var score = 0
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func spawn_mob():
	var m = mob_scene.instantiate()
	$Path3D/PathFollow3D.progress_ratio = randf()
	m.mob_init($Path3D/PathFollow3D.position, $Player.position)
	add_child(m)
	m.score.connect(_on_update_score)
#	m.add_to_group("mob")


func _on_update_score():
	score += 1
	$ScoreLabel.text = "Score: " + str(score)
