extends KinematicBody2D

var fire_arrow_speed = 150
var direction = Vector2()
var angle

func _ready():
	direction = Singleton.hand_pos.direction_to(Singleton.mouse_pos)
	angle = direction.angle() #В радианах
	#angle = rad2deg(angle) #В градусах
	global_rotation = angle
	if direction.x > 0:
		$FireArrow.scale.x = -1
	elif direction.x <=0:
		$FireArrow.scale.x = - 1
	print(direction.x)

func _on_Area2D_body_entered(_body):
	queue_free()

func _physics_process(_delta):
	move_and_slide(direction * fire_arrow_speed)
