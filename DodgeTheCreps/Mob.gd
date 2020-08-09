extends RigidBody2D

# 定义最小速度
export (int) var min_speed
# 定义最大速度
export (int) var max_speed
# 定义状态
var mob_types = ["walk", "swim", "fly"]

func _ready():
	# randi取随机数0，3
	$AnimatedSprite.animation = mob_types[randi() % mob_types.size()]
	$AnimatedSprite.play()

func _on_VisibilityNotifier2D_screen_exited():
	# 销毁对象	
	queue_free()
