extends GPUParticles2D


func _physics_process(delta):
	lifetime = randi_range(1, 2)
