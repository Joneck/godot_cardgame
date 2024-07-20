extends Node2D

func _ready():
	for child in get_node('Enemies').get_children():
		child.connect('end_of_fight', _on_end_of_fight)

func _on_end_of_fight():
	queue_free()
	for child in get_tree().get_root().get_children():
		child.show()
