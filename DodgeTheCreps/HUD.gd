extends CanvasLayer

signal start_game

func show_message(text):
	$MessageLabel.text = text
	$MessageLabel.show()
	$MessageTimer.start()

func show_game_over():
	# 显示游戏结束
	show_message("Game Over")
	# 执行定时
	yield($MessageLabel,"timeout")
	# 重新显示开始
	$StartButton.show()
	$MessageLabel.text = "快来\n躲猫猫"
	$MessageLabel.show()

# 更新分数
func update_score(score):
	$ScoreLabel.text = str(score)

func _on_StartButton_pressed():
	emit_signal("start_game")
	$StartButton.hide()

func _on_MessageTimer_timeout():
	$MessageLabel.hide()
