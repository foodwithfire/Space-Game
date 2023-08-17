extends Area2D

const speed = 5000

var damage = 30
var direction


func _ready():
	$AutodestructionTimer.start()


func _process(delta):
	position += direction * delta * speed


func _on_autodestruction_timer_timeout():
	queue_free()


func _on_area_entered(area):
	area.health -= damage
	queue_free()


func _on_body_entered(body):
	queue_free()
