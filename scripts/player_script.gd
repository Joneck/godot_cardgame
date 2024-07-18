extends Node2D

var lifePoints = 50
var mana = 3


func _process(delta):
	rotation += PI * delta * 20
	pass

func death():
	pass
