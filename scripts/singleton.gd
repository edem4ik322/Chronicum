extends Node

var config
var path_to_save_file = "user://game.cfg"
var location_now = "home"
var user_id = -1
var test_a = 0
var delta1
var hand_pos :Vector2
var mouse_pos
var do_magic
var player_pos_x :float
var player_pos_y :float
var loc :String
var has_saves = false
var save_player_pos_x :float
var save_player_pos_y :float
var tp_x :float
var tp_y :float
var f :int
var tp :int = 0
var help_1 :bool = false
var help_2 :bool = false

func ready():
	OS.center_window()
	#if config.open("user://config.cfg") == OK:
		#no_saves != config.has_section_key("Player", "location_now") && config.has_section_key("Player", "player_position_x") && config.has_section_key("Player", "player_position_y")



func change_scene(scene_name):
	var next_scene = load(scene_name)
	if next_scene:
		var new_scene = next_scene.instance()
		var root = get_tree().get_root()
		var current_scene = root.get_child(root.get_child_count() - 1)
		root.remove_child(current_scene) #123
		current_scene.queue_free()
		root.add_child(new_scene)
		get_tree().set_current_scene(new_scene)
		
	else:
		print("Ошибка загрузки сцены:", scene_name)



func exit():
	get_tree().quit()



func save_game():
	has_saves = true
	config = ConfigFile.new()
	config.set_value("Player", "player_position_x", player_pos_x)
	config.set_value("Player", "player_position_y", player_pos_y)
	config.set_value("Player", "location_now", location_now)
	config.save(path_to_save_file)
	print("Игра сохранена")



func load_game():
	config = ConfigFile.new()
	config.load(path_to_save_file)
	
	location_now = config.get_value("Player", "location_now", location_now)
	save_player_pos_x = config.get_value("Player", "player_position_x", player_pos_x)
	save_player_pos_y = config.get_value("Player", "player_position_y", player_pos_y)
	
	loc="res://scenes/"+location_now+".tscn"
	#var game = load(loc).instance()
	has_saves = true
	change_scene(loc)
	
	print("Игра загружена")
#func pause(s=1):
	#get_tree().paused = bool(s)
	#Input.sem_mouse_mode(Input.MOUSE_MODE_CAPTURED if !s else Input.MOUSE_MODE_VISIBLE)
	
#func is_pause():
	#return get_tree().paused

func delete_save():
	config.clear()
