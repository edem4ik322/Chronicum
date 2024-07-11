extends Camera2D

onready var zoomfactor = 1 #насколько далеко
onready var zoomspeed = 100 #скорость отдаления
onready var zoomstep = 0.01 #насколько сильно отдалять камеру
onready var factorstep = 0.01 #насколько быстро остановится

func _ready():
	pass 

func _process(delta):
	zoom.x=lerp(zoom.x, zoomfactor * zoom.x, zoomspeed * delta)
	zoom.y=lerp(zoom.y, zoomfactor * zoom.y, zoomspeed * delta)
	
	zoom.x = clamp(zoom.x, 0.3, 1)
	zoom.y = clamp(zoom.y, 0.3, 1)
	
	if zoomfactor > 1:
		zoomfactor -= factorstep
	elif zoomfactor < 1:
		zoomfactor += factorstep
func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_WHEEL_UP:
			zoomfactor -= zoomstep
		elif event.button_index == BUTTON_WHEEL_DOWN:
			zoomfactor += zoomstep
