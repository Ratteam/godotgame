extends Area2D

# 自定义控制打击特效显示
export(bool) var show_hit = true

# 预加载打击效果
const HitEffect = preload("res://Scenes/HitEffect.tscn")

func _on_Hurtbox_area_entered(area):
	if show_hit:
		var effect = HitEffect.instance()
		var main = get_tree().current_scene
		main.add_child(effect)
		effect.global_position = global_position

