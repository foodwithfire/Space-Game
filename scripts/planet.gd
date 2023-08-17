extends Node2D

var planet_defender_scene = preload("res://scenes/planet_defender.tscn")
var _scale
var planetdef_amount
var conquered = false

func _ready():
	$Body/Image2.show()	
	_scale = randi_range(1, 8)
	set_scale(Vector2(_scale, _scale))
	planetdef_amount = round(_scale * randi_range(1, 2))
	
	
	for i in range(planetdef_amount):
		var planet_defender = planet_defender_scene.instantiate()
		$PlanetDefenders.add_child(planet_defender)


func _process(delta):
	if planetdef_amount <= 0:
		conquered = true

	if conquered:
		$Body/Image.hide()
		$Body/Image2.show()
	else:
		$Body/Image.show()
		$Body/Image2.hide()
