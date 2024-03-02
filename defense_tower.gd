extends CharacterBody2D

var EnemyInRange = false
var Reloaded = true
var canShoot_mouse = false
var canShoot_firewood = false
var enemies_in_range = [] # Store enemies currently in range

func _physics_process(delta):
	turn_default()
	if EnemyInRange:
		look_at_closest_enemy()

func turn_default():
	if not EnemyInRange:
		var DefaultTurning = get_global_mouse_position()
		get_node("nozzle").look_at(DefaultTurning)

func look_at_closest_enemy():
	var closest_enemy = null
	var closest_distance = INF # Use a very high number to start comparison

	for enemy in enemies_in_range:
		var distance = position.distance_to(enemy.position)
		if distance < closest_distance:
			closest_distance = distance
			closest_enemy = enemy

	if canShoot_mouse == true or canShoot_firewood == true or Global.is_Lit == true:
		if closest_enemy:
			get_node("nozzle").look_at(closest_enemy.position)
			if Reloaded:
				fire(closest_enemy)

func _on_fire_range_body_entered(body):
	if body.has_method("mob"): # Assuming this method is used to identify enemies
		if not enemies_in_range.has(body):
			enemies_in_range.append(body)
		EnemyInRange = enemies_in_range.size() > 0

func _on_fire_range_body_exited(body):
	if enemies_in_range.has(body):
		enemies_in_range.erase(body)
	EnemyInRange = enemies_in_range.size() > 0

func fire(body):
	body.health = body.health - 15
	Reloaded = false
	await get_tree().create_timer(1).timeout 
	Reloaded = true
	


func _on_cursor_turret_can_fired():
	canShoot_mouse = true

func _on_cursor_turret_stop_fired():
	canShoot_mouse = false


#func _on_firewood_turret_can_fired():
	#canShoot_firewood = true
#
#func _on_firewood_turret_stop_fired():
	#canShoot_firewood = false
