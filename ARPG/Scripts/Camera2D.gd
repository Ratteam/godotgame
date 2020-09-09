extends Camera2D

onready var topLeft = $Limits/TopLeft
onready var bottonRight = $Limits/BottomRight

func _ready():
	limit_top = topLeft.position.y
	limit_left = topLeft.position.x
	limit_bottom = bottonRight.position.y
	limit_right = bottonRight.position.x
