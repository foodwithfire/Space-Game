extends Node2D

var planet_defender_scene = preload("res://scenes/planet_defender.tscn")
var _scale
var planetdef_amount

func _ready():
	_scale = randi_range(1, 8)
	set_scale(Vector2(_scale, _scale))
	planetdef_amount = round(_scale * randi_range(1, 2))
	
	
	for i in range(planetdef_amount):
		var planet_defender = planet_defender_scene.instantiate()
		$PlanetDefenders.add_child(planet_defender)
