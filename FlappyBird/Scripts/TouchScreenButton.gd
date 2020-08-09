extends TouchScreenButton


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	connect("pressed", self, "_on_TouchScreenButton_pressed")
	pass # Replace with function body.


func _on_TouchScreenButton_pressed():
	Global.play_audio(Global.BUTTON)
	Global.goto_scene("res://Scenes/Game.tscn")
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
