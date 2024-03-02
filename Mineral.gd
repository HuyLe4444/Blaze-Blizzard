extends CharacterBody2D

var mouse_in = false
var visible_check_mouse = false
var count = 0
@onready var animated_sprite_2d = $AnimatedSprite2D

func _physics_process(delta):
	animated_sprite_2d.animation = "idle"
	if Global.is_Lit == true or visible_check_mouse == true:
		self.visible = true
	else:
		self.visible = false
		
	if Input.is_action_just_pressed("click") and mouse_in == true:
		if count < 10:
			count += 1
			Global.resources += 1
		else:
			queue_free()
	
func mineral():
	pass

func _on_area_2d_mouse_entered():
	mouse_in = true

func _on_area_2d_mouse_exited():
	mouse_in = false


func _on_cursor_mineral_appered():
	visible_check_mouse = true


func _on_cursor_mineral_dis_appered():
	visible_check_mouse = false
