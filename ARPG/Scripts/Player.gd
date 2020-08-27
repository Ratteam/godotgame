extends KinematicBody2D

# 加速度
const ACCELERATION = 500
# 最大速度
const MAX_SPEED = 80
# 滚动速度
const ROLL_SPEED = 120
# 摩擦力
const FRICTION = 500

# 自定义玩家状态
enum {
	MOVE,
	ROLL,
	ATTACK
}

# 玩家状态
var state = MOVE
# 坐标点
var velocity = Vector2.ZERO
var roll_vector = Vector2.ZERO

# 获取子节点
onready var animationPlayer = $AnimationPlayer
onready var animationTree = $AnimationTree
onready var animationState = animationTree.get("parameters/playback")

func _ready():
	animationTree.active = true

# 每帧调用
func _process(delta):
	# 判断玩家状态
	match state:
		MOVE:
			move_state(delta)
		ROLL:
			roll_state(delta)
		ATTACK:
			attack_state(delta)

# 移动函数
func move_state(delta):
	# 重置坐标
	var input_vector = Vector2.ZERO
	# 获取坐标点
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	# 归一化 1:1
	input_vector = input_vector.normalized()
	# 判断是否移动
	if input_vector != Vector2.ZERO:
		roll_vector = input_vector
		# 播放移动动画
		animationTree.set("parameters/Idle/blend_position", input_vector)
		animationTree.set("parameters/Run/blend_position", input_vector)
		animationTree.set("parameters/Attack/blend_position", input_vector)
		animationTree.set("parameters/Roll/blend_position", input_vector)
		animationState.travel("Run")
		# 开始移动
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
	else:
		animationState.travel("Idle")
		# 停止移动时，添加摩擦力
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	move()
	# 监听键盘事件
	if Input.is_action_just_pressed("roll"):
		state = ROLL
		
	if Input.is_action_just_pressed("attack"):
		state = ATTACK

# 滚动函数
func roll_state(delta):
	velocity = roll_vector * ROLL_SPEED
	animationState.travel("Roll")	
	move()

# 依据坐标移动
func move():
	velocity = move_and_slide(velocity)
	
# 攻击函数
func attack_state(delta):
	velocity = Vector2.ZERO
	animationState.travel("Attack")
	
# 翻滚结束
func roll_animation_finished():
	velocity = velocity * 0.8
	state = MOVE
	
# 监听攻击动画结束函数
func attack_animation_finished():
	state = MOVE
	
