extends Area2D

var speeds = [0.15, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1]
var angle = 0
var direction
var speed
var sight = randi_range(5, 10)
var radius = sight * 40

var player
var player_in_sight = false


func _ready():
	player = $".."/".."/".."/".."/Player
	speed = shuffleList(speeds)[0]
	if randi_range(0, 1) == 0:
		direction = 1
	else:
		direction = -1


func _process(delta):
	$PlanetDefenderHitbox.set_global_scale(Vector2(0.5, 0.6))
	$PlanetSight.set_global_scale(Vector2(sight, sight))
	if not player_in_sight:
		position.x = cos(angle) * radius
		position.y = sin(angle) * radius
		angle += speed * delta * direction
	else:
		look_at(player.position)
		rotation_degrees += 90


func shuffleList(list):
	var shuffledList = [] 
	var indexList = range(list.size())
	for i in range(list.size()):
		var x = randi()%indexList.size()
		shuffledList.append(list[indexList[x]])
		indexList.erase(x)
	return shuffledList


func player_entered_sight(body):
	if body == player:
		player_in_sight = true

func player_exited_sight(body):
	if body == player:
		player_in_sight = false
