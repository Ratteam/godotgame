extends "res://Scripts/Tank.gd"

export (float) var turret_speed
export (int) var detect_radius

var target = null

# 找到父节点
onready var parent = get_parent()

func _ready():
	# 设置碰撞半径
	$DetectRadius/CollisionShape2D.shape.radius = detect_radius

func control(delta):
	if parent is PathFollow2D:
		parent.set_offset(parent.get_offset() + speed * delta)
		# 碰撞问题处理,置为0
		position = Vector2()
	else:
		pass

# 每帧调用
func _process(delta):
	if target:
		var target_dir = (target.global_position - global_position).normalized()
		var current_dir = Vector2(1, 0).rotated($Turret.global_rotation)
		$Turret.global_rotation = current_dir.linear_interpolate(target_dir, turret_speed * delta).angle()

# 进入时获取目标
func _on_DetectRadius_body_entered(body):
	if body.name == "Player":
		target = body

# 退出时清空目标
func _on_DetectRadius_body_exited(body):
	if body == target:
		target = null
