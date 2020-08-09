extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export (int) var move_speed = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	$Area2D.connect("body_entered",self,"_on_Area2D_body_entered")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# 场景移动
	position.x -= delta * move_speed
	
func _on_Area2D_body_entered(body):
	if body.name == "Brid":
		pass
	
