extends Sprite



func _on_Area2D_body_entered(body):
	self_modulate.a = 0.4


func _on_Area2D_body_exited(body):
	self_modulate.a = 1
