extends Node

var value = 1
var map_scene = preload("res://scenes/map/map_body/map_body.tscn")
var event = preload('res://scenes/map/map_questionMark/map_questionMark.tscn')
signal generate


func _on_slider_value_changed(slider_value):
	value = slider_value
	pass # Replace with function body.


func _on_button_up():
	for child in get_children():
		child.queue_free()
	
	var instance = map_scene.instantiate()
	add_child(instance)
	print(value)
	

func generate_map(floor_number):
	
	for map_floor in range(floor_number):
		var instance = event.instantiate()
		instance.position = Vector2(540, 360 + map_floor * 120)
		add_child(instance)
		print('hello',map_floor)
		
		pass
