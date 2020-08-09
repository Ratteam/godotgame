extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var offset_x = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	game_ready()

func game_ready():
	Global.current_state = Global.game_state.READY
	$HUB/Ready.show()
	$HUB/Score.hide()
	$HUB/ReadyTimer.start()

func game_start():
	Global.current_state = Global.game_state.PLAY
	$HUB/Ready.hide()
	$HUB/Score.show()
	# 管道定时开始
	$Pipes/PipeTimer.start()

func game_over():
	Global.current_state = Global.game_state.OVER
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# 背景移动
	$BgBackground.scroll_offset.x -= delta * offset_x
	$TopBackgroud.scroll_offset.x -= delta * offset_x
	$BouttomBackgroud.scroll_offset.x -= delta * offset_x


func _on_ReadyTimer_timeout():
	game_start()
