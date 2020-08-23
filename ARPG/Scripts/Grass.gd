extends Node2D

func create_grass_effect():
	var GrassEffect = load("res://Scenes/GrassEffect.tscn")
	var grassEffect = GrassEffect.instance()
	var world = get_tree().current_scene
	world.add_child(grassEffect)
	grassEffect.global_position = global_position

func _on_Hitbox_area_entered(area):
	create_grass_effect()
	queue_free()
