extends KinematicBody2D

var motion=Vector2(0,300)
var sensivity=13
onready var player=get_node("../player")
onready var enemy=get_node("../enemy")

func _ready():
	randomize()
	reset_ball()
	pass

func _physics_process(delta):
	if not get_parent().game_started:
		return
	if is_on_wall():
		motion.x*=-1
	
	if is_on_floor():
		touch_someone(player)
	if is_on_ceiling():
		touch_someone(enemy)
	move_and_slide(motion,Vector2(0,-1))

func touch_someone(node):
	motion.y*=-1
	motion.x=(position.x-node.position.x)*sensivity

func reset_ball():
	motion.x=rand_range(-300,300)
