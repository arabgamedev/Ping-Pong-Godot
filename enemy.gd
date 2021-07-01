extends KinematicBody2D

var motion=Vector2()
var speed=300
onready var ball=get_node("../ball")
func _physics_process(delta):
	if not get_parent().game_started:
		position.x=200
		return
	if ball.position.x>position.x+20:
		motion.x=speed
	elif ball.position.x<position.x-20:
		motion.x=-speed
	else:
		motion.x=0
	move_and_slide(motion)
