extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var pipe = preload("res://Scenes/Pipe.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_PipeTimer_timeout():
	# 添加管道
	var new_pipe = pipe.instance()
	new_pipe.position = Vector2(370,rand_range(-100,160))
	add_child(new_pipe)
