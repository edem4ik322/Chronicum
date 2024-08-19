extends StaticBody2D


func _ready():
	pass 


func _process(delta):
	var prog = $"../../..".prog
	if 0.3 < prog and prog < 0.7:
		$Light2D.enabled = false
		$AnimatedSprite.play("off")
	else:
		$Light2D.enabled = true
		$AnimatedSprite.play("on")
