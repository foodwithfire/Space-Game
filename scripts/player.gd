extends CharacterBody2D

const max_speed = 5000
const air_resistance = 0.985

var speed = 2000


func _ready():
	position = Vector2((1920/2), (1080/2))


func _process(delta):
	velocity.x += (int(Input.is_action_pressed("right")) - int(Input.is_action_pressed("left"))) * speed * delta
	velocity.y += (int(Input.is_action_pressed("down")) - int(Input.is_action_pressed("up"))) * speed * delta
	velocity.x *= air_resistance
	velocity.y *= air_resistance
	move_and_slide()
	
	look_at(get_global_mouse_position())
	rotation_degrees += 90
