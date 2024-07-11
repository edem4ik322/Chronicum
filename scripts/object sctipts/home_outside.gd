extends StaticBody2D

var in_area = false


func _ready():
	pass


func _on_Area2D_body_entered(_body):
	in_area = true
	$Light2D.show()


func _input(event):
	if event.is_action_pressed("Test"):
		if in_area == true:
			Singleton.tp = 1
			Singleton.tp_x = 225
			Singleton.tp_y = 33
			Singleton.location_now = "home"
			Singleton.change_scene("res://scenes/home.tscn")
			print("Вошел в дом")
			Singleton.tp = 0

func _on_Area2D_body_exited(_body):
	in_area = false
	$Light2D.hide()

