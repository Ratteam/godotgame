extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export (int) var move_speed = 100
export (Array,Texture) var images

# Called when the node enters the scene tree for the first time.
func _ready():
#	var image = images[randi() % images.size()]
#	$Bouttom.texture = image
#	$Top.texture = image
	$Area2D.connect("body_entered",self,"_on_Area2D_body_entered")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# 场景移动
	position.x -= delta * move_speed
	
func _on_Area2D_body_entered(body):
	if body.name == "Brid":
		pass
	
