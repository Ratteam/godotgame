extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var brid_type = ["red", "yellow", "blue"]

# Called when the node enters the scene tree for the first time.
func _ready():
	# 随机获取小鸟颜色
	$AnimatedSprite.animation = brid_type[randi() % brid_type.size()]
	$AnimatedSprite.play()

# 获取屏幕点击事件
func _input(event):
	if event.is_action_pressed("ui_touch"):
		linear_velocity = Vector2(0,-80)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
