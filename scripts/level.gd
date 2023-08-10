extends Node2D

const screen = Vector2(universe_size * 2, universe_size * 2)
const universe_size = 18000
const planet_spawn_chance = 50

var planet_scene = preload("res://scenes/planet.tscn")
var planet_size = 6000


func _ready():
	var planet_offset = 2000
	var offset = 2000
	for y in range(screen.y/planet_size):
		for x in range(screen.x/planet_size):
			if randi_range(0, 100) >= planet_spawn_chance:
				var planet = planet_scene.instantiate()
				planet.position = Vector2(x * planet_size - universe_size + offset + randi_range(-planet_offset, planet_offset),
				y * planet_size - universe_size + offset + randi_range(-planet_offset , planet_offset))
				$Planets.add_child(planet)


func _process(delta):
	pass
