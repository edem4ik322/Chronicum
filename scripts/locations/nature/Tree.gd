tool
extends StaticBody2D

export var type= 1

func _ready():
	var sprite = "res://sprites/nature/objects/Wood_" + String(type) + ".png"
	$Wood1.texture = load(sprite)
	if type == 5:
		$Wood1.position.y = -17
	
