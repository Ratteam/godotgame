extends Node

export (PackedScene) var Mob
var score

func _ready():
	randomize()

# 游戏结束
func game_over():
	get_tree().call_group("mobs", "queue_free")
	$ScoreTimer.stop()
	$MobTimer.stop()
	$HUD.show_game_over()

# 新游戏
func new_game():
	score = 0
	# 游戏开始
	$player.start($StartPosition.position)
	$StartTimer.start()
	$HUD.update_score(score)
	$HUD.show_message("准备好了吗")

# StartTimer结束后开始下一步
func _on_StartTimer_timeout():
	$MobTimer.start()
	$ScoreTimer.start()

# 计算分数结束后执行+1
func _on_ScoreTimer_timeout():
	score +=1
	$HUD.update_score(score)

func _on_MobTimer_timeout():
	# 随机生成位置
	$MobPath/MobSpawnLocation.set_offset(randi())
	var mob = Mob.instance()
	add_child(mob)
	var direction = $MobPath/MobSpawnLocation.rotation + PI/2
	mob.position = $MobPath/MobSpawnLocation.position
	direction += rand_range(-PI/4,PI/4)
	mob.rotation = direction
	mob.set_linear_velocity(Vector2(rand_range(mob.min_speed, mob.max_speed),0).rotated(direction))
