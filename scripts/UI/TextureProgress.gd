extends TextureProgress


func _ready():
	pass

func _physics_process(delta):
	if value == 100:
		modulate.a = move_toward(modulate.a, 0.0, delta)
		
