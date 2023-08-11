extends Area2D

const speed = 5000

var direction


func _ready():
	$AutodestructionTimer.start()


func _process(delta):
	position += direction * delta * speed


func _on_autodestruction_timer_timeout():
	queue_free()
