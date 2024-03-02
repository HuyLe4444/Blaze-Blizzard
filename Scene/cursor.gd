extends CharacterBody2D

signal enemy_Appered
signal enemy_DisAppered
signal firewood_Appered
signal firewood_DisAppered
signal turret_Can_Fired
signal turret_Stop_Fired

var mouse_position = null
var direction
var magnitude = 0

func _physics_process(delta):
	mouse_position = get_global_mouse_position()
	if position.distance_to(mouse_position) > 10:
		var direction = (mouse_position - position).normalized()
		velocity = direction * 1000
		
		move_and_slide()

func _on_area_2d_body_entered(body):
	if body.has_method("mob"):
		emit_signal("enemy_Appered")
		emit_signal("turret_Can_Fired")
	if body.has_method("firewood"):
		emit_signal("firewood_Appered")

func _on_area_2d_body_exited(body):
	if body.has_method("mob"):
		emit_signal("enemy_DisAppered")
		emit_signal("turret_Stop_Fired")
	if body.has_method("firewood"):
		emit_signal("firewood_DisAppered")
