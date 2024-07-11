extends Control


func _ready():
	pass


func _on_Exit_Button_pressed():
	Singleton.exit()


func _on_Button_pressed():
	hide()
	Singleton.pause = false


func _on_Save_Button_pressed():
	Singleton.save_game()


func _on_Load_Button_pressed():
	Singleton.load_game()
	
