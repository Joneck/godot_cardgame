extends Node
@export var cards = []
#add card loader with stacking on different levels

var card = preload("res://scenes/cards/card.tscn")

func _ready():
	var instance = card.instantiate()
	instance.scale = Vector2(0.095,-0.095)
	instance.position = Vector2(515,515)
	add_child(instance)
	
	pass
	#add getting cards


func _on_enemy_targeted(_enemy):
	
	pass # Replace with function body.
