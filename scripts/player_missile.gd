extends Area2D

const speed = 3000

var direction


func _ready():
	pass


func _process(delta):
	position += direction * delta * speed
