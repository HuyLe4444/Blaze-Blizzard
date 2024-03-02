extends CharacterBody2D

signal enemy_Appered(is_Lit2)
signal enemy_DisAppered(is_Lit2)
signal picked_up
signal turret_Can_Fired
signal turret_Stop_Fired
var mouse_in = false

@export var duration = 20.0 
@onready var area_node = $Area2D
@onready var sprite_node = $Sprite2D
@onready var light_node = $PointLight2D
@onready var timer_node = $Timer

func _ready():
	timer_node.wait_time = duration
	timer_node.start()

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
		self.visible = true

func _on_cursor_firewood_dis_appered():
		self.visible = false

func _on_area_2d_body_entered(body):
	if body.has_method("mob"):
		emit_signal("enemy_Appered", body)


func _on_area_2d_body_exited(body):
	if body.has_method("mob"):
		emit_signal("enemy_DisAppered", body)

func _on_Timer_timeout():
	queue_free() # Delete firewood

