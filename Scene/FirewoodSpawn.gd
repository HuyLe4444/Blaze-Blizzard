extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	spawn_firewood()
	spawn_firewood() 
	spawn_firewood()

func spawn_firewood():
	var firewood = preload("firewood.tscn").instance()
	add_child(firewood)
   
	var random_pos = Vector3(randf_range(-10, 10), 0, randf_range(-10, 10))
	firewood.translate(random_pos)


func _on_Firewood_picked_up():
	spawn_firewood()
