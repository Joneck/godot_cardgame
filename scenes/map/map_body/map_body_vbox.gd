extends VBoxContainer

var rooms = [preload('res://scenes/map/map_questionMark/map_questionMark.tscn')]

func generate():
	for i in range(5):
		var instance = rooms[0].instantiate()
		add_child(instance)
		instance.custom_minimum_size = Vector2(100,100)
		instance.size = Vector2(100,100)
	pass

func _ready():
	generate()
