extends Node

func _process(delta):
	$Label.text = "Resources: " + str(Global.resources)
	print("4")

func _on_node_2d_enemy_spawned(new_enemy):
	print("1")
	add_child(new_enemy)
