extends StaticBody2D

var door_open = false
var in_area = false

func _ready():
	pass

func _on_Door_area_body_entered(_body):
	in_area = true
	$Light2D.show()


func _on_Door_area_body_exited(_body):
	in_area = false
	$Light2D.hide()
	
func _input(event):
	if event.is_action_pressed("Test"):
		if in_area == true:
			Singleton.help_1 = false
			Singleton.tp = 1
			Singleton.tp_x = 448
			Singleton.tp_y = 280
			Singleton.location_now = "map"
			Singleton.change_scene("res://scenes/map.tscn")
			print("Вышел на улицу")
			Singleton.tp = 0
			

