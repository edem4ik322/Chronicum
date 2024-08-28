tool
extends StaticBody2D

export var type = 0

func _ready():
	var sprite = "res://sprites/nature/objects/Stone_" + String(type) + ".png"
	$Sprite.texture = load(sprite)
	if type == 1:
		$"2".disabled = true
		$"3".disabled = true
		$"4".disabled = true
	elif type == 2:
		$"1".disabled = true
		$"3".disabled = true
		$"4".disabled = true
	elif type == 3:
		$"1".disabled = true
		$"2".disabled = true
		$"4".disabled = true
	elif type == 4:
		$"1".disabled = true
		$"2".disabled = true
		$"3".disabled = true
