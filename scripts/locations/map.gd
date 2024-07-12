extends Node2D

var start_pos_x = 448
var start_pos_y = 280
var help = true

func _ready():
	Singleton.do_magic = true
	if Singleton.tp == 1:
		$YSort/Player1.position.x = Singleton.tp_x
		$YSort/Player1.position.y = Singleton.tp_y
	elif Singleton.tp == 0:
		if Singleton.has_saves:
			print("Позиция из сохранения")
			$YSort/Player1.position.x = Singleton.save_player_pos_x
			$YSort/Player1.position.y = Singleton.save_player_pos_y
		elif Singleton.has_saves == false:
			$YSort/Player1.position.x = start_pos_x
			$YSort/Player1.position.y = start_pos_y
			print("Начальная позиция")


func _physics_process(delta):
	if Singleton.weather == "rain":
		$CanvasModulate.show()
		$raindrop.show()
	else:
		$CanvasModulate.hide()
		$raindrop.hide()
