extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

enum {BG, BUTTON, DIE, TOUCH, SCORE}
var current_scene = null

# 加载资源
onready var audio_bg = preload("res://Assets/Audios/Bg.ogg")
onready var audio_button = preload("res://Assets/Audios/sfx_button.wav")
onready var audio_die = preload("res://Assets/Audios/sfx_die.wav")
onready var audio_score = preload("res://Assets/Audios/sfx_score.wav")
onready var audio_touch = preload("res://Assets/Audios/sfx_touch.wav")
onready var audio_player_bg = AudioStreamPlayer.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	# 随机数序列
	randomize()
	# 取到根节点
	var root = get_tree().get_root()
	current_scene = root.get_child(root.get_child_count()-1)
	# 播放背景音乐
	# play_audio(BG)
	pass # Replace with function body.

# 跳转到下一个场景
func goto_scene(path):
	# 空闲时加载
	call_deferred("_deferred_goto_scene",path)

func _deferred_goto_scene(path):
	# 删除当前
	current_scene.free()
	# 加载目标
	current_scene = ResourceLoader.load(path).instance()
	# 添加
	get_tree().get_root().add_child(current_scene)
	
# 播放方法
func play_audio(audio_name):
	if audio_name == BG:
		audio_player_bg.stream = audio_bg
		add_child(audio_player_bg)
		audio_player_bg.play()
		return 
		
	# 单独实例化不影响背景音乐
	var audio_play_sfx = AudioStreamPlayer.new()
	# BG, BUTTON, DIE, TOUCH, SCORE
	match audio_name:
		BUTTON:
			audio_play_sfx.stream = audio_button
		DIE:
			audio_play_sfx.stream = audio_die
		TOUCH:
			audio_play_sfx.stream = audio_touch
		SCORE:
			audio_play_sfx.stream = audio_score
	add_child(audio_play_sfx)
	audio_play_sfx.play()
	# 播放完就销毁掉
	yield(audio_play_sfx,"finished")
	audio_play_sfx.queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
