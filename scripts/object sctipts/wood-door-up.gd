extends StaticBody2D

var door_open = false
var in_area = false

func _ready(): 
	$open/sprite_open.hide()
	$open/Collision_open.disabled = true


func _on_Door_area_body_entered(_body):
	in_area = true
	$Light2D.show()


func _on_Door_area_body_exited(_body):
	in_area = false
	$Light2D.hide()





func _input(event):
	if event.is_action_pressed("Test"):
		if in_area == true:
			if door_open == false:
				$close/sprite_close.hide()
				$close/Collision_close.disabled = true
				$open/sprite_open.show()
				$open/Collision_open.disabled = false
				door_open = true
			elif door_open == true:
				$open/sprite_open.hide()
				$close/Collision_close.disabled = false
				$close/sprite_close.show()
				$open/Collision_open.disabled = true
				door_open = false
