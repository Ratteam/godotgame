extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var brid_type = ["red", "yellow", "blue"]
var die = false
# Called when the node enters the scene tree for the first time.
func _ready():
	# 随机获取小鸟颜色
	$AnimatedSprite.animation = brid_type[randi() % brid_type.size()]
	$AnimatedSprite.play()

func game_start():
	# 重力
	gravity_scale = 2

# 获取屏幕点击事件
func _input(event):
	if Global.current_state != Global.game_state.PLAY:
		return
	if event.is_action_pressed("ui_touch"):
		linear_velocity = Vector2(0,-80)
		Global.play_audio(Global.TOUCH)

# 碰撞判断
func _integrate_forces(state):
	if Global.current_state != Global.game_state.PLAY:
		return
	if state.get_contact_count() > 0 and not die:
		die = true
		$AnimatedSprite.animation = "die"
		Global.current_scene.game_over()
		Global.play_audio(Global.DIE)
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
