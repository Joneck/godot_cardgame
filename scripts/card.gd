extends Sprite2D

func _input(event):
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT:
		if get_rect().has_point(to_local(event.position)):
			print("finish him")
			play_card()
			
			
func play_card():
	get_node('%enemy').visible = false
	queue_free()
	pass
