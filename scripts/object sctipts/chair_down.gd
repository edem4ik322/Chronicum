extends StaticBody2D


func _ready():
	pass


func _on_Area2D_body_entered(body):
	$StoolUp.z_index=101


func _on_Area2D_body_exited(body):
	$StoolUp.z_index=0
