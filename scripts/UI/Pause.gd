extends Control


func _ready():
	pass


func _on_Exit_Button_pressed():
	Singleton.exit()


func _on_Ok_Button_pressed():
	hide()
	Singleton.pause = false


func _on_Save_Button_pressed():
	Singleton.save_game()


func _on_Load_Button_pressed():
	Singleton.load_game()
	


func _on_Skills_Button_pressed():
	$Inventory.hide()
	$Settings.hide()
	$QuestMenu.hide()
	$Skills.show()


func _on_Settings_Button_pressed():
	pass


func _on_Quests_Button_pressed():
	$Inventory.hide()
	$Settings.hide()
	$Skills.hide()
	$QuestMenu.show()


func _on_Menu_Button_pressed():
	$Inventory.hide()
	$QuestMenu.hide()
	$Skills.hide()
	$Settings.show()


func _on_Inventory_Button_pressed():
	$QuestMenu.hide()
	$Skills.hide()
	$Settings.hide()
	$Inventory.show()
