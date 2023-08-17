extends Area2D

const speed = 5000

var direction
var player


func _ready():
	$AutodestructionTimer.start()


func _process(delta):
	position += direction * speed * delta


func _on_timer_timeout():
	queue_free()


func _on_body_entered(body):
	if body == player:
		queue_free()
