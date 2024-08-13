extends Node

var value = 1
signal generate


func _on_slider_value_changed(slider_value):
	value = slider_value
	pass # Replace with function body.


func _on_button_up():
	print(value)
	
	pass # Replace with function body.
	
func generate_map(floor_number):	
	pass
