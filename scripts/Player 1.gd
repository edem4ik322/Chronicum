extends KinematicBody2D

var speed = 100
var w=87
var a=65
var s=83
var d=68

var input_magic = []
const max_input_magic = 10
var spells = [
	[d, d],
	[a, w, d],
]
var fire_called = false
var fire_arrow = load("res://scenes/magic/fire_arrow.tscn").instance()
var direction
var mouse_position: Vector2
var magic_pos: Vector2
#remote func _set_pos(position):
	#global_transform.origin = position


func _ready():
	if Singleton.weather == "rain":
		if Singleton.location_now == "map":
			$AudioStreamPlayer.volume_db = -10
			$AudioStreamPlayer.stream = load("res://audio/rain/WE Light Outside Rain 1.mp3")
		else:
			$AudioStreamPlayer.volume_db = 0
			$AudioStreamPlayer.stream = load("res://audio/rain/WE Light Inside Rain 1.mp3")
		$AudioStreamPlayer.play()
	elif Singleton.weather == "clear":
		$AudioStreamPlayer.stop()
	if Singleton.location_now == "map":
		$shadow.show()
	else:
		$shadow.hide()
		
	if Singleton.f == 9:
		$CanvasLayer/Label.text = "Игра загружена"
		$CanvasLayer/Label.show()
		$Timer.start()
		
	#$"../Player1".position.x = Singleton.player_pos_x
	#$"../Player1".position.y = Singleton.player_pos_y
	#Singleton.load_game()

func _physics_process(_delta):
	if Singleton.pause == false:
		
		
		
		if $CanvasLayer/TextureProgress2.value!=100:
			$CanvasLayer/TextureProgress2.value = $CanvasLayer/TextureProgress2.value+0.05
		if Input.is_action_pressed("shift") and not Input.is_action_pressed("magic_button"):
			$CanvasLayer/TextureProgress.modulate.a = move_toward(modulate.a, 1.0, _delta)
			$CanvasLayer/TextureProgress.value = $CanvasLayer/TextureProgress.value-0.5
			if $CanvasLayer/TextureProgress.value>0:
				speed = 150
			else:
				speed = 100
		elif Input.is_action_pressed("alt"):
			speed = 50
			$CanvasLayer/TextureProgress.value = $CanvasLayer/TextureProgress.value+0.4
		else:
			speed = 100
			$CanvasLayer/TextureProgress.value = $CanvasLayer/TextureProgress.value+0.2
		
		var velocity = Vector2()
		if Input.is_action_pressed("TELEPORT"):
			$"../Player1".position = Singleton.mouse_pos
		if not Input.is_action_pressed("magic_button"):
			if Input.is_action_pressed("right"):
				velocity.x += 1
			if Input.is_action_pressed("left"):
				velocity.x -= 1
			if Input.is_action_pressed("down"):
				velocity.y += 1
			if Input.is_action_pressed("up"):
				velocity.y -= 1
			velocity = velocity.normalized() * speed
			move_and_slide(velocity, Vector2.UP)
		Singleton.hand_pos = $"../Player1/".position
		Singleton.player_pos_x = $"../Player1".position.x
		Singleton.player_pos_y = $"../Player1".position.y


		#if is_network_master(): #проверяем, что мы управляем одним основным игроком
		#position += velocity * delta
		#rpc_unreliable("_set_pos", global_transform.origin)  #координаты основного игрока отправляются для всех других игроков
		#move_and_slide(velocity, Vector2.UP)

func _process(_delta):
	if Singleton.pause == false:
		if Input.is_action_pressed("magic_button"):
			if not fire_called:
				$AnimatedSprite.play("stay")
			elif fire_called:
				$AnimatedSprite.play("Fire")
		else:
			if Input.is_action_pressed("left"):
				$AnimatedSprite.play("left")
			elif Input.is_action_pressed("right"):
				$AnimatedSprite.play("right")
			elif Input.is_action_pressed("down"):
				$AnimatedSprite.play("down")
			elif Input.is_action_pressed("up"):
				$AnimatedSprite.play("up")
			else:
				$AnimatedSprite.play("stay")


func _input(event):
	if event is InputEventMouseMotion:
		Singleton.mouse_pos = get_global_mouse_position()
	if event is InputEventKey:
		if event.is_action_pressed("esc"):
			if Singleton.pause == false:
				$CanvasLayer/Pause.show()
				Singleton.pause = true
			elif Singleton.pause == true:
				$CanvasLayer/Pause.hide()
				Singleton.pause = false
		if event.is_action_pressed("f5"):
			Singleton.f = 5
			Singleton.save_game()
			Singleton.f = 0
			$CanvasLayer/Label.text = "Игра сохранена"
			$CanvasLayer/Label.show()
			$Timer.start()
		if event.is_action_pressed("f9"):
			Singleton.f = 9
			Singleton.load_game()
			Singleton.f = 0
		
		if Singleton.pause == false:
			
			if Input.is_action_pressed("f6"):
				if Singleton.weather == "clear":
					if Singleton.location_now == "map":
						$AudioStreamPlayer.volume_db = -10
						$AudioStreamPlayer.stream = load("res://audio/rain/WE Light Outside Rain 1.mp3")
					else:
						$AudioStreamPlayer.volume_db = 0
						$AudioStreamPlayer.stream = load("res://audio/rain/WE Light Inside Rain 1.mp3")
					$AudioStreamPlayer.play()
					Singleton.weather = "rain"
					print("Начался дождь")
				elif Singleton.weather == "rain":
					
					$AudioStreamPlayer.stop()
					Singleton.weather = "clear"
					print("Дождь закончился")
			if Singleton.do_magic == true:
				if Input.is_action_pressed("magic_button"):
					if event.is_pressed():
						if input_magic.size() >= max_input_magic:
							input_magic.remove(0)
						if event.scancode != KEY_SPACE:
							input_magic.append(event.scancode)
							check_skill_activation()
							#print(input_magic)
				else:
					input_magic.clear()
					check_skill_activation()


func check_skill_activation():
	for i in range(spells.size()):
		var spell = spells[i]
		if input_magic.size() >= spell.size():
			var last_input = input_magic.slice(-spell.size(),input_magic.size())
			if last_input == spell:
				execute_spell(i)
				break



func execute_spell(spell_index):
	input_magic.clear()
	
	if spell_index == 0:
		magic_arrow()
	
	elif spell_index == 1:
		fire()



func fire():
	if fire_called == false:
		#print("Вызов огня!")
		fire_called = true
		input_magic.clear()
		$AnimatedSprite.play("Fire")
	elif fire_called == true:
		#print("Огонь убран")
		fire_called = false
		input_magic.clear()



func magic_arrow():
	if fire_called:
		if $CanvasLayer/TextureProgress2.value>=20:
			$CanvasLayer/TextureProgress2.value-=20
			var fire_arrow_instance = load("res://scenes/magic/fire_arrow.tscn").instance()
			fire_arrow_instance.position = Singleton.hand_pos
			get_parent().add_child(fire_arrow_instance)
			fire_called = false
			$AnimatedSprite.play("Magic_cast")
			#print("Огненная стрела!")
		
		


func _on_Timer_timeout():
	$CanvasLayer/Label.hide()
