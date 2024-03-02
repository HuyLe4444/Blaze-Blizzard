extends Node

var enemy = preload("res://Scene/Slime.tscn")
var firewood = preload("res://Scene/firewood.tscn")
var mineral = preload("res://Scene/mineral.tscn")

func _process(delta):
	if randf() < 0.01:
		spawn()
	
	if randf() < 0.005:
		spawnFirewood()
		
	if randf() < 0.007:
		spawnMineral()
		
func spawnMineral():
	print("2")
	var new_spawn = mineral.instantiate()
	add_child(new_spawn)

	var viewport = get_viewport()
	var viewport_bounds = viewport.get_visible_rect()
	
	new_spawn.position.x = randf_range(0, viewport_bounds.size.x)
	new_spawn.position.y = randf_range(0, viewport_bounds.size.y)

func spawnFirewood():
	print("2")
	var new_spawn = firewood.instantiate()
	add_child(new_spawn)

	var viewport = get_viewport()
	var viewport_bounds = viewport.get_visible_rect()
	
	new_spawn.position.x = randf_range(0, viewport_bounds.size.x)
	new_spawn.position.y = randf_range(0, viewport_bounds.size.y)
   
func spawn():
	print("1")
	var new_spawn = enemy.instantiate() 
	add_child(new_spawn)
   
	var screen_size = get_viewport().get_visible_rect().size
	var margin = 50

	var locations = [
	  Vector2(margin, margin),
	  Vector2(screen_size.x - margin, margin), 
	  Vector2(margin, screen_size.y - margin),
	  Vector2(screen_size.x - margin, screen_size.y - margin)
   ]
   
	new_spawn.position = locations[randi() % locations.size()]
