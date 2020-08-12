extends KinematicBody2D

# 加速度
const ACCELERATION = 10
# 最大速度
const MAX_SPEED = 100
# 摩擦力
const FRICTION = 10

# 坐标点
var velocity = Vector2.ZERO

# 每帧调用
func _physics_process(delta):
	# 重置坐标
	var input_vector = Vector2.ZERO
	# 获取坐标点
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	# 归一化 1:1
	input_vector = input_vector.normalized()
	# 判断是否移动
	if input_vector != Vector2.ZERO:
		# 增加移动速度
		velocity += input_vector * ACCELERATION * delta
		# 限制移动速度最大值
		velocity = velocity.clamped(MAX_SPEED * delta)
	else:
		# 停止移动时，添加摩擦力
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	print(input_vector)
	# 依据坐标移动
	move_and_collide(velocity)
