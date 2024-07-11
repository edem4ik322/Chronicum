extends StaticBody2D


func _on_Area2D_body_entered(body):
	$objects/Furnace.show()


func _on_Area2D_body_exited(body):
	$objects/Furnace.hide()
