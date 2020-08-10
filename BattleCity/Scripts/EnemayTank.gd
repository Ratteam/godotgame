extends "res://Scripts/Tank.gd"

# 找到父节点
onready var parent = get_parent()

func control(delta):
	if parent is PathFollow2D:
		parent.set_offset(parent.get_offset() + speed * delta)
	else:
		pass
