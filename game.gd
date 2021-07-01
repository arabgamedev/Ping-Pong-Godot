extends Control

var score={"player":0,"enemy":0}
var game_started=false
func _ready():
	new_game()

func _physics_process(delta):
	$timer_txt.text=str(ceil($timer_txt/Timer.time_left))

func goal(body, extra_arg_0):
	score[extra_arg_0]+=1
	get_node("hud/score_"+extra_arg_0).text=str(score[extra_arg_0])
	new_game()

func new_game():
	game_started=false
	$timer_txt/Timer.start()
	$timer_txt.visible=true
	$ball.position=Vector2(200,300)
	$ball.reset_ball()

func _on_Timer_timeout():
	game_started=true
	$timer_txt.visible=false
