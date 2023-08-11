extends CharacterBody2D

signal missile_shot

const max_speed = 5000
const air_resistance = 0.985

var speed = 2000
var can_shoot = true

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
	
	player_input()


func player_input():
	var mouse = Vector2(get_global_mouse_position())
	var direction = Vector2(mouse - position).normalized()
	if Input.is_action_pressed("left click") and can_shoot:
		can_shoot = false
		missile_shot.emit(direction)
		$PlayerMissileTimer.start()


func _on_player_missile_timer_timeout():
	can_shoot = true
