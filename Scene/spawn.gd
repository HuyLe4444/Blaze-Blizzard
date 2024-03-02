extends Node2D



signal enemy_spawned(new_enemy)

func _process(delta):
	print("3")
	spawn()

func spawn():
	var new_spawn = enemy.instance()
	new_spawn.global_position = pos.global_position
	emit_signal("enemy_spawned", new_spawn)
