extends Area2D
#player

# 定义信号
signal hit

# 定义速度
export (int) var speed
# 定义窗口大小
var screensize

# 游戏开始
func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false

# 入口
func _ready():
	# 获取视窗大小
	screensize = get_viewport_rect().size
	hide()

# 按屏幕帧时间调用
func _process(delta):
	var velocity = Vector2()
	# 检测键盘事件
	if Input.is_action_pressed("ui_right"):
		velocity.x +=1
	if Input.is_action_pressed("ui_left"):
		velocity.x -=1
	if Input.is_action_pressed("ui_down"):
		velocity.y +=1
	if Input.is_action_pressed("ui_up"):
		velocity.y -=1
	# 按向量决定动画是否播放
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()
	# 获取位置，限制位置
	position += velocity * delta
	position.x = clamp(position.x,0,screensize.x)
	position.y = clamp(position.y,0,screensize.y)
	if velocity.x !=0:
		$AnimatedSprite.animation = "right"
		# 翻转
		$AnimatedSprite.flip_v = false
		$AnimatedSprite.flip_h = velocity.x<0
	elif velocity.y !=0:
		$AnimatedSprite.animation = "up"
		$AnimatedSprite.flip_v = velocity.y>0

func _on_player_area_entered(area):
	emit_signal("hit")
	hide()
	$CollisionShape2D.disabled = true
	
	
