extends Sprite


func _on_Area2D_body_entered(_body):
	self.modulate.a=0.4


func _on_Area2D_body_exited(_body):
	self.modulate.a=1
