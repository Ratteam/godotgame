extends KinematicBody2D

func _on_Hitbox_area_entered(area):
	queue_free()
