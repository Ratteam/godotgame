extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var offset_x = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# 背景移动
	$BgBackground.scroll_offset.x -= delta * offset_x
	$TopBackgroud.scroll_offset.x -= delta * offset_x
	$BouttomBackgroud.scroll_offset.x -= delta * offset_x
