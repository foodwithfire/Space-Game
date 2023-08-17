extends TextureProgressBar



func _process(delta):
	position.x = $"..".global_position.x - 3000
	position.y = $"..".global_position.y + 1500
