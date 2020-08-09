extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export (Array, Texture) var images
onready var last_score = Global.last_score
# Called when the node enters the scene tree for the first time.
func _ready():
	# 给结算界面赋值
	$Bg/Reword/Best.text = str(Global.base_score)
	$Bg/Reword/Last.text = str(last_score)
	
	if last_score < 5:
		$Bg/Reword/Coin.texture = images[0]
	elif last_score < 10:
		$Bg/Reword/Coin.texture = images[1]
	else:
		$Bg/Reword/Coin.texture = images[2]
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_TouchScreenButton_pressed():
	Global.goto_scene("res://Scenes/Main.tscn")
	# 强制背景音乐到开始
	Global.audio_player_bg.seek(0)
	# 重置游戏状态
