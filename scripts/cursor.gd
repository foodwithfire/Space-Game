extends Area2D


func _process(delta):
	position = get_global_mouse_position()
	set_scale(Vector2(0.6, 0.6))
