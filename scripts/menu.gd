extends Node2D

func _ready():
	print("Проверка гита и того, что я не рукожоп")
	#get_tree().connect("network_peer_connected", self, "_connected")


#func _on_HostButton_pressed():
	#var server = NetworkedMultiplayerENet.new()
	#server.create_server(8282, 2)
	#get_tree().set_network_peer(server)
#func _on_JoinButton_pressed():
	#var client = NetworkedMultiplayerENet.new()
	#client.create_client("127.0.0.1", 8282)
	#get_tree().set_network_peer(client)

#func _connected(client_id):
	#Singleton.user_id = client_id
	#var game = preload("res://scenes/Map.tscn").instance() #грузим другую сцену
	#get_tree().get_root().add_child(game) #переходим в игру
	#hide() #прячем меню


func _on_PLAYButton_pressed():
	Singleton.config = ConfigFile.new()
	var error = Singleton.config.load("user://game.cfg")
	if error != OK:
		print("Не удалось загрузить файл конфигурации.")
	else:
		Singleton.has_saves = Singleton.config.has_section_key("Player", "location_now")

	

	if Singleton.has_saves == false:
		Singleton.help_1 = true
		Singleton.help_2 = true
		Singleton.change_scene("res://scenes/home.tscn")
		Singleton.save_game()
	elif Singleton.has_saves == true:
		$Container.modulate = Color(1,1,1,0.1)
		$Label.show()
		$Container/PLAYButton.disabled = true
		$Container/ExitButton.disabled = true
		$Container/LoadButton.disabled = true


func _on_ExitButton_pressed():
	Singleton.exit()

func _on_LoadButton_pressed():
	Singleton.load_game()

func _on_No_pressed():
	$Container.modulate = Color(1,1,1,1)
	$Label.hide()
	$Container/PLAYButton.disabled = false
	$Container/ExitButton.disabled = false
	$Container/LoadButton.disabled = false

func _on_Yes_pressed():
	Singleton.help_1 = true
	Singleton.help_2 = true
	Singleton.has_saves = false
	Singleton.delete_save()
	$Container/PLAYButton.disabled = false
	$Container/ExitButton.disabled = false
	$Container/LoadButton.disabled = false
	Singleton.change_scene("res://scenes/home.tscn")
	Singleton.save_game()
