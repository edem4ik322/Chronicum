extends StaticBody2D

export var light = float()

func _ready():
	$Light2D.energy=light
