extends Node

var title_size =  Vector2(128,128)
onready var texture = $Sprite.texture

func _ready():
	var tex_width = texture.get_width() / title_size.x
	var tex_height = texture.get_height() / title_size.y
	var ts = TileSet.new()
	for x in range(tex_width):
		for y in range(tex_height):
			var region = Rect2(x * title_size.x, y * title_size.y,
								title_size.x,title_size.y)
			var id = x + y * 10
			ts.create_tile(id)
			ts.tile_set_texture(id, texture)
			ts.tile_set_region(id, region)
	ResourceSaver.save("res://Terrain/terrain_tiles.tres", ts)
