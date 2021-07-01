extends KinematicBody2D

var motion=Vector2()
var speed=300

func _physics_process(delta):
	if Input.is_action_pressed("move_left"):
		motion.x=-speed
	elif Input.is_action_pressed("move_right"):
		motion.x=speed
	else:
		motion.x=0
	
	move_and_slide(motion)
	
