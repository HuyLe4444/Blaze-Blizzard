extends CharacterBody2D

signal enemy_Appered
signal enemy_DisAppered
signal picked_up
signal turret_Can_Fired
signal turret_Stop_Fired
var mouse_in = false

func _process(delta):
	var fire_par = $Fire
	var fire_light = $PointLight2D
	if Input.is_action_just_pressed("click") and mouse_in == true:
		Global.is_Lit = true
		self.visible = true
		fire_par.visible = true
		fire_light.visible = true
		await get_tree().create_timer(20).timeout
		Global.is_Lit = false
		queue_free()

func firewood():
	pass

func _on_area_2d_mouse_entered():
	print("1")
	mouse_in = true

func _on_area_2d_mouse_exited():
	print("2")
	mouse_in = false



func _on_cursor_firewood_appered():
	if(Global.is_Lit == false):
		self.visible = !visible

func _on_cursor_firewood_dis_appered():
	if(Global.is_Lit == false):
		self.visible = !visible

func _on_Area_input_event():
	emit_signal("picked_up")
	queue_free()


func _on_area_2d_body_entered(body):
	if body.has_method("mob"):
		emit_signal("turret_Can_Fired")


func _on_area_2d_body_exited(body):
	if body.has_method("mob"):
		emit_signal("turret_Stop_Fired")
