extends Node2D

var start_pos_x = 0
var start_pos_y = 0

func _ready():
	Singleton.do_magic = false
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
		#Control.pause(0)
		#var player1=preload("res://scenes/Player 1.tscn").instance()
		#player1.set_name(str(get_tree().get_network_unique_id()))      #дает уникальный id из сервера
		#player1.set_network_master(get_tree().get_network_unique_id())
		#player1.global_transform = playerPos1.global_transform
		#add_child(player1)
		
		#var player2=preload("res://scenes/Player 2.tscn").instance()
		#player2.set_name(str(Singleton.user_id))
		#player2.set_network_master(Singleton.user_id)      # дает имя -1
		#player2.global_transform = playerPos2.global_transform
		#add_child(player2)
		
#func _process(delta):
	#pass
	#if Input.is_action_just_pressed("Pause"):
		#Control.pause()




